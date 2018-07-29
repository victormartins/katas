import React from 'react'
import styled, { css } from 'styled-components'

export default class Cell extends React.Component {
    render() {
        return <Div className="cell" color={this.props.color} highLighted={this.props.highLighted} />
    }
}

const Div = styled.div`
    margin: 2px;
    padding: 10px;
    width: 10px;
    height: 10px;
    background-color: ${(props) => props.color};
    border: 2px solid white;
    ${(props) =>
        props.highLighted &&
        css`
            border: 2px solid black;
        `};
`
