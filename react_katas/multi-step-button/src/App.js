import React, { Component } from 'react'
import logo from './logo.svg'
import './App.css'

import CartButton from './Buttons/CartButton'
import MultiStepButton from './Buttons/MultiStepButton'
import HelloButton from './Buttons/HelloButton'
import SpawnChildrenButton from './Buttons/SpawnChildrenButton'
import DrawerButton from './Buttons/DrawerButton'
import FallingButton from './Buttons/FallingButton'

class App extends Component {
    render() {
        return (
            <div className="App">
                {/* <header className="App-header">
                    <img src={logo} className="App-logo" alt="logo" />
                    <h1 className="App-title">Welcome to React</h1>
                </header> */}
                <br />

                <CartButton />

                <MultiStepButton
                    messages={['Hello', 'Is it me?', 'You\'re looking for?', '!WOW!']}
                    action={() => console.log('Action!')}
                />
                <br />

                <HelloButton />
                <br />

                <SpawnChildrenButton colorScheme={['#AB47BC', '#2196F3', '#8BC34A', '#FFB300', '#9C27B0', '#ff1744']} />

                <br />
                <FallingButton />
                <br />

                <DrawerButton>
                    <div>
                        <h1>Drawer Content</h1>
                        <p>Hi There :)</p>
                    </div>
                </DrawerButton>
            </div>
        )
    }
}

export default App
