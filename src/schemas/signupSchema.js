import Joi from "joi";

export const signUpSchema = Joi.object({
    name: Joi.string().required(),
    email: Joi.string().min(3).email().required(),
    password: Joi.string().required(),
    confirmPassword: Joi.ref('password'),

})