// import 'bootstrap/dist/css/boostrap.min.css';

import React, { Component } from 'react';
// import logo from './logo.svg';
import './App.css';
//import { render } from '../../api/app';
import {Route, BrowserRouter as Router, Switch} from 'react-router-dom';
import Home from './pages/home';




class App extends Component {

constructor(props) {
  super(props);
  this.state = { apiResponse: "" };
}

callAPI() {
  //test calls with function below 
    fetch("http://localhost:5000/routes/products/Super Mario Odyssey")
        //give text response of data
        .then(res => res.text())
        .then(res => this.setState({ apiResponse: res }));
}

componentWillMount() {
    this.callAPI();
}

// Put Front End Stuff here
// Run "npm start" in client to test
render(){
  // We'll put routes for specific pages here
  return (
    <Router>
        <div>
            <Switch>
                <Route exact path = "/" component = {Home}/> 
            </Switch>
        </div>

    </Router>


  );
}
}


export default App;
