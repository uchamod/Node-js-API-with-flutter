//imports
const express = require("express");
const route = express.Router();
const userController = require("../controller/user_controller");
//initialize end points
route.post("/create", userController.createUser);
route.get("/getUser/:id", userController.getSingleUser);
route.get("/getAllUser", userController.getAllUser);
route.put("/updateUser/:id", userController.updateUser);
route.delete("/deleteUser/:id", userController.deleteUser);

//export module
module.exports = route;
