import { Module } from '@nestjs/common';
import { InspectorService } from './inspector.service';
import { InspectorController } from './inspector.controller';
import { PrismaService } from 'src/prisma.service';
//import { UsersModule } from '../users/users.module';
import { UsersService } from 'src/users/users.service';

@Module({
  controllers: [InspectorController],
  providers: [InspectorService, PrismaService, UsersService],
})
export class InspectorModule {}
