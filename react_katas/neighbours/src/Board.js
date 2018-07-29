import React from 'react'
import Cell from './Cell'
import styled from 'styled-components'

export default class Board extends React.Component {
    state = {
        coloredBoard: [],
        boardData: [],
        cells: []
    }

    generateBoard = () => {
        const { boardWidth, boardHeight } = this.props
        const result = []
        const data = []
        for (let x = 0; x < boardWidth; x++) {
            const row = []
            const dataRow = []
            for (let y = 0; y < boardHeight; y++) {
                const color = this.randomColor()
                const position = { x, y }
                const highLighted = false
                dataRow.push({ color: color, position: position, highLighted: highLighted })
                row.push(<Cell key={`${x}_${y}`} color={color} position={position} highLighted={highLighted} />)
            }

            data.push(dataRow)
            result.push(
                <div key={x} className="row">
                    {row}
                </div>
            )
        }

        // console.log('GENERATED_BOARD:', result)

        const cells = result
            .map((row) => {
                return row.props.children
            })
            .reduce((result, array_of_cells) => [...result, ...array_of_cells], [])

        this.setState({ coloredBoard: result, cells: cells, boardData: data })
    }

    randomColor = () => {
        const { colorScheme } = this.props
        const maxLength = colorScheme.length
        let index = Math.floor(Math.random() * maxLength)
        return colorScheme[index]
    }
    findMaxNeighbours = () => {
        const groupPositionsByColor = this.state.cells.reduce((result, cell) => {
            const { color, position } = cell.props

            result[color] = result[color] || []
            result[color].push(position)

            return result
        }, {})

        const checkIfNeighbours = (p1, p2) => {
            return (
                (p1['x'] === p2['x'] || p1['x'] === p2['x'] + 1 || p1['x'] === p2['x'] - 1) &&
                (p1['y'] === p2['y'] || p1['y'] === p2['y'] + 1 || p1['y'] === p2['y'] - 1)
            )
        }

        const groupByNeighbours = (result, position) => {
            // see if we find any group of neighbours and if we do, add this position to it
            // if we dont, create a new group
            let added = false
            for (const neighboursGroup of result) {
                // console.log('neighboursGroup', neighboursGroup)
                if (
                    neighboursGroup.some((element) => {
                        return checkIfNeighbours(element, position)
                    })
                ) {
                    added = true
                    neighboursGroup.push(position)
                }
            }

            if (!added) {
                // no neighbours group found, so lets create a new group
                result.push([position])
            }
            return result
        }

        const splitColorsByNeighbourGroups = Object.entries(groupPositionsByColor).reduce(
            (result, groupPositionsByColor) => {
                const color = groupPositionsByColor[0]
                const coordinates = groupPositionsByColor[1]
                const coordinatesGroupedByNeighbours = coordinates.reduce(groupByNeighbours, [])
                // { "blue": [[<neighbours>], [<neighbours>], (...)]}
                result[color] = coordinatesGroupedByNeighbours
                return result
            },
            {}
        )

        const colorWithMostNeighbours = Object.entries(splitColorsByNeighbourGroups).reduce((result, data) => {
            const color = data[0]
            const neighboursGroups = data[1]

            const colorAndGroupWithMostNeighbours = {
                color: color,
                neighbours: neighboursGroups.reduce((result, group) => {
                    if (result === null) {
                        result = group
                    } else {
                        // set result to group if group has more elements
                        result = result.length < group.length ? (result = group) : result
                    }
                    return result
                }, null)
            }

            if (Object.keys(result).length === 0) {
                result = colorAndGroupWithMostNeighbours
                // this is the first color so we set it to result with the group with more neighbours
            } else {
                // ok so we already saved a color so let see if the current group has more neighbours
                if (result.neighbours.length < colorAndGroupWithMostNeighbours.neighbours.length) {
                    result = colorAndGroupWithMostNeighbours
                }
            }
            return result
        }, {})

        // console.log('splitColorsByNeighbourGroups: ', splitColorsByNeighbourGroups)
        // console.log('colorWithMostNeighbours: ', colorWithMostNeighbours)
        return colorWithMostNeighbours
    }
    componentWillMount() {
        this.generateBoard()
    }

    showMaxNeighbours = () => {
        const updatedBoard = []
        const colorWithMostNeighbours = this.findMaxNeighbours()
        console.log('colorWithMostNeighbours: ', colorWithMostNeighbours)
        // console.log('boardData:', this.state.boardData)
        let index = 0
        for (const column of this.state.boardData) {
            // console.log('Column:', column)
            index = index + 1
            const rowCells = []
            for (const cell of column) {
                // console.log('Cell:', cell)
                rowCells.push(
                    <Cell
                        key={`${cell.position['x']}_${cell.position['y']}`}
                        color={cell.color}
                        position={cell.position}
                        highLighted={
                            colorWithMostNeighbours.neighbours.find((e) => {
                                return e.x === cell.position.x && e.y === cell.position.y
                            }) !== undefined
                        }
                    />
                )
            }
            updatedBoard.push(<div key={index}>{rowCells}</div>)
        }

        this.setState({ coloredBoard: updatedBoard })
    }
    render() {
        return (
            <React.Fragment>
                <div className="board">{this.state.coloredBoard}</div>
                <br />
                <button onClick={this.generateBoard}>New</button>
                <button onClick={this.showMaxNeighbours}>Neighbours</button>
            </React.Fragment>
        )
    }
}
