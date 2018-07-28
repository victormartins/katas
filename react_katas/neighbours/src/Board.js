import React from 'react'
import Cell from './Cell'

export default class Board extends React.Component {
    randomColor = () => {
        // TODO: Make index random integer betwen 0 and max colorScheme.length
        return this.props.colorScheme[2]
    }
    render() {
        const coloredBoard = []
        const { boardWidth, boardHeight } = this.props

        for (let h = 0; h < boardHeight; h++) {
            const row = []
            for (let w = 0; w < boardWidth; w++) {
                row.push(<Cell key={`${w}_${h}`} color={this.randomColor()} />)
            }
            coloredBoard.push(row)
        }

        return coloredBoard
    }
}
