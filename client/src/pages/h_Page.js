import React, { Component, Fragment} from 'react';
//import Container from 'react-bootstrap/Container';
import Navbar from 'react-bootstrap/Navbar';
import 'bootstrap/dist/css/bootstrap.min.css';

//import Nav from 'react-bootstrap/Nav';
import Table from 'react-bootstrap/Table';
import Jumbotron from 'react-bootstrap/Jumbotron';
import Container from 'react-bootstrap/Container';




class Hardware extends Component {


    render() {

        return(
            <Fragment>
                <Navbar bg="dark" variant="dark">
                    <Navbar.Brand href="#home">Nintendo Tingz</Navbar.Brand>
                </Navbar>
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