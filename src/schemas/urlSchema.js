import Joi from "joi";

const urlRegex = /^https?:\/\/.*$/;

export const urlSchema = Joi.object({
    url: Joi.string().regex(urlRegex).required()
})