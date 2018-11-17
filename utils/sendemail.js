'use strict'

const nodemailer = require('nodemailer')

const emailClient = {
  GMAIL: {
    host: 'smtp.gmail.com',
    port: 465
  },
  HOTMAIL: {
    host: 'smtp-mail.outlook.com',
    port: 587
  }
}

const SendEmail = (Nombres_Apellidos,email) => {

    let transporter = nodemailer.createTransport({
      host: emailClient.GMAIL.host,
      secureConnection: false,
      port: emailClient.GMAIL.port,
      tls: {
        ciphers: 'SSLv3'
      },
      auth: {
        user: 'driversystemd@gmail.com',
        pass: 'SystemD123'
      }
    })

    let mailOptions = {
      from: '"Driver" ',
      to: email,
      subject: 'Registro Driver ',
      text: 'Registro Driver!',
      html: `Hola <b>${Nombres_Apellidos}<b>, gracias por registrarte en Driver!`
    }

    transporter.sendMail(mailOptions, function (error, info) {
      if (error){
        console.log(error)
      }else{
        console.log(`Email enviado correctamente --> [${email}]`)
      }
    })
  }

module.exports= SendEmail