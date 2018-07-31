import React, { Component } from 'react'
import './App.css'
// import Board from './V1/Board'
import Board from './V2/Board'
class App extends Component {
    render() {
        const colorScheme = ['red', 'blue', 'green', 'purple']
        const boardWidth = 4
        const boardHeight = 3
        return (
            <div className="app">
                <Board colorScheme={colorScheme} boardWidth={boardWidth} boardHeight={boardHeight} />
            </div>
        )
    }
}

export default App
