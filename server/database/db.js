import {Sequelize} from 'sequelize';

const db = new Sequelize('db_reactprueba', 'root', 'SantiagoTorifa03060187',{
    host: 'localhost',
    dialect: 'mysql'
});

export default db;