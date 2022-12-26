import { Injectable } from '@nestjs/common';
import { CreateMenuDto } from './dto/create-menu.dto';
import { UpdateMenuDto } from './dto/update-menu.dto';
import { PrismaService } from '../prisma.service';
import { UsersService } from 'src/users/users.service';
import { Prisma } from '@prisma/client';
import { resourceLimits } from 'worker_threads';

@Injectable()
export class MenuService {
  constructor(
    private prisma: PrismaService,
    private readonly usersService: UsersService,
  ) {}

  async create(createMenuDto: CreateMenuDto) {
    console.log(typeof createMenuDto.categoryId);
    const result = await this.prisma.resMenuItem.create({
      data: {
        name: createMenuDto.name,
        description: createMenuDto.description,
        categoryId: createMenuDto.categoryId,
      },
    });
    return { menu: result };
  }

  async addImageRecord(filename: string, id: number) {
    const result = await this.prisma.resMenuItem.update({
      where: {
        id: id,
      },
      data: {
        filename: filename,
      },
    });

    console.log('   -> image: ', result);
    return { image: result };
  }

  async findAll() {
    const result = await this.prisma.resMenuItem.findMany({
      include: {
        category: true,
      },
      orderBy: {
        id: 'asc',
      },
    });
    return { menu: result };
  }

  async findOne(id: number) {
    const result = await this.prisma.resMenuItem.findFirst({
      where: {
        id: id,
      },
      include: {
        category: true,
      },
    });
    return { menu: result };
  }

  async update(id: number, updateMenuDto: UpdateMenuDto) {
    const result = await this.prisma.resMenuItem.update({
      where: {
        id: id,
      },
      data: updateMenuDto,
      include: {
        category: true,
      },
    });
    return { menu: result };
  }

  async remove(id: number) {
    const result = await this.prisma.resMenuItem.delete({
      where: {
        id: id,
      },
    });
    return result;
  }

  async getCategories() {
    const result = await this.prisma.resMenuCategory.findMany({});
    return { categories: result };
  }
}
