import 'bootstrap/dist/css/bootstrap.min.css';

import React, {Component} from 'react';
import Card from 'react-bootstrap/Card';
// import CardGroup from 'react-bootstrap/CardGroup';
// import CardDeck from 'react-bootstrap/CardDeck';
import CardColumns from 'react-bootstrap/CardColumns';

import Button from 'react-bootstrap/Button';

class Home extends React.Component {


    render(){
        return (
            <body>
                <h1>Welcome!</h1>

                <CardColumns>
                    <Card style={{ width: "18rem" }}>
                        <Card.Img variant="top" src = "holder.js/171x180" />
                        <Card.Body>
                            <Button variant="danger">Hardware</Button>
                        </Card.Body>
                    </Card>
            
            
                    <Card style={{width: '18rem'}}>
                        <Card.Img variant="top" src = "holder.js/171x180" />
                        <Card.Body>
                            <Button variant="danger">Software</Button>
                        </Card.Body>
                    </Card>
                </CardColumns>
            </body>
        )
    }
}

export default Home;