const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const Course = Schema({
  coursename: {
    type: String,
    required: true,
  },
  courseimg: {
    type: String,
    required: true,
  },
  coursedec: {
    type: String,
    required: true,
  },
});

module.exports = mongoose.model("Course", Course);