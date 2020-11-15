const moment = require('moment');

//creating a logger: useful for debugging
//logger is middleware that takes every res and req object from any requests
//made and outputs a message 
const logger = (req, res, next) => {
    console.log(`${req.protocol}://${req.get('host')}${req.originalUrl}: ${moment().format()}`);  
    next();
};

module.exports = logger;