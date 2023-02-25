import express from 'express';
import { postShortenedUrl } from '../controllers/url/postShortenedUrl.js';
import { schemaValidation } from '../middlewares/signUp/schemaValidation.js';
import { validateToken } from '../middlewares/token/validateToken.js';
import {urlSchema} from '../schemas/urlSchema.js'

const urlRoutes = express.Router();

urlRoutes.post("/urls/shorten", schemaValidation(urlSchema), validateToken, postShortenedUrl);

export default urlRoutes;