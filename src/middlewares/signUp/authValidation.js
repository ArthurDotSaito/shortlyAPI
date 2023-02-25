import {sanitize} from '../utils/sanitize.js'

export function authValidation(schema){
    return (req, res, next) =>{
        const data = sanitize({...req.body});
        const validation = schema.validate(data, {abortEarly: false});

        if(validation.error){
            const errorMessage = error.details.map(err => err.message).join(", ");
            return res.status(422).json({message: errorMessage});
        } 
        next();
    }
}