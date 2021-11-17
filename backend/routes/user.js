const express = require("express");
const User = require('../models/user.model');
const router = express.Router();

router.route("/register").post((req, res) => {
    const user = new User({
      username: req.body.username,
      password: req.body.password,
      email: req.body.email,
    });
    user
      .save()
      .then(() => {
        console.log("user registered");
        res.status(200).json({ msg: "User Successfully Registered" });
      })
      .catch((err) => {
        res.status(403).json({ msg: err });
      });
  });

router.route("/login").post((req,res) => {
    User.findOne({email:req.body.email}, (err,result) => {
      if(err){
        return res.status(500).json("error");
      }
      if(result === null){
        return res.status(403).json("username is wrong");
      }
      if(result.password === req.body.password){
        res.json("logined int");
      }else{
        res.status(403).json("password is wrong");
      }
    });
});

  module.exports = router;