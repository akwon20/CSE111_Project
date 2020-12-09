import React, { Component, Fragment} from 'react';
import {Link} from "react-router-dom";
import axios from 'axios';
//import Container from 'react-bootstrap/Container';
import 'bootstrap/dist/css/bootstrap.min.css';

//import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
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

    constructor(props){
        super(props)
        this.state = {
            list : []
        }
    }

    //when componenet is successfully called pull appropriate data
    componentDidMount(){
        this.getHardware();
        // axios.get(`http://localhost:5000/routes/hardware`)
        //     .then(res => {
        //         const hw = res.data;
        //         this.setState({hw});
        //     })
        //     .catch(err => {
        //         console.log(err)
        //     })
    }


    //set pulled data to the form of the list
    hardware_list = () => {
        return this.state.list.map((curr, index) => {
                return < itemlist list = {curr} key = {index} />
        })

    }

    //pull data from the DB
    getHardware(){
        var curr_time = moment().utcOffset('0').format('YYYY-MM-DD'); //may use this for situations where we sort by most recent 

        fetch(`http://localhost:5000/routes/hardware`) //need to complete queries 
            .then(res => res.json()) //put result in json for to extract
            .then((result) => this.setState({
                isLoaded: true,
                list: result.list
            })) //set pulled data to current list
            // .then(console.log(this.state.list))
            .catch(err => console.log(err))

        // fetch(`http://localhost:5000/routes/hardware`) //need to complete queries 
        //     .then(res => res.json()) //put result in json for to extract
        //     .then(list => this.setState({list})) //set pulled data to current list
        //     .then(console.log(this.state.list))
        //     .catch(err => console.log(err))

        axios.get(`http://localhost:5000/routes/hardware`)
            .then(res => {
                const hw = res.data;
                this.setState({hw});
            })
            .catch(err => {
                console.log(err)
            })
    }


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
                        This page holds hardware products like consoles and other accessories
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
                            {/* {this.hardware_list()} */}
                            {this.state.list.map(item => (
                                <li key={item.id}>
                                    {item.h_name} {item.h_price} {item.h_releaseDate}
                                </li>
                            ))}
                        </tbody>
                    </Table>
                </Container>
                
            </Fragment> 

        )
    }


}

export default Hardware;