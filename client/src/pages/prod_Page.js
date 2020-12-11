import React, { Component, Fragment} from 'react';
import {Link} from "react-router-dom";

import 'bootstrap/dist/css/bootstrap.min.css';

import Navbar from 'react-bootstrap/Navbar';
import Table from 'react-bootstrap/Table';
import Jumbotron from 'react-bootstrap/Jumbotron';
import Container from 'react-bootstrap/Container';

import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Card from 'react-bootstrap/Card';




class ProdPage extends Component{
// 12/10/2020: curent problem is to link to react component with passed "prodName" prop
    constructor(props){
        super(props)
        this.state = {
            prodName : this.props.prod_Name , // replace with  //name is used as a key to pull specific data for this particular product page
            prodBaseDetails : [],    //will hold all the pulled data used to display
            prodStoreDetails : []
        }
    }

    async componentDidMount(){
        const url = `http://localhost:5000/routes/products/${this.state.prod_Name}`;
        const response = await fetch(url);
        const data = await response.json();
        this.setState({prodBaseDetails : data});
        console.log(this.state);
    }

    basePriceComp(){

    }

    


    render(){

        const {prodBaseDetails} = this.state;
        return(
        <Fragment>
            <Link to="/">
                    <Navbar bg="dark" variant="dark">
                        <Navbar.Brand href="#home">Nintendo Tingz</Navbar.Brand>
                    </Navbar>
                </Link>
                <Jumbotron>
                    <h1>{prodBaseDetails.p_prodName}</h1>   {/* replace w/ this.state.prodName once connection successful */}
                    <p>
                        Lowest prices and general product info for a specific product
                    </p>
                </Jumbotron>
                <Container fluid>
                    {/* will contain the base product info */}
                    <Row>
                        <Col>
                            <h1>{prodBaseDetails.p_prodName}</h1>
                        </Col>
                        <Col>
                            <h1>{prodBaseDetails.p_price}</h1>
                        </Col>
                        <Col>
                            <h1>{prodBaseDetails.p_releasedate}</h1>
                        </Col>
                    </Row>

                </Container>
                <Container fluid>
                    {/*container for every store will info such as price/ basePrice comparison /last shipment*/}
                    <Row>
                            <h1>Games</h1>
                    </Row>
                </Container>
        </Fragment>
        )
    }

}


export default ProdPage;