import 'bootstrap/dist/css/bootstrap.min.css';

import React, {Component} from 'react';
import {Link} from "react-router-dom";
import Card from 'react-bootstrap/Card';
// import CardGroup from 'react-bootstrap/CardGroup';
// import CardDeck from 'react-bootstrap/CardDeck';
import CardColumns from 'react-bootstrap/CardColumns';
import Button from 'react-bootstrap/Button';

import Navbar from 'react-bootstrap/Navbar';
import Jumbotron from 'react-bootstrap/Jumbotron';
import Container from 'react-bootstrap/Container';

class Home extends React.Component {


    render(){
        return (
            <body>
                <Navbar bg="dark" variant="dark">
                    <Navbar.Brand href="#home">Nintendo Tingz</Navbar.Brand>
                </Navbar>
                <Jumbotron>
                    <h1>Home</h1>
                    <p>
                        Welcome! Select a product type to view
                    </p>
                </Jumbotron>

                <CardColumns>
                    <Card style={{ width: "18rem" }}>
                        <Card.Img variant="top" src = "holder.js/171x180" />
                        <Card.Body>
                            <Link to="/hardware">
                                <Button variant="danger">Hardware</Button>
                            </Link>
                        </Card.Body>
                    </Card>
            
            
                    <Card style={{width: '18rem'}}>
                        <Card.Img variant="top" src = "holder.js/171x180" />
                        <Card.Body>
                            <Link to="/software">
                                <Button variant="danger">Software</Button>
                            </Link>
                        </Card.Body>
                    </Card>
                </CardColumns>
            </body>
        )
    }
}

export default Home;