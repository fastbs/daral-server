import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma.service';
import { User } from '@prisma/client';
import { CreateUserDto } from './dto/create-user.dto';

@Injectable()
export class UsersService {
  constructor(private prisma: PrismaService) {}

  async createUser(createUserDto: CreateUserDto) {
    const { name, email, password } = createUserDto;
    await this.prisma.user.create({
      data: {
        name,
        email,
        password,
        userRoles: {
          create: {
            roleId: 2,
          },
        },
      },
    });

    return true;
  }

  async getUserRoles(userId: number) {
    const result = await this.prisma.userRole.findMany({
      where: {
        userId: userId,
      },
      include: {
        role: true,
      },
    });

    return result;
  }

  async findOne(username: string): Promise<User | null> {
    return this.prisma.user.findFirst({
      where: {
        name: username,
        id: {
          gt: 0,
        },
      },
    });
  }

  async getPermissions(resource: string, userId: number) {
    const result = await this.prisma.$queryRaw`SELECT DISTINCT t4."name"
    FROM PUBLIC."User" AS t1, PUBLIC."UserRole" AS t2, PUBLIC."Resource" AS t3, PUBLIC."ResourceAction" AS t4, PUBLIC."ResourceActionRoles" AS t5 
    WHERE t1."id"=${userId} AND t3."route"=${resource} AND t2."userId"=t1."id" AND t4."resourceId"=t3."id" AND t5."resourceActionId"=t4."id" AND t5."roleId"=t2."roleId";`;

    return { permissions: result };
  }

  async getMenu(userId: number) {
    const result = await this.prisma.$queryRaw`SELECT distinct t1.*
    FROM public."Menu" AS t1, PUBLIC."MenuRole" AS t2, PUBLIC."Role" AS t3, PUBLIC."User" AS t4, PUBLIC."UserRole" AS t5
    WHERE t4."id"=${userId} AND t5."userId"=t4."id" AND t5."roleId"=t2."roleId" AND t2."menuId"=t1.id
    ORDER BY t1."order";`;

    return { menu: result };
  }
}
