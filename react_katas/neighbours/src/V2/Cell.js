import React from 'react'
import styled, { css } from 'styled-components'

export default class Cell extends React.Component {
    render() {
        return (
            <Div className="cell" color={this.props.color} highLighted={this.props.highLighted}>
                <span>{this.props.cellID}</span>
            </Div>
        )
    }
}

const Div = styled.div`
    color: white;
    margin: 2px;
    padding: 10px;
    width: 30px;
    height: 30px;
    background-color: ${(props) => props.color};
    border: 4px solid white;
    ${(props) =>
        props.highLighted &&
        css`
            border: 4px solid black;
        `};
`
