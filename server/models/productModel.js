//import database connection
import db from "../database/db.js";
import { DataTypes } from "sequelize";

const ProductModel = db.define('productos', {
    name: {type: DataTypes.STRING},
    details: {type: DataTypes.STRING},
    price: {type: DataTypes.INTEGER},
    stockMin: {type: DataTypes.INTEGER},
    stockMax: {type: DataTypes.INTEGER},
    stockCurrent: {type: DataTypes.INTEGER}
}, {
    createdAt: false,
    updatedAt: false
});

ProductModel.sync({alter:true})

export default ProductModel;