import ProductModel from "../models/productModel.js";
import { productsStock, productMinStock } from "../app.js"
import { sendMail } from "../mail/mailer.js";
import Stripe from "stripe";

// almascenando la clave privada en una constante
const stripe = new Stripe('sk_test_51MXVHeI1sbCVDW7s9uwcW28rRE4fu8Wg8Z1HZwne3vYzW6ss5Bi0k0hxAteiqEnUNfmwFOatt8Jse5N8nSuJnxZP00IyUW9FqS');

export const getAllProducts = async (req, res) => {
    try {
        const productos = await ProductModel.findAll({
            order: [
                ['id', 'ASC']
            ]
        });
        res.json(productos);
    } catch (error) {
        res.json({ message: error.message })
    }
}

export const getProduct = async (req, res) => {
    try {
        const productos = await ProductModel.findAll({
            where: { id: req.params.id }
        })
        res.json(productos[0]);
    } catch (error) {
        res.json({ message: error.message });
    }
}

export const updateProduct = async (req, res) => {
    try {
        await ProductModel.update(req.body, {
            where: { id: req.params.id }
        });
        productsStock[req.params.id] = req.body.stockCurrent;
        productMinStock[req.params.id] = req.body.stockMin;
        console.log(productStock);
        console.log(productMinStock);
        res.json('Registro actualizado correctamente')
    } catch (error) {
        res.json({ message: error });
    }
}

export const bookProduct = (req, res) => {
    try {
        if (req.query.f === 'unbook') {
            productsStock[req.params.id]++;
            return res.json('Unbooked');
        } else if (req.query.f === 'book') {
            if (productsStock[req.params.id] == 0) return res.json('Stockout')
            productsStock[req.params.id]--;
            return res.json('Booked');
        }
        res.status(400).json('Bad request');
    } catch (error) {
        res.json({ message: error.message });
    }
}


const updateContent = async (product, quantity) => {
    const stock = await ProductModel.findAll({
        attributes: ['id', 'stockCurrent'],
        where: { id: product }
    })
    await ProductModel.update({ stockCurrent: stock[0].dataValues.stockCurrent - quantity[product] }, {
        where: { id: product }
    })
    if (productMinStock[product].stockMin >= stock[0].dataValues.stockCurrent - quantity[product]) {
        sendMail({ id: product, name: productMinStock[product].name });
    }
}

export const buyProducts = async (req, res) => {
    let preference = {
        items: [],
        back_urls: {
            success: "http://localhost:3000/feedback",
            failure: "http://localhost:3000/failure",
            pending: "http://localhost:3000/pending"
        },
        auto_return: "approved",
    };
    Object.keys(req.body).forEach(id => {
        preference.items.push({
            title: productMinStock[id].name,
            unit_price: productMinStock[id].price,
            quantity: req.body[id]
        })
    })

    try {
        // guardando en una constante los datos que estan dentro del request.body
        const { id, amount } = req.body;
        // proceso de pago
        const payinfo = await stripe.paymentIntents.create({
            amount,
            currency: "COP",
            description: "",
            payment_method: id,
            confirm: true
        });
        // envio la informacion del pago por consola
        console.log(payinfo);
    } catch (error) {
        res.json({ message: error.raw.message })
    }

    Object.keys(req.body).forEach(product => updateContent(product, req.body));
}