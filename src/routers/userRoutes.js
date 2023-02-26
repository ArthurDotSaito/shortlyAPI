import express from 'express';
import { getUser } from '../controllers/user/getUser.js';
import { validateToken } from '../middlewares/token/validateToken.js';

const userRoutes = express.Router();

userRoutes.get('/users/me', validateToken, getUser)

export default userRoutes;