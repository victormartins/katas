import React from 'react'
import Cell from './Cell'

export default class Board extends React.Component {
    state = {
        boardData: []
    }

    renderBoard = () => {
        const { boardHeight } = this.props
        const { boardData } = this.state

        const groupCellsIntoLines = (result, cellData, index) => {
            const breakLine = index % boardHeight == 0
            if (breakLine) {
                result.push([])
            }
            result[result.length - 1].push(
                <Cell key={`${cellData.x}_${cellData.y}`} color={cellData.color} highLighted={cellData.highLighted} />
            )
            return result
        }

        const insertIntoDivs = (cells, index) => {
            return <div key={index}>{cells}</div>
        }

        const result = boardData.reduce(groupCellsIntoLines, []).map(insertIntoDivs)
        console.log('RENDERED_BOARD:', result)
        return result
    }

    randomColor = () => {
        const { colorScheme } = this.props
        const index = Math.floor(Math.random() * colorScheme.length)
        return colorScheme[index]
    }

    generateBoardData = () => {
        const result = []
        const { boardWidth, boardHeight } = this.props
        for (let h = 0; h < boardHeight; h++) {
            for (let w = 0; w < boardWidth; w++) {
                result.push({
                    x: w,
                    y: h,
                    color: this.randomColor(),
                    highLighted: false
                })
            }
        }
        console.log('Generated boardData', result)
        return result
    }

    componentWillMount() {
        this.setState({ boardData: this.generateBoardData() })
    }

    newBoard = () => {
        this.setState({ boardData: this.generateBoardData() })
    }

    findNeighbours = () => {
        const groupColorsByNeighbours = (result, cell) => {
            result[cell.color] = result[cell.color] || []
            // console.log('RESULT:', result)
            // console.log(`RESULT[${cell.color}]:`, result[cell.color])
            // console.log('CELL:', cell)

            if (
                result[cell.color].some((groupOfNeighbours) => {
                    const areNeighbours = groupOfNeighbours.some((cellInGroupOfNeighbours) => {
                        console.log('currentCell', cell, 'cellInGroupOfNeighbours', cellInGroupOfNeighbours)
                        return (
                            // TOP AND BOTTOM
                            (cell.x === cellInGroupOfNeighbours.x && cell.y === cellInGroupOfNeighbours.y - 1) ||
                            (cell.x === cellInGroupOfNeighbours.x && cell.y === cellInGroupOfNeighbours.y + 1) ||
                            // LEFT and RIGHT
                            (cell.x === cellInGroupOfNeighbours.x - 1 && cell.y === cellInGroupOfNeighbours.y) ||
                            (cell.x === cellInGroupOfNeighbours.x + 1 && cell.y === cellInGroupOfNeighbours.y) ||
                            // TOP DIAGONALS (LEFT AND RIGHT)
                            (cell.x === cellInGroupOfNeighbours.x - 1 && cell.y === cellInGroupOfNeighbours.y - 1) ||
                            (cell.x === cellInGroupOfNeighbours.x + 1 && cell.y === cellInGroupOfNeighbours.y - 1) ||
                            // BOTTOM DIAGONALS (LEFT AND RIGHT)
                            (cell.x === cellInGroupOfNeighbours.x - 1 && cell.y === cellInGroupOfNeighbours.y + 1) ||
                            (cell.x === cellInGroupOfNeighbours.x + 1 && cell.y === cellInGroupOfNeighbours.y + 1)
                        )
                    })
                    if (areNeighbours) {
                        console.log('Push Neighbour to group')
                        groupOfNeighbours.push(cell)
                    }

                    return areNeighbours
                })
            ) {
                console.log('Cell Added')
            } else {
                result[cell.color].push([cell])
                console.log('New Neighbour Group Created')
            }
            return result
        }
        const result = this.state.boardData.reduce(groupColorsByNeighbours, {})
        console.log('NEIGHBOURS:', result)
    }

    render() {
        return (
            <React.Fragment>
                <div className="board">{this.renderBoard()}</div>
                <div className="board__controlls">
                    <button onClick={this.newBoard}>New Board</button>
                    <button onClick={this.findNeighbours}>Find Neighbours</button>
                </div>
            </React.Fragment>
        )
    }
}
