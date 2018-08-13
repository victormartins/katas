import React from 'react'
import styled from 'styled-components'

const Button = styled.button`
    transition: padding-left 1s, padding-right 1s, padding-top 1s, padding-bottom 0.2s, background-color 1s;
    border-radius: 12px;
    box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
    font-size: 2em;
    margin-top: 0.5em;
    padding: ${(props) => {
        const totalPadding = props.clickCounter * 10
        return `${totalPadding}px;`
    }};

    background-color: #f57f17;
    &.happyBtn {
        background-color: #ffee58;
    }
`

export default class HelloButton extends React.Component {
    state = {
        clickCounter: 0,
        classList: ''
    }

    render() {
        const { clickCounter } = this.state
        const handleEvent = (event) => {
            if (event.target.name === 'helloBtn') {
                // toggle the class list to have happyBtn
                event.target.classList.toggle('happyBtn')
                // class list is st into state so that when the button re renders it will use it.
                // otherwise we seem to loose our classList changes when it renders.
                this.setState({ clickCounter: clickCounter + 1, classList: event.target.classList })
            }
        }
        console.log('classList', this.state.classList)
        return (
            <Button name="helloBtn" onClick={handleEvent} clickCounter={clickCounter} className={this.state.classList}>
                Hello {clickCounter}
            </Button>
        )
    }
}
