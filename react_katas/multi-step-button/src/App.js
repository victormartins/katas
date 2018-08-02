import React, { Component } from 'react'
import logo from './logo.svg'
import './App.css'

import MultiStepButton from './MultiStepButton'
import HelloButton from './HelloButton'
import SpawnChildrenButton from './SpawnChildrenButton'

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
                <br />
                <HelloButton />
                <SpawnChildrenButton colorScheme={['#AB47BC', '#2196F3', '#8BC34A', '#FFB300', '#9C27B0', '#ff1744']} />
            </div>
        )
    }
}

export default App
