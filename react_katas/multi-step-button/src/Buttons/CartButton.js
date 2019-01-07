import React from 'react'
import styled from 'styled-components'

const CartBtn = styled.button`
  font-size: 20px;
  padding: 0.5em;
  margin-bottom: 1em;
`

const Cart = styled.div`
  width: 200px;
  height: 100%;
  top: 0px;
  position: absolute;
  background-color: red;
  display: ${props => props.open ? 'block' : 'none'};

  ul {
    list-style: none;
    padding: 0px;
  }

  li{
    padding: 1em 1em 0.3em 1em;
    border-bottom: 1px solid black;
    cursor: pointer;
    span {
      border-bottom: 1px solid black;
    }

    background-color: orange;
    margin: 0.4em;

    text-align: left;
    display: flex;
    justify-content: space-between;

    box-shadow: -3px 3px 3px;
  }

  li:hover{
    background-color: black;
    color: white;

    span {
      background-color: blue;
      border: 1px solid;
      padding: 0.2em;
    }
  }
`

class CartButton extends React.Component {
    constructor(props){
        super(props)

        this.state = {
            open: false
        }
    }

    handleClick = () => {
      this.setState(
        {
          open: !this.state.open
        }
      )
    }

    render(){
        return (
            <div className='cart-button'>
                <CartBtn onClick={this.handleClick}>Shopping Cart</CartBtn>
                <Cart open={this.state.open}>
                    <ul>
                        <li>Some Item <span>£10.00</span></li>
                        <li>Another Item <span>£12.00</span></li>
                    </ul>
                </Cart>
            </div>
        )
    }
}

export default CartButton