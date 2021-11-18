const express = require('express');
const mongoose = require('mongoose');
const app = express();
app.use(express.json());
const userRoute = require("./routes/user");
app.use("/user", userRoute);
const courseRoute = require("./routes/course");
app.use("/course",courseRoute);


mongoose.connect("mongodb+srv://syamsundar:syamsundar@cluster0.s8gms.mongodb.net/free-learning?retryWrites=true&w=majority",{useNewUrlParser: true, useUnifiedTopology: true}).then(
    () => {
        console.log('connected success');
    }
).catch( (err) => {
    console.log(err);
} );



app.get('/',(req,res) => {
    res.send("server is running fine");
});

const port = process.env.PORT || 3000;

app.listen(port, () => {console.log(`listing to ${port}`);});

