import express from 'express';
import { signUpSchema } from '../schemas/signupSchema.js';
import { signInSchema } from '../schemas/signinSchema.js';
import { authValidation } from '../middlewares/authValidation.js';
import verifyDoubleEmail from '../middlewares/verifyDoubleEmail.js';
import { postSignUp } from '../controllers/postSignup.js';
import { postSignIn } from '../controllers/postSignIn.js';


const authRoutes = express.Router();
console.log("authroutes");

authRoutes.post("/signup", authValidation(signUpSchema), verifyDoubleEmail,postSignUp);
authRoutes.post("/signin", authValidation(signInSchema), postSignIn);

export default authRoutes;


