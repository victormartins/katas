import React from 'react'
import styled from 'styled-components'

export default function(props) {
    return <Div className="cell" color={props.color} />
}

const Div = styled.div`
    margin: 2px;
    padding: 10px;
    width: 10px;
    height: 10px;
    background-color: ${(props) => props.color};
`
