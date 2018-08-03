import React, { Component } from 'react'
import './App.css'
// import Board from './V1/Board'
import Board from './V2/Board'
class App extends Component {
    render() {
        const colorScheme = ['#AB47BC', '#42A5F5', '#26A69A', '#FF7043']
        const trioColorScheme = ['#666', '#CCC', '#AAEEFF']
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
