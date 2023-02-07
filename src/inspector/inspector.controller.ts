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
  Res,
} from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { imageFileFilter } from './file-upload.utils';
import { Express, Response } from 'express';
import { InspectorService } from './inspector.service';
import { CreateInspectorDto } from './dto/create-inspector.dto';
import { UpdateInspectorDto } from './dto/update-inspector.dto';
import { Roles } from '../auth/roles.decorator';
import { RolesGuard } from 'src/auth/roles.guard';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { rename } from 'node:fs/promises';

const filepath = 'uploads';

@Controller('resource/inspector')
export class InspectorController {
  constructor(private readonly inspectorService: InspectorService) {}

  @Get()
  @Roles('Admin', 'User')
  @UseGuards(JwtAuthGuard, RolesGuard)
  findAll() {
    return this.inspectorService.findAll();
  }

  @Get('categories')
  @Roles('Admin', 'User')
  @UseGuards(JwtAuthGuard, RolesGuard)
  getCategories() {
    return this.inspectorService.getCategories();
  }

  @Get(':id')
  @Roles('Admin', 'User')
  @UseGuards(JwtAuthGuard, RolesGuard)
  findOne(@Param('id') id: number) {
    return this.inspectorService.findOne(+id);
  }

  @Post()
  @Roles('Admin', 'Publisher')
  @UseGuards(JwtAuthGuard, RolesGuard)
  @UseInterceptors(
    FileInterceptor('attachment', {
      dest: './uploads',
      fileFilter: imageFileFilter,
    }),
  )
  async create(
    @UploadedFile() file: Express.Multer.File,
    @Body() createInspectorDto: CreateInspectorDto,
  ) {
    createInspectorDto.categoryId = Number(createInspectorDto.categoryId);
    const result = await this.inspectorService.create(createInspectorDto);

    if (file) {
      const newfilename = `${String(result.inspector.id).padStart(6, '0')}-${
        file.originalname
      }`;
      const newpath = `${filepath}\\${newfilename}`;
      rename(file.path, newpath);
      await this.inspectorService.addImageRecord(
        newfilename,
        result.inspector.id,
      );
    }

    return result;
  }

  @Patch(':id')
  @Roles('Admin', 'Publisher')
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
    @Body() updateInspectorDto: UpdateInspectorDto, //@Param('id') id: string, @Body() updateInspectorDto: UpdateInspectorDto) {
  ) {
    console.log(' umdto: ', updateInspectorDto);
    console.log(' file: ', file);
    updateInspectorDto.id = Number(updateInspectorDto.id);
    updateInspectorDto.categoryId = Number(updateInspectorDto.categoryId);
    const result = await this.inspectorService.update(+id, updateInspectorDto);

    if (file) {
      const newfilename = `${String(result.inspector.id).padStart(6, '0')}-${
        file.originalname
      }`;
      const newpath = `${filepath}\\${newfilename}`;
      rename(file.path, newpath);
      await this.inspectorService.addImageRecord(newfilename, +id);
    }

    return result;
  }

  @Delete(':id')
  @Roles('Admin', 'Publisher')
  @UseGuards(JwtAuthGuard, RolesGuard)
  remove(@Param('id') id: string) {
    return this.inspectorService.remove(+id);
  }

  @Get('image/:id')
  async getImage(@Param('id') id: number, @Res() res: Response) {
    const result = await this.inspectorService.findOne(+id);
    let filename = '';
    if (result && result.inspector && result.inspector.filename) {
      filename = result.inspector.filename;
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
