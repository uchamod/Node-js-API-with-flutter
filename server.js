
//sever
const express = require("express");
const cors = require("cors");
const dotnev = require("dotenv");
const mongooes = require("mongoose");

//configure dotenv
dotnev.config();

//import express app

app = express();
app.use(cors());

//init port

const PORT = process.env.PORT || 5000;

//middleware
app.use(express.json());


//connct mongodb
mongooes.connect(process.env.MONGODB_URI).then(() => console.log("conncetion succsussfuly")).catch((err) => console.error("connection failed", err));

//start the server

app.listen(PORT, () => {
    console.log(`server has started ${PORT}`);
});
