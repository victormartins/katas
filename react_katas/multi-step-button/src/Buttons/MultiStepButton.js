import React from 'react'
import PropTypes from 'prop-types'
import styled from 'styled-components'

class MultiStepButton extends React.Component {
    state = {
        timesPressed: 0
    }
    static propTypes = {
        action: PropTypes.func.isRequired,
        messages: PropTypes.array.isRequired
    }

    onPress = () => {
        const { action, messages } = this.props
        const { timesPressed } = this.state

        this.setState(
            {
                timesPressed: timesPressed + 1
            },
            () => {
                if (timesPressed === messages.length - 1) {
                    // execute the sent action
                    action()
                    // reset the state
                    this.setState({ timesPressed: 0 })
                }
            }
        )
    }

    render() {
        const { action, messages } = this.props
        const { timesPressed } = this.state

        return (
            <Button onClick={this.onPress} timesPressed={timesPressed}>
                {' '}
                {messages[timesPressed]}{' '}
            </Button>
        )
    }
}

export default MultiStepButton

const Button = styled.button`
    color: white;
    border-radius: 12px;
    box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
    border: none;
    font-size: 1em;
    padding: 0.2em 0.5em;

    transition: transform 0.3s cubic-bezier(0.68, -0.55, 0.265, 1.55);
    ${({ timesPressed }) => {
        let background = ''

        switch (timesPressed) {
            case 1:
                background = 'background: #e53935;'
                break
            case 2:
                background = 'background: #c62828;'
                break
            case 3:
                background = 'background: #ff1744;'
                break

            default:
                background = 'background: #ef9a9a;'
                break
        }
        // scale the button based on the clicks
        return `
            ${background}
            transform: scale(${1.1 * (timesPressed + 1)});
          `
    }};
`
