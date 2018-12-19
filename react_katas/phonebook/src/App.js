import React, { Component } from 'react';
import './App.css';
import AddressList from './components/AddressList'

class App extends Component {
  constructor(props){
    super(props)

    this.state = {
      addresses: [
        {
          name: 'Daniela Martins',
          mobile: '07475743987'
        },
        {
          name: 'Victor Martins',
          mobile: '07475762085'
        }
      ]
    }
  }
  render() {
    const {addresses} = this.state
    return (
      <div className="app">
        <div className='app-container'>
          <header>
            <h1>PhoneBook</h1>
          </header>
          <AddressList addresses={addresses} />
        </div>
      </div>
    );
  }
}

export default App;
