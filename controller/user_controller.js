const user = require("../models/user_model");

//crate user
exports.createUser = async (request, response) => {
  try {
    //crate and save new user
    const newUser = new user(request.body);
    await newUser.save();
    response.status(200).json(newUser);
  } catch (err) {
    response.status(400).json({ error: error.message });
  }
};

//get a single user
exports.getSingleUser = async (request, response) => {
  try {
    const userId = request.params.id.trim(); //get user id
    const singleUser = await user.findById(userId); //get user by id
    if (!singleUser) {
      response.status(404).json({ error: "USER NOT FOUND" });
    } else {
      response.status(200).json(singleUser);
    }
  } catch (err) {
    response.status(400).json({ error: error.message });
  }
};
//get all users
exports.getAllUser = async (request, response) => {
  try {
    const allUsers = await user.find(); //get all users
    if (!allUsers) {
      response.status(404).json({ error: "USER NOT FOUND" });
    } else {
      response.status(200).json(allUsers);
    }
  } catch (err) {
    response.status(400).json({ error: error.message });
  }
};
//update users
exports.updateUser = async (request, response) => {
  try {
    const userId = request.params.id.trim(); //get user id
    const updatedUser = await user.findByIdAndUpdate(userId, request.body, {
      //search and update user details
      new: true,
      runValidators: true,
    });
    if (!updatedUser) {
      response.status(404).json({ error: "USER NOT FOUND" });
    } else {
      response.status(200).json(updatedUser);
    }
  } catch (err) {
    response.status(400).json({ error: error.message });
  }
};
//delete user
exports.deleteUser = async (request, response) => {
  try {
    const userId = request.params.id.trim(); //get user id
    const deletedUser = await user.findByIdAndDelete(userId); //delete user
    if (!deletedUser) {
      response.status(404).json({ error: "USER NOT FOUND" });
    } else {
      response.status(200).json(deletedUser);
    }
  } catch (err) {
    response.status(400).json({ error: error.message });
  }
};
