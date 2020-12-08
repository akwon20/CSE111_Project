const express = require('express');
const router = express.Router();    //initalized router for requests 
const employees = require('../tst'); //will use dummy DB instead of actaul DB for now
const path = require('path');   // Import path module

const db = path.resolve(__dirname, '../data/relate.sqlite'); // Retrieve location of database

//will be used for specific searches related to the hardware page


//axios will be used in each router request to preform operations on a database

// TODO: rewrite the routes to retrieve data from the database - Austin

const knex = require('knex')({
    client: 'sqlite3',
    connection: {
        filename: db,
    },
    useNullAsDefault: true
});

//search all hardware [intended for main Hardware page]
router.get('/' , (req, res) => {
    console.log("Get all hardware")

    knex
        .select('*')        // Retrieve all items
        .from('hardware')   // Retreive from hardware table

        .then(userData => {
            // Send products extracted from database in response
            res.json(userData)
        })
        .catch(err => {
            res.json({msg: `Error retrieving hardware: ${err}`})
        })

//     next()
// }, (req, res) => {
//     res.json({msg : "Get all hardware"})
});

//search hardware by name
router.get('/:name', (req, res) =>{
    console.log("Gets hardware with name")

    console.log("Name is " + req.params.name)   // Check back on this one later
    const pName = req.params.name;

    //preform check to see if name exists in table 
    knex
        .select('h_name')        // Retrieve all items
        .from('hardware')   // Retreive from products table
        .where('h_name', 'like' `%${pName}%`)

        .then(userData => {
            // Send products extracted from database in response
            res.json(userData)
        })
        .catch(err => {
            res.json({msg: `Error retrieving hardware: ${err}`})
        })

    //filter through table contents to display hardware with specified name


});

router.get('/:price', (req, res) =>{
    console.log("Gets Hardware with price")
    
    //filter through table contents to display hardware in decending order from specified price
    knex
        .select('h_name, h_price')        // Retrieve all items
        .from('hardware')   // Retreive from products table
        .where('h_name', pName)
        .orderBy('h_price')

        .then(userData => {
            // Send products extracted from database in response
            res.json(userData)
        })
        .catch(err => {
            res.json({msg: `Error retrieving hardware: ${err}`})
        })

});




module.exports = router;