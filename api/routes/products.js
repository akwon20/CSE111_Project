const express = require('express');
const router = express.Router();    //initalized router for requests 
const employees = require('../tst'); //will use dummy DB instead of actaul DB for now
const path = require('path');   // Import path module

const db = path.resolve(__dirname, '../data/relate.sqlite'); // Retrieve location of database

const knex = require('knex')({
    client: 'sqlite3',
    connection: {
        filename: db,
    },
    useNullAsDefault: true
});

// TODO: rewrite the routes to retrieve data from the database - Austin

// // Get all
// router.get('/', (req, res) => {res.json(employees)});

// Get all products from the product table [done]
//this query done [get all]
router.get('/', (req, res) => {
    console.log("Get all products")
    
    knex
        .select('*')        // Retrieve all items
        .from('products')   // Retreive from products table
        .then(userData => {
            // Send products extracted from database in response
            res.json(userData)
        })
        .catch(err => {
            res.json({msg: `Error retrieving products: ${err}`})
        })
});

// Get only a specific product [done]
router.get('/:name', (req, res) => {
    console.log("Name is " + req.params.name)   // Check back on this one later
    const pName = req.params.name;
    //const prodName  = req.params.p_prodName
    knex
        .select('p_prodName')        // Retrieve all items
        .from('products')   // Retreive from products table
        .where('p_prodName', 'like', `%${pName}%`)
        .then(userData => {
            // Send products extracted from database in response
            res.json(userData)
        })
        .catch(err => {
            res.json({msg: `Error retrieving product name: ${err}`})
        })
});



//post request for adding content to list
router.post('/', (req, res) => {
    const newEmpl = {
        id : req.params.id,
        name : req.params.name,
    }

    if(!newEmpl.id || !newEmpl.name) { //check if either value is missing 
        return res.status(400).json({msg : "Include id and name"}); //error message
    }

    employees.push(newEmpl); //if checks passed, add to array

    console.log(`Employee ${req.params.name} has been added`); //success message

    res.json(employees); //display all contents after addition

});

module.exports = router;
