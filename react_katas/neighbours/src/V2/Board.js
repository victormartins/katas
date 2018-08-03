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
        // console.log('RENDERED_BOARD:', result)
        return result
    }

    randomColor = () => {
        const { colorScheme } = this.props
        const index = Math.floor(Math.random() * colorScheme.length)
        return colorScheme[index]
    }

    generateBoardData = () => {
        const generatedData = []
        const { boardWidth, boardHeight } = this.props

        for (let h = 0; h < boardHeight; h++) {
            for (let w = 0; w < boardWidth; w++) {
                generatedData.push({
                    x: w,
                    y: h,
                    color: this.randomColor(),
                    highLighted: false
                })
            }
        }
        console.log('GENERATED_BOARD_DATA:', generatedData)
        return generatedData

        // Test Board. Must Highlight the following:
        // [
        //     { x: 6, y: 5, color: 'red', highLighted: true },
        //     { x: 7, y: 5, color: 'red', highLighted: true },
        //     { x: 5, y: 6, color: 'red', highLighted: true },
        //     { x: 6, y: 7, color: 'red', highLighted: true },
        //     { x: 5, y: 8, color: 'red', highLighted: true },
        //     { x: 6, y: 8, color: 'red', highLighted: true },
        //     { x: 7, y: 8, color: 'red', highLighted: true },
        //     { x: 7, y: 9, color: 'red', highLighted: true },
        //     { x: 8, y: 9, color: 'red', highLighted: true },
        //     { x: 3, y: 7, color: 'red', highLighted: true },
        //     { x: 4, y: 8, color: 'red', highLighted: true },
        //     { x: 3, y: 9, color: 'red', highLighted: true },
        //     { x: 9, y: 8, color: 'red', highLighted: true },
        //     { x: 2, y: 9, color: 'red', highLighted: true }
        // ]
        //
        // return [
        //     { x: 0, y: 0, color: 'red', highLighted: false },
        //     { x: 1, y: 0, color: 'blue', highLighted: false },
        //     { x: 2, y: 0, color: 'purple', highLighted: false },
        //     { x: 3, y: 0, color: 'green', highLighted: false },
        //     { x: 4, y: 0, color: 'blue', highLighted: false },
        //     { x: 5, y: 0, color: 'blue', highLighted: false },
        //     { x: 6, y: 0, color: 'green', highLighted: false },
        //     { x: 7, y: 0, color: 'red', highLighted: false },
        //     { x: 8, y: 0, color: 'blue', highLighted: false },
        //     { x: 9, y: 0, color: 'blue', highLighted: false },
        //     { x: 0, y: 1, color: 'blue', highLighted: false },
        //     { x: 1, y: 1, color: 'green', highLighted: false },
        //     { x: 2, y: 1, color: 'green', highLighted: false },
        //     { x: 3, y: 1, color: 'green', highLighted: false },
        //     { x: 4, y: 1, color: 'red', highLighted: false },
        //     { x: 5, y: 1, color: 'green', highLighted: false },
        //     { x: 6, y: 1, color: 'purple', highLighted: false },
        //     { x: 7, y: 1, color: 'green', highLighted: false },
        //     { x: 8, y: 1, color: 'green', highLighted: false },
        //     { x: 9, y: 1, color: 'green', highLighted: false },
        //     { x: 0, y: 2, color: 'blue', highLighted: false },
        //     { x: 1, y: 2, color: 'purple', highLighted: false },
        //     { x: 2, y: 2, color: 'purple', highLighted: false },
        //     { x: 3, y: 2, color: 'purple', highLighted: false },
        //     { x: 4, y: 2, color: 'red', highLighted: false },
        //     { x: 5, y: 2, color: 'purple', highLighted: false },
        //     { x: 6, y: 2, color: 'purple', highLighted: false },
        //     { x: 7, y: 2, color: 'blue', highLighted: false },
        //     { x: 8, y: 2, color: 'purple', highLighted: false },
        //     { x: 9, y: 2, color: 'blue', highLighted: false },
        //     { x: 0, y: 3, color: 'green', highLighted: false },
        //     { x: 1, y: 3, color: 'purple', highLighted: false },
        //     { x: 2, y: 3, color: 'green', highLighted: false },
        //     { x: 3, y: 3, color: 'purple', highLighted: false },
        //     { x: 4, y: 3, color: 'green', highLighted: false },
        //     { x: 5, y: 3, color: 'green', highLighted: false },
        //     { x: 6, y: 3, color: 'red', highLighted: false },
        //     { x: 7, y: 3, color: 'green', highLighted: false },
        //     { x: 8, y: 3, color: 'red', highLighted: false },
        //     { x: 9, y: 3, color: 'red', highLighted: false },
        //     { x: 0, y: 4, color: 'purple', highLighted: false },
        //     { x: 1, y: 4, color: 'blue', highLighted: false },
        //     { x: 2, y: 4, color: 'red', highLighted: false },
        //     { x: 3, y: 4, color: 'blue', highLighted: false },
        //     { x: 4, y: 4, color: 'blue', highLighted: false },
        //     { x: 5, y: 4, color: 'purple', highLighted: false },
        //     { x: 6, y: 4, color: 'green', highLighted: false },
        //     { x: 7, y: 4, color: 'green', highLighted: false },
        //     { x: 8, y: 4, color: 'green', highLighted: false },
        //     { x: 9, y: 4, color: 'purple', highLighted: false },
        //     { x: 0, y: 5, color: 'blue', highLighted: false },
        //     { x: 1, y: 5, color: 'green', highLighted: false },
        //     { x: 2, y: 5, color: 'red', highLighted: false },
        //     { x: 3, y: 5, color: 'green', highLighted: false },
        //     { x: 4, y: 5, color: 'purple', highLighted: false },
        //     { x: 5, y: 5, color: 'green', highLighted: false },
        //     { x: 6, y: 5, color: 'red', highLighted: false },
        //     { x: 7, y: 5, color: 'red', highLighted: false },
        //     { x: 8, y: 5, color: 'green', highLighted: false },
        //     { x: 9, y: 5, color: 'red', highLighted: false },
        //     { x: 0, y: 6, color: 'purple', highLighted: false },
        //     { x: 1, y: 6, color: 'purple', highLighted: false },
        //     { x: 2, y: 6, color: 'purple', highLighted: false },
        //     { x: 3, y: 6, color: 'green', highLighted: false },
        //     { x: 4, y: 6, color: 'blue', highLighted: false },
        //     { x: 5, y: 6, color: 'red', highLighted: false },
        //     { x: 6, y: 6, color: 'blue', highLighted: false },
        //     { x: 7, y: 6, color: 'purple', highLighted: false },
        //     { x: 8, y: 6, color: 'purple', highLighted: false },
        //     { x: 9, y: 6, color: 'red', highLighted: false },
        //     { x: 0, y: 7, color: 'red', highLighted: false },
        //     { x: 1, y: 7, color: 'purple', highLighted: false },
        //     { x: 2, y: 7, color: 'purple', highLighted: false },
        //     { x: 3, y: 7, color: 'red', highLighted: false },
        //     { x: 4, y: 7, color: 'blue', highLighted: false },
        //     { x: 5, y: 7, color: 'green', highLighted: false },
        //     { x: 6, y: 7, color: 'red', highLighted: false },
        //     { x: 7, y: 7, color: 'green', highLighted: false },
        //     { x: 8, y: 7, color: 'blue', highLighted: false },
        //     { x: 9, y: 7, color: 'blue', highLighted: false },
        //     { x: 0, y: 8, color: 'red', highLighted: false },
        //     { x: 1, y: 8, color: 'purple', highLighted: false },
        //     { x: 2, y: 8, color: 'purple', highLighted: false },
        //     { x: 3, y: 8, color: 'purple', highLighted: false },
        //     { x: 4, y: 8, color: 'red', highLighted: false },
        //     { x: 5, y: 8, color: 'red', highLighted: false },
        //     { x: 6, y: 8, color: 'red', highLighted: false },
        //     { x: 7, y: 8, color: 'red', highLighted: false },
        //     { x: 8, y: 8, color: 'blue', highLighted: false },
        //     { x: 9, y: 8, color: 'red', highLighted: false },
        //     { x: 0, y: 9, color: 'purple', highLighted: false },
        //     { x: 1, y: 9, color: 'purple', highLighted: false },
        //     { x: 2, y: 9, color: 'red', highLighted: false },
        //     { x: 3, y: 9, color: 'red', highLighted: false },
        //     { x: 4, y: 9, color: 'blue', highLighted: false },
        //     { x: 5, y: 9, color: 'blue', highLighted: false },
        //     { x: 6, y: 9, color: 'green', highLighted: false },
        //     { x: 7, y: 9, color: 'red', highLighted: false },
        //     { x: 8, y: 9, color: 'red', highLighted: false },
        //     { x: 9, y: 9, color: 'purple', highLighted: false }
        // ]

        // Test board.
        // must highlight the following:
        // [
        //     { x: 1, y: 0, color: '#AAEEFF', highLighted: true },
        //     { x: 0, y: 1, color: '#AAEEFF', highLighted: true },
        //     { x: 2, y: 1, color: '#AAEEFF', highLighted: true },
        //     { x: 3, y: 1, color: '#AAEEFF', highLighted: true },
        //     { x: 0, y: 2, color: '#AAEEFF', highLighted: true },
        //     { x: 4, y: 2, color: '#AAEEFF', highLighted: true },
        //     { x: 0, y: 3, color: '#AAEEFF', highLighted: true },
        //     { x: 5, y: 3, color: '#AAEEFF', highLighted: true },
        //     { x: 6, y: 3, color: '#AAEEFF', highLighted: true },
        //     { x: 0, y: 4, color: '#AAEEFF', highLighted: true },
        //     { x: 1, y: 4, color: '#AAEEFF', highLighted: true },
        //     { x: 4, y: 4, color: '#AAEEFF', highLighted: true },
        //     { x: 7, y: 4, color: '#AAEEFF', highLighted: true },
        //     { x: 2, y: 5, color: '#AAEEFF', highLighted: true },
        //     { x: 5, y: 5, color: '#AAEEFF', highLighted: true },
        //     { x: 7, y: 5, color: '#AAEEFF', highLighted: true },
        //     { x: 8, y: 5, color: '#AAEEFF', highLighted: true },
        //     { x: 4, y: 6, color: '#AAEEFF', highLighted: true },
        //     { x: 9, y: 6, color: '#AAEEFF', highLighted: true },
        //     { x: 3, y: 0, color: '#AAEEFF', highLighted: true },
        //     { x: 4, y: 0, color: '#AAEEFF', highLighted: true },
        //     { x: 8, y: 0, color: '#AAEEFF', highLighted: true },
        //     { x: 7, y: 1, color: '#AAEEFF', highLighted: true },
        //     { x: 6, y: 2, color: '#AAEEFF', highLighted: true },
        //     { x: 7, y: 2, color: '#AAEEFF', highLighted: true },
        //     { x: 8, y: 3, color: '#AAEEFF', highLighted: true },
        //     { x: 9, y: 4, color: '#AAEEFF', highLighted: true },
        //     { x: 3, y: 4, color: '#AAEEFF', highLighted: true }
        // ]
        // return [
        //     { x: 0, y: 0, color: '#666', highLighted: false },
        //     { x: 1, y: 0, color: '#AAEEFF', highLighted: false },
        //     { x: 2, y: 0, color: '#CCC', highLighted: false },
        //     { x: 3, y: 0, color: '#AAEEFF', highLighted: false },
        //     { x: 4, y: 0, color: '#AAEEFF', highLighted: false },
        //     { x: 5, y: 0, color: '#666', highLighted: false },
        //     { x: 6, y: 0, color: '#666', highLighted: false },
        //     { x: 7, y: 0, color: '#666', highLighted: false },
        //     { x: 8, y: 0, color: '#AAEEFF', highLighted: false },
        //     { x: 9, y: 0, color: '#CCC', highLighted: false },
        //     { x: 0, y: 1, color: '#AAEEFF', highLighted: false },
        //     { x: 1, y: 1, color: '#CCC', highLighted: false },
        //     { x: 2, y: 1, color: '#AAEEFF', highLighted: false },
        //     { x: 3, y: 1, color: '#AAEEFF', highLighted: false },
        //     { x: 4, y: 1, color: '#666', highLighted: false },
        //     { x: 5, y: 1, color: '#666', highLighted: false },
        //     { x: 6, y: 1, color: '#CCC', highLighted: false },
        //     { x: 7, y: 1, color: '#AAEEFF', highLighted: false },
        //     { x: 8, y: 1, color: '#666', highLighted: false },
        //     { x: 9, y: 1, color: '#666', highLighted: false },
        //     { x: 0, y: 2, color: '#AAEEFF', highLighted: false },
        //     { x: 1, y: 2, color: '#666', highLighted: false },
        //     { x: 2, y: 2, color: '#666', highLighted: false },
        //     { x: 3, y: 2, color: '#CCC', highLighted: false },
        //     { x: 4, y: 2, color: '#AAEEFF', highLighted: false },
        //     { x: 5, y: 2, color: '#CCC', highLighted: false },
        //     { x: 6, y: 2, color: '#AAEEFF', highLighted: false },
        //     { x: 7, y: 2, color: '#AAEEFF', highLighted: false },
        //     { x: 8, y: 2, color: '#666', highLighted: false },
        //     { x: 9, y: 2, color: '#CCC', highLighted: false },
        //     { x: 0, y: 3, color: '#AAEEFF', highLighted: false },
        //     { x: 1, y: 3, color: '#CCC', highLighted: false },
        //     { x: 2, y: 3, color: '#CCC', highLighted: false },
        //     { x: 3, y: 3, color: '#CCC', highLighted: false },
        //     { x: 4, y: 3, color: '#666', highLighted: false },
        //     { x: 5, y: 3, color: '#AAEEFF', highLighted: false },
        //     { x: 6, y: 3, color: '#AAEEFF', highLighted: false },
        //     { x: 7, y: 3, color: '#CCC', highLighted: false },
        //     { x: 8, y: 3, color: '#AAEEFF', highLighted: false },
        //     { x: 9, y: 3, color: '#666', highLighted: false },
        //     { x: 0, y: 4, color: '#AAEEFF', highLighted: false },
        //     { x: 1, y: 4, color: '#AAEEFF', highLighted: false },
        //     { x: 2, y: 4, color: '#666', highLighted: false },
        //     { x: 3, y: 4, color: '#AAEEFF', highLighted: false },
        //     { x: 4, y: 4, color: '#AAEEFF', highLighted: false },
        //     { x: 5, y: 4, color: '#CCC', highLighted: false },
        //     { x: 6, y: 4, color: '#666', highLighted: false },
        //     { x: 7, y: 4, color: '#AAEEFF', highLighted: false },
        //     { x: 8, y: 4, color: '#666', highLighted: false },
        //     { x: 9, y: 4, color: '#AAEEFF', highLighted: false },
        //     { x: 0, y: 5, color: '#666', highLighted: false },
        //     { x: 1, y: 5, color: '#CCC', highLighted: false },
        //     { x: 2, y: 5, color: '#AAEEFF', highLighted: false },
        //     { x: 3, y: 5, color: '#CCC', highLighted: false },
        //     { x: 4, y: 5, color: '#666', highLighted: false },
        //     { x: 5, y: 5, color: '#AAEEFF', highLighted: false },
        //     { x: 6, y: 5, color: '#666', highLighted: false },
        //     { x: 7, y: 5, color: '#AAEEFF', highLighted: false },
        //     { x: 8, y: 5, color: '#AAEEFF', highLighted: false },
        //     { x: 9, y: 5, color: '#CCC', highLighted: false },
        //     { x: 0, y: 6, color: '#AAEEFF', highLighted: false },
        //     { x: 1, y: 6, color: '#CCC', highLighted: false },
        //     { x: 2, y: 6, color: '#666', highLighted: false },
        //     { x: 3, y: 6, color: '#666', highLighted: false },
        //     { x: 4, y: 6, color: '#AAEEFF', highLighted: false },
        //     { x: 5, y: 6, color: '#CCC', highLighted: false },
        //     { x: 6, y: 6, color: '#CCC', highLighted: false },
        //     { x: 7, y: 6, color: '#666', highLighted: false },
        //     { x: 8, y: 6, color: '#666', highLighted: false },
        //     { x: 9, y: 6, color: '#AAEEFF', highLighted: false },
        //     { x: 0, y: 7, color: '#CCC', highLighted: false },
        //     { x: 1, y: 7, color: '#AAEEFF', highLighted: false },
        //     { x: 2, y: 7, color: '#AAEEFF', highLighted: false },
        //     { x: 3, y: 7, color: '#666', highLighted: false },
        //     { x: 4, y: 7, color: '#CCC', highLighted: false },
        //     { x: 5, y: 7, color: '#666', highLighted: false },
        //     { x: 6, y: 7, color: '#666', highLighted: false },
        //     { x: 7, y: 7, color: '#CCC', highLighted: false },
        //     { x: 8, y: 7, color: '#666', highLighted: false },
        //     { x: 9, y: 7, color: '#CCC', highLighted: false },
        //     { x: 0, y: 8, color: '#CCC', highLighted: false },
        //     { x: 1, y: 8, color: '#AAEEFF', highLighted: false },
        //     { x: 2, y: 8, color: '#AAEEFF', highLighted: false },
        //     { x: 3, y: 8, color: '#CCC', highLighted: false },
        //     { x: 4, y: 8, color: '#CCC', highLighted: false },
        //     { x: 5, y: 8, color: '#AAEEFF', highLighted: false },
        //     { x: 6, y: 8, color: '#CCC', highLighted: false },
        //     { x: 7, y: 8, color: '#666', highLighted: false },
        //     { x: 8, y: 8, color: '#AAEEFF', highLighted: false },
        //     { x: 9, y: 8, color: '#AAEEFF', highLighted: false },
        //     { x: 0, y: 9, color: '#666', highLighted: false },
        //     { x: 1, y: 9, color: '#666', highLighted: false },
        //     { x: 2, y: 9, color: '#AAEEFF', highLighted: false },
        //     { x: 3, y: 9, color: '#CCC', highLighted: false },
        //     { x: 4, y: 9, color: '#666', highLighted: false },
        //     { x: 5, y: 9, color: '#AAEEFF', highLighted: false },
        //     { x: 6, y: 9, color: '#AAEEFF', highLighted: false },
        //     { x: 7, y: 9, color: '#CCC', highLighted: false },
        //     { x: 8, y: 9, color: '#AAEEFF', highLighted: false },
        //     { x: 9, y: 9, color: '#AAEEFF', highLighted: false }
        // ]
    }

    componentWillMount() {
        this.setState({ boardData: this.generateBoardData() })
    }

    newBoard = () => {
        this.setState({ boardData: this.generateBoardData() })
    }

    highLighCells = (neighboursToHighlight) => {
        const { boardData } = this.state

        for (const cell of neighboursToHighlight) {
            const cellToHighlight = boardData.find((c) => {
                return c.x === cell.x && c.y === cell.y
            })
            cellToHighlight.highLighted = true
        }

        this.setState({ boardData: boardData })
    }

    // group neighbour groups by color
    // a color is an array of arrays, each array has grouped cells by proximity
    // we keep track of which neighbourhood has more neighbours so that we can easily find the one we want later
    findNeighbours = () => {
        const checkIfPointsAreNeighbours = (pointA, pointB) => {
            // TOP AND BOTTOM
            return (
                (pointA.x === pointB.x && pointA.y === pointB.y - 1) ||
                (pointA.x === pointB.x && pointA.y === pointB.y + 1) ||
                // LEFT and RIGHT
                (pointA.x === pointB.x - 1 && pointA.y === pointB.y) ||
                (pointA.x === pointB.x + 1 && pointA.y === pointB.y) ||
                // TOP DIAGONALS (LEFT AND RIGHT)
                (pointA.x === pointB.x - 1 && pointA.y === pointB.y - 1) ||
                (pointA.x === pointB.x + 1 && pointA.y === pointB.y - 1) ||
                // BOTTOM DIAGONALS (LEFT AND RIGHT)
                (pointA.x === pointB.x - 1 && pointA.y === pointB.y + 1) ||
                (pointA.x === pointB.x + 1 && pointA.y === pointB.y + 1)
            )
        }
        const groupNeighboursByColor = (result, cell) => {
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
                        return checkIfPointsAreNeighbours(cell, cellInGroupOfNeighbours)
                    })

                    if (areNeighbours) {
                        // console.log('Push Neighbour to group')
                        groupOfNeighbours.push(cell)
                    }

                    // Update max counter if neighbourhood got bigger than the existing max
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

        const joinNeighbourhoodsThatTouchHeachOther = (result, color) => {
            const neighbourhoodsOfColor = neighboursByColor[color]
            const mergedNeighbourhoods = neighbourhoodsOfColor.reduce((joined_neighbourhoods, color_neighbourhood) => {
                let foundTouchingNeighbours = false

                // check if joined_neigh has any points that are neighbours of any points in color_neighbourhood
                const chechIfJoinedNeighTouchesColorNeigh = (point_in_joined_neigh) => {
                    const points_touch = color_neighbourhood.some((point_in_color_neigh) =>
                        checkIfPointsAreNeighbours(point_in_joined_neigh, point_in_color_neigh)
                    )
                    // the two neighbours touch each other if any of the points inside them
                    // touch each other
                    // console.log('POINTS_TOUCH?', points_touch)
                    return points_touch
                }

                // check if we find any touching neighbourhoods and if we do join them together
                joined_neighbourhoods.some((joined_neigh, index) => {
                    // console.log('color_neighbourhood', color_neighbourhood, 'is touching?', joined_neigh)
                    const areTheseNeighbourhoodsConnected = joined_neigh.some(chechIfJoinedNeighTouchesColorNeigh)

                    // if they are, join them together
                    if (areTheseNeighbourhoodsConnected) {
                        joined_neighbourhoods[index] = [...joined_neigh, ...color_neighbourhood]
                    }
                    return areTheseNeighbourhoodsConnected
                })

                if (!foundTouchingNeighbours) {
                    joined_neighbourhoods.push(color_neighbourhood)
                }
                return joined_neighbourhoods
            }, [])
            result[color] = mergedNeighbourhoods
            return result
        }

        const sortColorTuplesByNeighbourhoodsWithMaxCells = (allColorsGroupsTuplesA, allColorsGroupsTuplesB) => {
            // tuple[0] is color name
            // tuple[1] array of neighbourhoods
            // tuple[1][0]  is neighbourhood with max number of cells since I already ordered it
            if (allColorsGroupsTuplesB[1][0].length < allColorsGroupsTuplesA[1][0].length) {
                return -1
            }
            if (allColorsGroupsTuplesB[1][0].length > allColorsGroupsTuplesA[1][0].length) {
                return 1
            }
            return 0
        }

        const sortNeighbourhoodsByLength = (colorGroupA, colorGroupB) => {
            // sort the neighbour groups of a given color so that we can pick the first one
            if (colorGroupB.length < colorGroupA.length) {
                return -1
            }
            if (colorGroupB.length > colorGroupA.length) {
                return 1
            }
            return 0
        }

        const orderColorNeighbourhoodsBySize = (result, color) => {
            result[color] = joinedNeighbourhoodsByColor[color].sort(sortNeighbourhoodsByLength)
            return result
        }

        const orderColorsByNumberOfNeighbours = (result, color) => {
            result[color] = orderedJoinedNeighbourhoodsByColor[color].sort(sortNeighbourhoodsByLength)
            return result
        }

        const neighboursByColor = this.state.boardData.reduce(groupNeighboursByColor, {})
        console.log('NEIGHBOURHOODS_BY_COLOR:', neighboursByColor)

        const joinedNeighbourhoodsByColor = Object.keys(neighboursByColor).reduce(
            joinNeighbourhoodsThatTouchHeachOther,
            {}
        )
        console.log('JOINED_NEIGHBOURHOODS_BY_COLOR:', joinedNeighbourhoodsByColor)

        const orderedJoinedNeighbourhoodsByColor = Object.keys(joinedNeighbourhoodsByColor).reduce(
            orderColorNeighbourhoodsBySize,
            {}
        )

        console.log('ORDERED_JOINED_NEIGHBOURHOODS_BY_COLOR', orderedJoinedNeighbourhoodsByColor)

        const orderedColorsByNumberOfNeighbours = Object.entries(orderedJoinedNeighbourhoodsByColor).sort(
            sortColorTuplesByNeighbourhoodsWithMaxCells
        )

        console.log('ORDERED_COLORS_BY_NUMBER_OF_NEIGHBOURS', orderedColorsByNumberOfNeighbours)
        // since everything os ordered now I have:
        // ORDERED_COLORS_BY_NUMBER_OF_NEIGHBOURS[0] is the first color tuple
        // ORDERED_COLORS_BY_NUMBER_OF_NEIGHBOURS[0][1] is all the neighbourhood groups of the first color
        // ORDERED_COLORS_BY_NUMBER_OF_NEIGHBOURS[0][1][0] is the neighbourhood with most cells
        const neighboursToHighlight = orderedColorsByNumberOfNeighbours[0][1][0]
        console.log('neighboursToHighlight:', neighboursToHighlight)

        this.highLighCells(neighboursToHighlight)
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
