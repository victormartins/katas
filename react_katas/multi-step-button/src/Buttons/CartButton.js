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
    padding-top: 1em;
    padding-bottom: 0.3em;
    border-bottom: 1px solid black;
    cursor: pointer;
  }

  li:hover{
    background-color: black;
    color: white;
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
                        <li>Item 1</li>
                        <li>Item 2</li>
                    </ul>
                </Cart>
            </div>
        )
    }
}

export default CartButton