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
        // return result

        // This set forces us to check if cells that did not had neighbours in the past
        // have in the future. We do this by merging groups of neighbours together after we group them
        // return [
        //     { x: 0, y: 0, color: 'blue', highLighted: false },
        //     { x: 1, y: 0, color: 'blue', highLighted: false },
        //     { x: 2, y: 0, color: 'blue', highLighted: false },
        //     { x: 3, y: 0, color: 'purple', highLighted: false },
        //     { x: 0, y: 1, color: 'green', highLighted: false },
        //     { x: 1, y: 1, color: 'purple', highLighted: false },
        //     { x: 2, y: 1, color: 'purple', highLighted: false },
        //     { x: 3, y: 1, color: 'purple', highLighted: false },
        //     { x: 0, y: 2, color: 'blue', highLighted: false },
        //     { x: 1, y: 2, color: 'green', highLighted: false },
        //     { x: 2, y: 2, color: 'purple', highLighted: false },
        //     { x: 3, y: 2, color: 'blue', highLighted: false }
        // ]

        return [
            { x: 0, y: 0, color: 'red', highLighted: false },
            { x: 1, y: 0, color: 'blue', highLighted: false },
            { x: 2, y: 0, color: 'purple', highLighted: false },
            { x: 3, y: 0, color: 'green', highLighted: false },
            { x: 4, y: 0, color: 'blue', highLighted: false },
            { x: 5, y: 0, color: 'blue', highLighted: false },
            { x: 6, y: 0, color: 'green', highLighted: false },
            { x: 7, y: 0, color: 'red', highLighted: false },
            { x: 8, y: 0, color: 'blue', highLighted: false },
            { x: 9, y: 0, color: 'blue', highLighted: false },
            { x: 0, y: 1, color: 'blue', highLighted: false },
            { x: 1, y: 1, color: 'green', highLighted: false },
            { x: 2, y: 1, color: 'green', highLighted: false },
            { x: 3, y: 1, color: 'green', highLighted: false },
            { x: 4, y: 1, color: 'red', highLighted: false },
            { x: 5, y: 1, color: 'green', highLighted: false },
            { x: 6, y: 1, color: 'purple', highLighted: false },
            { x: 7, y: 1, color: 'green', highLighted: false },
            { x: 8, y: 1, color: 'green', highLighted: false },
            { x: 9, y: 1, color: 'green', highLighted: false },
            { x: 0, y: 2, color: 'blue', highLighted: false },
            { x: 1, y: 2, color: 'purple', highLighted: false },
            { x: 2, y: 2, color: 'purple', highLighted: false },
            { x: 3, y: 2, color: 'purple', highLighted: false },
            { x: 4, y: 2, color: 'red', highLighted: false },
            { x: 5, y: 2, color: 'purple', highLighted: false },
            { x: 6, y: 2, color: 'purple', highLighted: false },
            { x: 7, y: 2, color: 'blue', highLighted: false },
            { x: 8, y: 2, color: 'purple', highLighted: false },
            { x: 9, y: 2, color: 'blue', highLighted: false },
            { x: 0, y: 3, color: 'green', highLighted: false },
            { x: 1, y: 3, color: 'purple', highLighted: false },
            { x: 2, y: 3, color: 'green', highLighted: false },
            { x: 3, y: 3, color: 'purple', highLighted: false },
            { x: 4, y: 3, color: 'green', highLighted: false },
            { x: 5, y: 3, color: 'green', highLighted: false },
            { x: 6, y: 3, color: 'red', highLighted: false },
            { x: 7, y: 3, color: 'green', highLighted: false },
            { x: 8, y: 3, color: 'red', highLighted: false },
            { x: 9, y: 3, color: 'red', highLighted: false },
            { x: 0, y: 4, color: 'purple', highLighted: false },
            { x: 1, y: 4, color: 'blue', highLighted: false },
            { x: 2, y: 4, color: 'red', highLighted: false },
            { x: 3, y: 4, color: 'blue', highLighted: false },
            { x: 4, y: 4, color: 'blue', highLighted: false },
            { x: 5, y: 4, color: 'purple', highLighted: false },
            { x: 6, y: 4, color: 'green', highLighted: false },
            { x: 7, y: 4, color: 'green', highLighted: false },
            { x: 8, y: 4, color: 'green', highLighted: false },
            { x: 9, y: 4, color: 'purple', highLighted: false },
            { x: 0, y: 5, color: 'blue', highLighted: false },
            { x: 1, y: 5, color: 'green', highLighted: false },
            { x: 2, y: 5, color: 'red', highLighted: false },
            { x: 3, y: 5, color: 'green', highLighted: false },
            { x: 4, y: 5, color: 'purple', highLighted: false },
            { x: 5, y: 5, color: 'green', highLighted: false },
            { x: 6, y: 5, color: 'red', highLighted: false },
            { x: 7, y: 5, color: 'red', highLighted: false },
            { x: 8, y: 5, color: 'green', highLighted: false },
            { x: 9, y: 5, color: 'red', highLighted: false },
            { x: 0, y: 6, color: 'purple', highLighted: false },
            { x: 1, y: 6, color: 'purple', highLighted: false },
            { x: 2, y: 6, color: 'purple', highLighted: false },
            { x: 3, y: 6, color: 'green', highLighted: false },
            { x: 4, y: 6, color: 'blue', highLighted: false },
            { x: 5, y: 6, color: 'red', highLighted: false },
            { x: 6, y: 6, color: 'blue', highLighted: false },
            { x: 7, y: 6, color: 'purple', highLighted: false },
            { x: 8, y: 6, color: 'purple', highLighted: false },
            { x: 9, y: 6, color: 'red', highLighted: false },
            { x: 0, y: 7, color: 'red', highLighted: false },
            { x: 1, y: 7, color: 'purple', highLighted: false },
            { x: 2, y: 7, color: 'purple', highLighted: false },
            { x: 3, y: 7, color: 'red', highLighted: false },
            { x: 4, y: 7, color: 'blue', highLighted: false },
            { x: 5, y: 7, color: 'green', highLighted: false },
            { x: 6, y: 7, color: 'red', highLighted: false },
            { x: 7, y: 7, color: 'green', highLighted: false },
            { x: 8, y: 7, color: 'blue', highLighted: false },
            { x: 9, y: 7, color: 'blue', highLighted: false },
            { x: 0, y: 8, color: 'red', highLighted: false },
            { x: 1, y: 8, color: 'purple', highLighted: false },
            { x: 2, y: 8, color: 'purple', highLighted: false },
            { x: 3, y: 8, color: 'purple', highLighted: false },
            { x: 4, y: 8, color: 'red', highLighted: false },
            { x: 5, y: 8, color: 'red', highLighted: false },
            { x: 6, y: 8, color: 'red', highLighted: false },
            { x: 7, y: 8, color: 'red', highLighted: false },
            { x: 8, y: 8, color: 'blue', highLighted: false },
            { x: 9, y: 8, color: 'red', highLighted: false },
            { x: 0, y: 9, color: 'purple', highLighted: false },
            { x: 1, y: 9, color: 'purple', highLighted: false },
            { x: 2, y: 9, color: 'red', highLighted: false },
            { x: 3, y: 9, color: 'red', highLighted: false },
            { x: 4, y: 9, color: 'blue', highLighted: false },
            { x: 5, y: 9, color: 'blue', highLighted: false },
            { x: 6, y: 9, color: 'green', highLighted: false },
            { x: 7, y: 9, color: 'red', highLighted: false },
            { x: 8, y: 9, color: 'red', highLighted: false },
            { x: 9, y: 9, color: 'purple', highLighted: false }
        ]
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

        const colorsAndNeighbours = this.state.boardData.reduce(groupColorsByNeighbours, {})
        console.log('NEIGHBOURHOODS_BY_COLOR:', colorsAndNeighbours)
        const maxNeighbours = Object.entries(colorsAndNeighbours)
            .sort((allColorsGroupsTuplesA, allColorsGroupsTuplesB) => {
                if (allColorsGroupsTuplesB[1].max < allColorsGroupsTuplesA[1].max) {
                    return -1
                }
                if (allColorsGroupsTuplesB[1].max > allColorsGroupsTuplesA[1].max) {
                    return 1
                }
                return 0
            })[0][1] // 0 is color name, // 1 is the neighbourhood arrays with the neighbour cells inside
            .reduce((joined_neighbourhoods, color_neighbourhood) => {
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
            .sort((colorGroupTupleA, colorGroupTupleB) => {
                // sort the neighbour groups of a given color so that we can pick the first one
                if (colorGroupTupleB.length < colorGroupTupleA.length) {
                    return -1
                }
                if (colorGroupTupleB.length > colorGroupTupleA.length) {
                    return 1
                }
                return 0
            })

        const neighboursToHighlight = maxNeighbours[0]
        console.log('Max NEIGHBOURS:', maxNeighbours)
        console.log('MaxToHighLight:', neighboursToHighlight)

        const { boardData } = this.state

        for (const cell of neighboursToHighlight) {
            const cellToHighlight = boardData.find((c) => {
                return c.x === cell.x && c.y === cell.y
            })
            cellToHighlight.highLighted = true
        }

        this.setState({ boardData: boardData })
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
