import React from 'react'
import Cell from './Cell'
import styled from 'styled-components'

export default class Board extends React.Component {
    randomColor = () => {
        // TODO: Make index random integer betwen 0 and max colorScheme.length
        return this.props.colorScheme[2]
    }
    render() {
        const coloredBoard = []
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
