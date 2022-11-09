const jwt = require('jsonwebtoken');
const { response } = require('express');
const Usuario = require('../models/usuario');
const bcrypt = require('bcryptjs');

const validarJWT = async (req, res = response, next) => {

    const token = req.header('x-token');

    if (!token) {
        return res.status(401).json({
            ok: false,
            msg: 'No hay token en la petición'
        });
    }

    try {

        const { uid } = jwt.verify(token, process.env.JWT_KEY);

        req.uid = uid;

        // leer el usuario que corresponde al uid
        const usuario = await Usuario.findById(uid);

        if (!usuario) {
            return res.status(401).json({
                ok: false,
                msg: 'Token no válido - usuario no existe en DB'
            });
        }

        // Verificar si el uid tiene estado true
        /*if (!usuario.estado) {
            return res.status(401).json({
                ok: false,
                msg: 'Token no válido - usuario con estado: false'
            });
        }*/

        req.usuario = usuario;

        next();

    } catch (error) {
        console.log(error);
        res.status(401).json({
            ok: false,
            msg: 'Token no válido'
        });
    }

}

module.exports = {
    validarJWT
}