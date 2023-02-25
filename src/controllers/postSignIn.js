import db from "../database/databaseConnection.js";

export const postSignIn = async (req, res) =>{
    const {name, password} = req.body;

    try{
        await db.query({
            text:'INSERT INTO userRegister (name, email, password, confirmPassword) VALUES ($1, $2, $3, $4)',
            values: [name, email, password, confirmPassword],
        })
        res.sendStatus(201)
    }catch(error){
        console.log("Erro no postCustomers!");
        res.status(500).send(error.message);
    }
}