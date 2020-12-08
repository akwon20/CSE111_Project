import React, { Component, Fragment} from 'react';
import {Link} from "react-router-dom";
//import Container from 'react-bootstrap/Container';
import Navbar from 'react-bootstrap/Navbar';
import 'bootstrap/dist/css/bootstrap.min.css';

//import Nav from 'react-bootstrap/Nav';
import Table from 'react-bootstrap/Table';
import Jumbotron from 'react-bootstrap/Jumbotron';
import Container from 'react-bootstrap/Container';

import moment from 'moment';

// Set form of pulled data (Complete when queries are ready)
const itemlist = item => (
    <tr>
        <td>item.list.</td>
        <td>item.list.</td>
        <td>item.list.</td>
        <td>item.list.</td>
    </tr>
)



class Hardware extends Component {


    render() {

        return(
            <Fragment>
                <Link to="/">
                    <Navbar bg="dark" variant="dark">
                        <Navbar.Brand href="#home">Nintendo Tingz</Navbar.Brand>
                    </Navbar>
                </Link>
                <Jumbotron>
                    <h1>Hardware</h1>
                    <p>
                        This page holds software products like the latest games in the Nintendo library
                    </p>
                </Jumbotron>
                <Container>
                    <Table style = {{color:"#f72525"}} striped hover >
                        <p>contains place holders for now</p>
                        <br></br>
                        
                        <thead>
                            <td>Product</td>
                            <td>Price</td>
                            <td>Rating</td>
                            <td>Release Date</td>
                        </thead>
                        <tbody>
                            {/* this is where data will be pulled and displayed */}
                            <tr>
                                <td>Sample</td>
                                <td>Sample</td>
                                <td>Sample</td>
                                <td>Sample</td>
                            </tr>
                            <tr>
                                <td>Sample</td>
                                <td>Sample</td>
                                <td>Sample</td>
                                <td>Sample</td>
                            </tr>
                        </tbody>
                    </Table>
                </Container>
                
            </Fragment> 

        )
    }


}

export default Hardware;