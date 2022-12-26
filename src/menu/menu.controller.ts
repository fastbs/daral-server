import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  UseGuards,
  UploadedFile,
  UseInterceptors,
  Req,
  Res,
} from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { imageFileFilter } from './file-upload.utils';
import { Express, Request, Response } from 'express';
import { MenuService } from './menu.service';
import { CreateMenuDto } from './dto/create-menu.dto';
import { UpdateMenuDto } from './dto/update-menu.dto';
import { Roles } from '../auth/roles.decorator';
import { RolesGuard } from 'src/auth/roles.guard';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { rename } from 'node:fs/promises';

const filepath = 'uploads';

@Controller('resource/menu')
export class MenuController {
  constructor(private readonly menuService: MenuService) {}

  @Get()
  @Roles('Admin', 'User')
  @UseGuards(JwtAuthGuard, RolesGuard)
  findAll() {
    return this.menuService.findAll();
  }

  @Get('categories')
  @Roles('Admin', 'User')
  @UseGuards(JwtAuthGuard, RolesGuard)
  getCategories() {
    return this.menuService.getCategories();
  }

  @Get(':id')
  @Roles('Admin', 'User')
  @UseGuards(JwtAuthGuard, RolesGuard)
  findOne(@Param('id') id: number) {
    return this.menuService.findOne(+id);
  }

  @Post()
  @Roles('Admin')
  @UseGuards(JwtAuthGuard, RolesGuard)
  @UseInterceptors(
    FileInterceptor('attachment', {
      dest: './uploads',
      fileFilter: imageFileFilter,
    }),
  )
  async create(
    @UploadedFile() file: Express.Multer.File,
    @Body() createMenuDto: CreateMenuDto,
  ) {
    createMenuDto.categoryId = Number(createMenuDto.categoryId);
    const result = await this.menuService.create(createMenuDto);

    if (file) {
      const newfilename = `${String(result.menu.id).padStart(6, '0')}-${file.originalname}`;
      const newpath = `${filepath}\\${newfilename}`;
      rename(file.path, newpath);
      await this.menuService.addImageRecord(newfilename, result.menu.id);
    }

    return result;
  }

  @Patch(':id')
  @Roles('Admin')
  @UseGuards(JwtAuthGuard, RolesGuard)
  @UseInterceptors(
    FileInterceptor('attachment', {
      dest: './uploads',
      fileFilter: imageFileFilter,
    }),
  )
  async update(
    @UploadedFile() file: Express.Multer.File,
    @Param('id') id: string,
    @Body() updateMenuDto: UpdateMenuDto, //@Param('id') id: string, @Body() updateMenuDto: UpdateMenuDto) {
  ) {
    console.log(' umdto: ', updateMenuDto);
    console.log(' file: ', file);
    updateMenuDto.id = Number(updateMenuDto.id);
    updateMenuDto.categoryId = Number(updateMenuDto.categoryId);
    const result = await this.menuService.update(+id, updateMenuDto);

    if (file) {
      const newfilename = `${String(result.menu.id).padStart(6, '0')}-${file.originalname}`;
      const newpath = `${filepath}\\${newfilename}`;
      rename(file.path, newpath);
      await this.menuService.addImageRecord(newfilename, +id);
    }

    return result;
  }

  @Delete(':id')
  @Roles('Admin')
  @UseGuards(JwtAuthGuard, RolesGuard)
  remove(@Param('id') id: string) {
    return this.menuService.remove(+id);
  }

  @Get('image/:id')
  async getImage(@Param('id') id: number, @Res() res: Response) {
    const result = await this.menuService.findOne(+id);
    let filename = '';
    if (result && result.menu && result.menu.filename) {
      filename = result.menu.filename;
    }
    const options = {
      root: `./${filepath}`,
    };

    if (filename) {
      return res.sendFile(filename, options);
    } else {
      return res.status(404).send('No image!');
    }
  }
}
