import React, { Component } from 'react'
import './App.css'
import Board from './Board'
class App extends Component {
    render() {
        const colorScheme = ['red', 'blue', 'green', 'white']
        const boardWidth = 4
        const boardHeight = 3
        return (
            <div className="App">
                <Board colorScheme={colorScheme} boardWidth={boardWidth} boardHeight={boardHeight} />
            </div>
        )
    }
}

export default App
