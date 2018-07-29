import React from 'react'
import Cell from './Cell'
import styled from 'styled-components'

export default class Board extends React.Component {
    coloredBoard = []
    randomColor = () => {
        const { colorScheme } = this.props
        const maxLength = colorScheme.length
        let index = Math.floor(Math.random() * maxLength)
        return colorScheme[index]
    }
    findMaxNeighbours = () => {
        for (const row of this.coloredBoard) {
            console.log('Row', row)
            for (const cell of row.children) {
                console.log('CELL', cell)
            }
        }
    }
    render() {
        const { boardWidth, boardHeight } = this.props

        for (let w = 0; w < boardWidth; w++) {
            const row = []
            for (let h = 0; h < boardHeight; h++) {
                row.push(<Cell key={`${w}_${h}`} color={this.randomColor()} />)
            }
            coloredBoard.push(<div className="row">{row}</div>)
        }

        return <div className="board">{coloredBoard}</div>
    }
}
