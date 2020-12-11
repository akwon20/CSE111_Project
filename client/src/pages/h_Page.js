import React, { Component, Fragment} from 'react';
import {Link} from "react-router-dom";
//import axios from 'axios';
//import Container from 'react-bootstrap/Container';
import 'bootstrap/dist/css/bootstrap.min.css';

//import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import Table from 'react-bootstrap/Table';
import Jumbotron from 'react-bootstrap/Jumbotron';
import Container from 'react-bootstrap/Container';

//import moment from 'moment';

// Set form of pulled data (Complete when queries are ready)
// const itemlist = item => (
    // <tr>
    //     <td>item.list.</td>
    //     <td>item.list.</td>
    //     <td>item.list.</td>
    //     <td>item.list.</td>
    // </tr>
// )



class Hardware extends Component {

    constructor(props){
        super(props)
        this.state = {
            isLoaded: false,
            list: []
        }
    }

    //when componenet is successfully called pull appropriate data
    async componentDidMount(){
        // this.getHardware();


        //this is more 
        const url = "http://localhost:5000/routes/hardware";
        const response = await fetch (url);
        const data = await response.json();
        this.setState({list : data});
        }





    render() {

        const {list} = this.state;

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
                        This page holds hardware products like consoles and other accessories
                    </p>
                </Jumbotron>
                <Container>
                    <Table style = {{color:"#f72525"}} striped hover >                        <br></br>
                        
                        <thead>
                            <td>Product</td>
                            <td>Price</td>
                            <td>Release Date</td>
                        </thead>
                        <tbody>
                            {/* this is where data will be pulled and displayed */}
                            {list.map((item, index) => {
                                return  <tr>
                                            <Link to = {{pathname: `/product`, state : {
                                            }}}>
                                            <td>{item.h_name}</td></Link>
                                            <td>{item.h_price}</td>
                                            <td>{item.h_releaseDate}</td>
                                        </tr>
                            })}
                        </tbody>
                    </Table>
                </Container>
                
            </Fragment> 

        )
    }


}

export default Hardware;
