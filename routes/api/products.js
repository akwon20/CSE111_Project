const express = require('express');
const router = express.Router();    //initalized router for requests 
const employees = require('../../tst'); //will use dummy DB instead of actaul DB for now

//gets all 
router.get('/', (req, res) => {res.json(employees)});

//gets single result
router.get('/:id', (req, res) => {
    const found = employees.some(employees => employees.id === parseInt(req.params.id)); //checks if request is valid, [T/F] if value is present 

    if (found){
        res.json(employees.filter(employees => employees.id === parseInt(req.params.id))); //displays results that match id value
    } else {
        res.status(400).json({msg : `No employee with id ${req.params.id} found`}); //set status to 400 [bad request] and output message
    }
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
