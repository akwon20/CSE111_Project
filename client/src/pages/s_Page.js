import React, { Component, Fragment} from 'react';
//import Container from 'react-bootstrap/Container';
import Navbar from 'react-bootstrap/Navbar';
import 'bootstrap/dist/css/bootstrap.min.css';

//import Nav from 'react-bootstrap/Nav';
import Table from 'react-bootstrap/Table';
import Jumbotron from 'react-bootstrap/Jumbotron';
import Container from 'react-bootstrap/Container';

import moment from 'moment';

//set form of pulled data [complete when queries are finished]
const itemlist = item => (
    <tr>
        <td>item.list.</td>
        <td>item.list.</td>
        <td>item.list.</td>
        <td>item.list.</td>

    </tr>
)


class Software extends Component {

    constructor(props){
        super(props)
        this.state = {
            list : []
        }
    }

    //when componenet is successfully called pull appropriate data
    componentDidMount(){
        this.getSoftware();
    }


    //set pulled data to the form of the list
    S_List = () => {
        return this.state.list.map((curr, index) => {
                return < itemlist list = {curr} key = {index} />
        })

    }

    //pull data from the DB
    getSoftware(){
        var curr_time = moment().utcOffset('0').format('YYYY-MM-DD'); //may use this for situations where we sort by most recent 

        fetch(`http://localhost:5000/`) //need to complete queries 
            .then(res => res.json()) //put result in json for to extract
            .then(list => this.setState({list})) //set pulled data to current list
            .catch(err => console.log(err))
    }

    render() {
        return(
            <Fragment>
                <Navbar bg="dark" variant="dark">
                    <Navbar.Brand href="#home">Nintendo Tingz</Navbar.Brand>
                </Navbar>
                <Jumbotron>
                    <h1>Software</h1>
                    <p>
                        This page holds software products like the latest games in the Nintendo library
                    </p>
                </Jumbotron>
                <Container bg = "#f72525">
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
                            {/* this is where pulled data is displayed */}
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

export default Software;
