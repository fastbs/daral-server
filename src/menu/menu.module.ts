import { Module } from '@nestjs/common';
import { MenuService } from './menu.service';
import { MenuController } from './menu.controller';
import { PrismaService } from 'src/prisma.service';
//import { UsersModule } from '../users/users.module';
import { UsersService } from 'src/users/users.service';

@Module({
  controllers: [MenuController],
  providers: [MenuService, PrismaService, UsersService],
})
export class MenuModule {}
