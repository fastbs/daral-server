import { Injectable, CanActivate, ExecutionContext } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
//import { AnyFilesInterceptor } from '@nestjs/platform-express';
import { UsersService } from 'src/users/users.service';

@Injectable()
export class RolesGuard implements CanActivate {
  constructor(
    private reflector: Reflector,
    private readonly usersService: UsersService,
  ) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const roles = this.reflector.get<string[]>('roles', context.getHandler());

    if (!roles) {
      return true;
    }

    const request = context.switchToHttp().getRequest();
    const user = request.user;
    const userRoles = await this.usersService.getUserRoles(user.userId);
    let result = false;

    roles.forEach((el) => {
      if (userRoles.find((x: any) => x.role.name == el)) {
        result = true;
      }
      //userRoles.forEach((ur: any) => {
      //  if (ur.role.name == el) {
      //    result = true;
      //  }
      //});
    });
    return result;
  }
}
