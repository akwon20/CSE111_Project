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
        .where('h_name', 'like', `%${pName}%`)
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
    
    console.log("Price is " + req.params.price)   // Check back on this one later
    const pPrice = req.params.price;

    //preform check to see if such products exist in table 
    knex
        .select('s_prodName, s_price')        // Retrieve software name and price
        .from('software')   // Retreive from software table
        .where('s_price', 'like', `%${pPrice}%`)

        .then(userData => {
            // Send products extracted from database in response
            res.json(userData)
        })
        .catch(err => {
            res.json({msg: `Error retrieving software: ${err}`})
        })

});

router.post('/', (req, res) => {
    // const newHard = {
    //     name : req.params.name,
    //     price : req.params.price,
    //     date: req.params.date,
    // }

    knex
        .insert({h_name: req.params.name, h_price: req.params.price, h_releaseDate: req.params.date})
        .into('hardware')

        .then(result => {
            // Send products extracted from database in response
            res.json({msg: 'New hardware products added!' })
        })
        .catch(err => {
            res.json({msg: `Error adding hardware: ${err}`})
        })
});

// Update hardware price
router.post('/:price', (req, res) => {
    // const newHard = {
    //     name : req.params.name,
    //     price : req.params.price,
    //     date: req.params.date,
    // }

    knex('hardware')
        .update
        .then(result => {
            // Send products extracted from database in response
            res.json({msg: 'Hardware price updated' })
        })
        .catch(err => {
            res.json({msg: `Error adding hardware: ${err}`})
        })
});




module.exports = router;