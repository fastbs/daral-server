import { Injectable, NestMiddleware } from '@nestjs/common';
import { Request, Response, NextFunction } from 'express';

@Injectable()
export class LoggerMiddleware implements NestMiddleware {
  use(req: Request, res: Response, next: NextFunction) {
    const now = new Date();
    console.log('\n\x1B[1;37;44mNow: ', now.toString(), ' \x1B[0m');
    console.log('baseUrl: ', req.baseUrl);
    next();
  }
}
