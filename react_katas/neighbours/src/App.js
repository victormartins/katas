import React, { Component } from 'react'
import './App.css'
import Board from './V1/Board'
class App extends Component {
    render() {
        const colorScheme = ['red', 'blue', 'green', 'purple', 'orange']
        const boardWidth = 10
        const boardHeight = 10
        return (
            <div className="App">
                <Board colorScheme={colorScheme} boardWidth={boardWidth} boardHeight={boardHeight} />
            </div>
        )
    }
}

export default App
