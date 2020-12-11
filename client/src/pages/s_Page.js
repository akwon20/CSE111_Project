import React, { Component, Fragment} from 'react';
import {Link} from "react-router-dom";

import Navbar from 'react-bootstrap/Navbar';
import 'bootstrap/dist/css/bootstrap.min.css';

import Table from 'react-bootstrap/Table';
import Jumbotron from 'react-bootstrap/Jumbotron';
import Container from 'react-bootstrap/Container';

//import moment from 'moment';

//var curr_time = moment().utcOffset('0').format('YYYY-MM-DD'); //may use this for situations where we sort by most recent 


//set form of pulled data [complete when queries are finished]
// const itemDetails = ({item}) => (
//     <tr>
//         <td>{item.s_prodName}</td>
//         <td>{item.s_price}</td>
//         <td>{item.s_releasedate}</td>
//     </tr>
// )



class Software extends Component {

    constructor(props){
        super(props)
        this.state = {
            list : []
        }
    }

    //when componenet is successfully called pull appropriate data
    async componentDidMount(){
        //this.getSoftware();

        const url = "http://localhost:5000/routes/software";
        const response = await fetch(url);
        const data = await response.json();
        this.setState({list : data});
        //console.log(this.state.list);
    }


    //set pulled data to the form of the list
    // S_List = () => {
    //     return this.state.list.map((item, index) => {
    //             return <itemDetails list = {item} key = {index} />
    //     })
    // }


    //pull data from the DB
    // getSoftware(){


    render() {
        //console.log(this.state);
        const {list} = this.state;

        return(
            <Fragment>
                <Link to="/">
                    <Navbar bg="dark" variant="dark">
                        <Navbar.Brand href="#home">Ninventory</Navbar.Brand>
                    </Navbar>
                </Link>
                <Jumbotron>
                    <h1>Software</h1>
                    <p>
                        This page holds software products like the latest games in the Nintendo library
                    </p>
                </Jumbotron>
                <Container bg = "#f72525">
                    <Table style = {{color:"#f72525"}} striped hover >
                        <thead>
                            <td>Product</td>
                            <td>Price</td>
                            <td>Release Date</td>
                        </thead>
                        <tbody>

                            {list.map((item, index) => {
                                return <tr>
                                        <Link to = {{pathname: `/product`, state : {
                                            }}}>
                                            <td>{item.s_prodName}</td></Link>
                                            <td>{item.s_price}</td>
                                            <td>{item.s_releasedate}</td>
                                        </tr>
                            })}

                        </tbody>
                    </Table>
                </Container>
                
            </Fragment> 

        )
    }


}

export default Software;
