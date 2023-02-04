import db from "../database/db.js"
import { DataTypes } from "sequelize"

const UserModel = db.define('users', {
    username: {type: DataTypes.STRING},
    password: {type: DataTypes.STRING},
    phone: {type: DataTypes.INTEGER},
    email: {type: DataTypes.STRING},
    isAdmin: {
        type: DataTypes.BOOLEAN,
        defaultValue: false
    },
    address: {type: DataTypes.STRING}
}, {
    createdAt: false,
    updatedAt: false
})

UserModel.sync({alter:true})

export default UserModel;