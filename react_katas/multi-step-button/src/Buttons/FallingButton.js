import React from 'react'
import styled from 'styled-components'

class FallingButton extends React.Component{
    constructor(props){
        super(props)

        this.state = {
            clicked: false
        }
    }

    handleClick = () => {
      this.setState({clicked: !this.state.clicked})
    }

    render(){
        return(
            <TheFallingButtonContainer>
                <TheFallingButton onClick={this.handleClick} clicked={this.state.clicked}>
                  Falling
                </TheFallingButton>
            </TheFallingButtonContainer>
        )
    }
}

const TheFallingButtonContainer = styled.div `
  position: relative;
`

const TheFallingButton = styled.button `
  padding: 1em;
  position: absolute;
  top: 0px;

  ${(props) => {
        console.log(props)

        if(props.clicked){
            return `
            top: 50px;
            color: red;
            `

        }
    }}
`

export default FallingButton