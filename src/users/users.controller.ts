import {
  Controller,
  Req,
  Get,
  Post,
  Body,
  //Patch,
  Param,
  //Delete,
  UseGuards,
} from '@nestjs/common';
import { Request } from 'express';
import { UsersService } from './users.service';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { CreateUserDto } from './dto/create-user.dto';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Post('register')
  async registerUser(@Body() createUserDto: CreateUserDto) {
    return this.usersService.createUser(createUserDto);
  }

  @UseGuards(JwtAuthGuard)
  @Get('permissions/:resource')
  async getPermissions(
    @Param('resource') resource: string,
    @Req() req: Request,
  ) {
    const b: any = req.user;
    return this.usersService.getPermissions(resource, b.userId);
  }

  @UseGuards(JwtAuthGuard)
  @Get('menu')
  async getMenu(@Req() req: Request) {
    const b: any = req.user;
    return this.usersService.getMenu(b.userId);
  }
}
