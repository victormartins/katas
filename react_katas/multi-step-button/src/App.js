import React, { Component } from 'react'
import logo from './logo.svg'
import './App.css'

import MultiStepButton from './MultiStepButton'

class App extends Component {
    render() {
        return (
            <div className="App">
                <header className="App-header">
                    <img src={logo} className="App-logo" alt="logo" />
                    <h1 className="App-title">Welcome to React</h1>
                </header>
                <br />
                <MultiStepButton
                    messages={['Hello', 'Is it me?', 'You\'re looking for?', '!WOW!']}
                    action={() => console.log('Action!')}
                />
            </div>
        )
    }
}

export default App
