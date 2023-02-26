import express from 'express';
import { postShortenedUrl } from '../controllers/url/postShortenedUrl.js';
import { schemaValidation } from '../middlewares/signUp/schemaValidation.js';
import { validateToken } from '../middlewares/token/validateToken.js';
import {urlSchema} from '../schemas/urlSchema.js';
import { getShortenedUrl } from '../controllers/url/getShortenedUrl.js';
import { openShortenedUrl } from '../controllers/url/openShortenedUrl.js';

const urlRoutes = express.Router();

urlRoutes.post("/urls/shorten", schemaValidation(urlSchema), validateToken, postShortenedUrl);
urlRoutes.get("/urls/:id",  getShortenedUrl);
urlRoutes.get("/urls/open/:shortUrl", openShortenedUrl);


export default urlRoutes;