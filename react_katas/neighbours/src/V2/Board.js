import React from 'react'
import Cell from './Cell'

export default class Board extends React.Component {
    state = {
        boardData: []
    }

    renderBoard = () => {
        const { boardWidth } = this.props
        const { boardData } = this.state

        const groupCellsIntoLines = (result, cellData, index) => {
            const breakLine = index % boardWidth == 0
            const cellID = `${cellData.x}_${cellData.y}`

            if (breakLine) {
                result.push([])
            }
            result[result.length - 1].push(
                <Cell key={cellID} cellID={cellID} color={cellData.color} highLighted={cellData.highLighted} />
            )
            return result
        }

        const insertIntoDivs = (cells, index) => {
            return (
                <div className="cellContainer" key={index}>
                    {cells}
                </div>
            )
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

    // group neighbour groups by color
    // a color is an array of arrays, each array has grouped cells by proximity
    // we keep track of which neighbourhood has more neighbours so that we can easily find the one we want later
    findNeighbours = () => {
        const groupColorsByNeighbours = (result, cell) => {
            result[cell.color] = result[cell.color] || []
            result[cell.color].max = 0
            // console.log('RESULT:', result)
            // console.log(`RESULT[${cell.color}]:`, result[cell.color])
            // console.log('CELL:', cell)

            // if any (array#some) of the arrays has a neighbour of this cell, add it to that group
            // otherwise create a new group (array)
            if (
                result[cell.color].some((groupOfNeighbours) => {
                    const areNeighbours = groupOfNeighbours.some((cellInGroupOfNeighbours) => {
                        // console.log('currentCell', cell, 'cellInGroupOfNeighbours', cellInGroupOfNeighbours)
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
                        // console.log('Push Neighbour to group')
                        groupOfNeighbours.push(cell)
                    }

                    if (result[cell.color].max < groupOfNeighbours.length) {
                        result[cell.color].max = groupOfNeighbours.length
                    }

                    return areNeighbours
                })
            ) {
                // console.log('Cell Added')
            } else {
                result[cell.color].push([cell])
                // console.log('New Neighbour Group Created')
            }
            return result
        }

        const colorsAndNeighbours = this.state.boardData.reduce(groupColorsByNeighbours, {})
        // TODO: VICMAR It seems that these sorts are buggy
        const maxNeighbours = Object.entries(colorsAndNeighbours)
            .sort((allColorsGroupsTuplesA, allColorsGroupsTuplesB) => {
                // console.log('allColorsGroupsTuplesA', allColorsGroupsTuplesA[0], allColorsGroupsTuplesA[1])
                // console.log('allColorsGroupsTuplesB', allColorsGroupsTuplesB[0], allColorsGroupsTuplesB[1])
                return allColorsGroupsTuplesB[1].max - allColorsGroupsTuplesA[1].max
            })[0]
            .sort((colorGroupTuple) => {
                colorGroupTuple[1].length
            })
        const neighboursToHighlight = maxNeighbours[1][0]
        console.log('Max NEIGHBOURS:', maxNeighbours)
        console.log('MaxToHighLight:', neighboursToHighlight)

        const { boardData } = this.state

        for (const cell of neighboursToHighlight) {
            const cellToHighlight = boardData.find((c) => {
                return c.x === cell.x && c.y === cell.y
            })
            cellToHighlight.highLighted = true
        }
        const highLightedBoardData = boardData.reduce((result, cell) => {
            console.log('Data', cell)
            return result
        }, {})

        this.setState({ boardData: boardData })
        console.log('highLightedBoardData', highLightedBoardData)
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
