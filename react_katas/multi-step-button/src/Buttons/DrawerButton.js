import React from 'react'
import styled from 'styled-components'

export default class DrawerButton extends React.Component {
    state = {
        open: false
    }
    render() {
        const toggleDrawer = () => {
            this.setState({
                open: !this.state.open
            })
            console.log('open = ', this.state.open)
        }

        return (
            <DrawerButtonContainer className="container">
                <Drawer className="drawer" open={this.state.open}>
                    {this.props.children}
                </Drawer>
                <Peekapoo classNAme="peekapoo" href="#" onClick={toggleDrawer}>
                    Peeky
                </Peekapoo>
            </DrawerButtonContainer>
        )
    }
}

const DrawerButtonContainer = styled.div`
    position: relative;
    width: 200px;
    margin: 0 auto;
`

const Peekapoo = styled.a`
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;

    padding: 1em 2em;

    text-decoration: none;
    color: yellow;
    background-color: black;
    border: 1px solid yellow;
`

const Drawer = styled.div`
    position: absolute;
    left: 0;
    width: 100%;
    padding: 1em 2em;

    ${(props) => {
        let css_style
        if (props.open) {
            css_style = 'top: 3em;'
            css_style += 'display: block;'

            return css_style
        } else {
            css_style = 'top: 0em;'
            css_style += 'display: none;'

            return css_style
        }
    }};

    color: red;
    background-color: white;
    border: 1px solid red;
`
