const express = require("express");
const router = express.Router();
const Course = require("../models/courses.model");


dummydata = [
    {"coursename":"python","courseimg":"dummy.img","coursedec":"This is an nice course"},
    {"coursename":"java","courseimg":"dummy.img","coursedec":"This is an nice course"},
    {"coursename":"C++","courseimg":"dummy.img","coursedec":"This is an nice course"},
    {"coursename":"C","courseimg":"dummy.img","coursedec":"This is an nice course"},
    {"coursename":"MySql","courseimg":"dummy.img","coursedec":"This is an nice course"},
    {"coursename":"Node JS","courseimg":"dummy.img","coursedec":"This is an nice course"},
]

router.route('/data').get((req,res) => {
    res.send(dummydata);
});