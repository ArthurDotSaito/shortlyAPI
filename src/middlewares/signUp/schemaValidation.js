import {sanitize} from '../utils/sanitize.js'

export function schemaValidation(schema){
    return (req, res, next) =>{
        const data = sanitize({...req.body});
        const validation = schema.validate(data, {abortEarly: false});

        if(validation.error){
            const errorMessage = validation.error.details.map(err => err.message).join(", ");
            return res.status(422).json({message: errorMessage});
        } 
        next();
    }
}