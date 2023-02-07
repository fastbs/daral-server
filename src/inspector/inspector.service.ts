import { Injectable } from '@nestjs/common';
import { CreateInspectorDto } from './dto/create-inspector.dto';
import { UpdateInspectorDto } from './dto/update-inspector.dto';
import { PrismaService } from '../prisma.service';
import { UsersService } from 'src/users/users.service';
import { Prisma } from '@prisma/client';
import { resourceLimits } from 'worker_threads';

@Injectable()
export class InspectorService {
  constructor(
    private prisma: PrismaService,
    private readonly usersService: UsersService,
  ) {}

  async create(createInspectorDto: CreateInspectorDto) {
    console.log(typeof createInspectorDto.categoryId);
    const result = await this.prisma.inspectorItem.create({
      data: {
        name: createInspectorDto.name,
        description: createInspectorDto.description,
        categoryId: createInspectorDto.categoryId,
      },
    });
    return { inspector: result };
  }

  async addImageRecord(filename: string, id: number) {
    const result = await this.prisma.inspectorItem.update({
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
    const result = await this.prisma.inspectorItem.findMany({
      include: {
        category: true,
      },
      orderBy: {
        id: 'asc',
      },
    });
    return { inspector: result };
  }

  async findOne(id: number) {
    const result = await this.prisma.inspectorItem.findFirst({
      where: {
        id: id,
      },
      include: {
        category: true,
      },
    });
    return { inspector: result };
  }

  async update(id: number, updateInspectorDto: UpdateInspectorDto) {
    const result = await this.prisma.inspectorItem.update({
      where: {
        id: id,
      },
      data: updateInspectorDto,
      include: {
        category: true,
      },
    });
    return { inspector: result };
  }

  async remove(id: number) {
    const result = await this.prisma.inspectorItem.delete({
      where: {
        id: id,
      },
    });
    return result;
  }

  async getCategories() {
    const result = await this.prisma.inspectorCategory.findMany({});
    return { categories: result };
  }
}
