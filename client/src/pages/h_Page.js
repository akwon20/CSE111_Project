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
<<<<<<< HEAD
    componentDidMount(){
        this.getHardware();
        // console.log("Mounting component")
        // fetch(`http://localhost:5000/routes/hardware`) //need to complete queries
        //     .then(console.log("Component did mount!"))
        //     .then(res => res.json()) //put result in json for to extract
        //     .then((result) => this.setState({
        //         isLoaded: true,
        //         list: result.list
        //     })) //set pulled data to current list
        //     .catch(err => console.log(err))

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

        fetch(`http://localhost:5000/routes/hardware`, 
        {
            credentials: `include`
        }) //need to complete queries 
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

        // axios.get(`http://localhost:5000/routes/hardware`)
        //     .then(res => {
        //         const hw = res.data;
        //         this.setState({hw});
        //     })
        //     .catch(err => {
        //         console.log(err)
        //     })
    }


=======

    async componentDidMount(){
        // this.getHardware();


        //this is more 
        const url = "http://localhost:5000/routes/hardware";
        const response = await fetch (url);
        const data = await response.json();
        this.setState({list : data});
        }






>>>>>>> main
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
<<<<<<< HEAD
                            {this.hardware_list()}
                            {/* {this.state.list.map(item => (
                                <li key={item.id}>
                                    {item.h_name} {item.h_price} {item.h_releaseDate}
                                </li>
                            ))} */}
                            {/* {this.state.testlist.map(tag => <li key={tag}>{ tag }</li>)} */}
                            {/* {this.state.list.map(item => (<li key={item.id}> {item.h_name} {item.h_price} {item.h_releaseDate}</li>))} */}
=======

                            {list.map((item, index) => {
                                return  <tr>
                                            <Link to = {{pathname: `/product`, state : {
                                            }}}>
                                            <td>{item.h_name}</td></Link>
                                            <td>{item.h_price}</td>
                                            <td>{item.h_releaseDate}</td>
                                        </tr>
                            })}

>>>>>>> main
                        </tbody>
                    </Table>
                </Container>
                
            </Fragment> 

        )
    }


}

export default Hardware;
