import React from 'react'
import styled, { css } from 'styled-components'

export default class Cell extends React.Component {
    render() {
        return <Div className="cell" color={this.props.color} highlighted={this.props.highlighted} />
    }
}

const Div = styled.div`
    margin: 2px;
    padding: 10px;
    width: 10px;
    height: 10px;
    background-color: ${(props) => props.color};

    ${(props) =>
        props.highlighted &&
        css`
            border: 2px solid black;
        `};
`
