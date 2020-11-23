/*
Notes:
    - Download postman to check data being sent to and from our server port
    - review js DB lecture 
*/

// Express server components
const express = require('express');

const app = express();

const sqlite3 = require('sqlite3').verbose();

const cors = require("cors");

//path module helps locate directories for file reads/transfers 
const path = require('path');

//imported functions
const logger = require('./middleware/logger'); //logger 
const employees = require('./tst'); //employees dummy DB imported



//create port from local process environment or 5000
const PORT = process.env.PORT || 5000;

// Access the database
let db = new sqlite3.Database('./data/relate.sqlite', sqlite3.OPEN_READWRITE, (err) => {
    if (err) {
        return console.error(err.message);
    }
    console.log('Connected to database.');
});

//middleware functions

//makes folder 'public' static so easily accessible may get 
//may need to delete once new routes are created
app.use(express.static(path.join(__dirname, 'public')));
app.use(cors()); //enables cross origin requests
app.use(express.json()); //can now handle raw json data (will use testing requests later)
app.use(express.urlencoded({extended : false})); // can now handle encoded url data (values in url request)
//purpose of this is that it can now interpret json and url data to input new values w/ post function 


//logger initalized
app.use(logger);

//allows for use of router to functions in 'products' file / can now be accessed through requests on localhost:5000/api/products
var productsRouter = require('./routes/products');
var hardwareRouter = require('./routes/hardware');


app.use('/routes/products', productsRouter);
app.use('/routes/hardware', hardwareRouter);


//express listen on port and report success message 
app.listen(PORT, () => console.log(`Server started in port: ${PORT}`));


//access main page 
// app.get('/', (req, res) => {
//     res.sendFile(path.join(__dirname, 'public', 'main.html'));


// Test method (check for outputs on webpage)
// app.get('/', (req, res) => {
//     res.send('<h1>Hello World</h1>');
// });
