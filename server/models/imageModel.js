import db from "../database/db.js";
import { DataTypes  } from "sequelize";

const ImageModel = db.define('images', {
    idProduct: {type: DataTypes.INTEGER},
    image1: {type: DataTypes.TEXT('medium')},
}, {
    createdAt: false,
    updatedAt: false
});

ImageModel.sync({alter:true})

export default ImageModel;