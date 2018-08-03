import React, { Component } from 'react'
import './App.css'
// import Board from './V1/Board'
import Board from './V2/Board'
class App extends Component {
    render() {
        const colorScheme = ['red', 'blue', 'green', 'purple']
        const lowProfileColorScheme = ['#AAA', '#BBB', '#CCC', '#DDD']
        const boardWidth = 10
        const boardHeight = 10
        return (
            <div className="app">
                <Board colorScheme={colorScheme} boardWidth={boardWidth} boardHeight={boardHeight} />
            </div>
        )
    }
}

export default App
