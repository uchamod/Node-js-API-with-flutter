const mongoes = require("mongoose");

const User = new mongoes.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  email: {
    type: String,
    required: true,
    unique: true,
    trim: true,
  },
  age: {
    type: Number,
    required: true,
  },
});

//crate cluster according to schema
const UserReference = mongoes.model("Users", User);

module.exports = UserReference;
