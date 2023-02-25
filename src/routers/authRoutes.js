import express from 'express';
import { signUpSchema } from '../schemas/signupSchema.js';
import { signInSchema } from '../schemas/signinSchema.js';
import { schemaValidation } from '../middlewares/signUp/schemaValidation.js';
import verifyDoubleEmail from '../middlewares/signUp/verifyDoubleEmail.js';
import { postSignUp } from '../controllers/autentication/postSignup.js';
import { postSignIn } from '../controllers/autentication/postSignIn.js';
import { createToken } from '../middlewares/token/createToken.js';
import { verifyToken } from '../middlewares/token/verifyToken.js';


const authRoutes = express.Router();

authRoutes.post("/signup", schemaValidation(signUpSchema), verifyDoubleEmail,postSignUp);
authRoutes.post("/signin", schemaValidation(signInSchema), postSignIn, createToken, verifyToken);

export default authRoutes;


