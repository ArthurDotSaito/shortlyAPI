import express from 'express';
import { getRanking } from '../controllers/ranking/getRanking.js';

const rankingRoutes = express.Router();

rankingRoutes.get("/ranking", getRanking);

export default rankingRoutes;
