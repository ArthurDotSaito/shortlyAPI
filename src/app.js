import express, { urlencoded } from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import authRoutes from './routers/authRoutes.js'
import urlRoutes from './routers/urlRoutes.js';
import userRoutes from './routers/userRoutes.js';
import rankingRoutes from './routers/rankingRoutes.js';

dotenv.config();
const app = express();
const port = process.env.PORT || 5000;

app.use(express.json());
app.use(cors());

app.use([authRoutes, urlRoutes, userRoutes, rankingRoutes]);

app.listen(port, (error) =>{
    if(error) return console.log("Unable to listen server");
    console.log(`server is running on port ${port}`);
})