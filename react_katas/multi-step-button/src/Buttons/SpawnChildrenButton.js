import React from 'react'
import Immutable from 'immutable'
import styled from 'styled-components'

export default class SpawnChildrenButton extends React.Component {
    state = {
        createdChildren: new Immutable.List()
    }
    render() {
        const randomColor = () => this.props.colorScheme[Math.floor(Math.random() * this.props.colorScheme.length)]
        const screenWidth = window.screen.width
        const screenHeight = window.screen.height
        const randomX =  () => {return Math.floor(Math.random() * screenWidth)}
        const randomY =  () => {return Math.floor(Math.random() * screenHeight)}
        const spanChildren = this.state.createdChildren.map((childData, index) => {
          return(
            <ChildCell key={`${index}`} position={childData.position} color={childData.color}>
              X
              <ChildData>{`(${childData.position.x},${childData.position.y})`}</ChildData>
            </ChildCell>
          )
        })
        const createChild = () => {
            let { createdChildren } = this.state
            createdChildren = createdChildren.push({
              position: {
                x: randomX(),
                y: randomY()
              },
              color: randomColor()
            })
            this.setState({
                createdChildren: createdChildren
            }, () => {console.log('CHILD_LIST:', createdChildren.toJS())})

        }

        const updateExistingChildren = () => {
          const existingChildren = this.state.createdChildren
          const updatedChildren = existingChildren.map((child) => {
            child.position.x = randomX()
            child.position.y = randomY()
            return child
          })

          this.setState({createdChildren: updatedChildren})
        }

        const clearChildren = () => { this.setState({createdChildren: new Immutable.List})}
        const addAndUpdateChildren = () => {
          updateExistingChildren()
          createChild()
        }
        return (
            <div>
                {spanChildren}
                <br />
                <SpanChildrenButton onClick={addAndUpdateChildren}>?</SpanChildrenButton>
                <br/>
                <button onClick={clearChildren}>clear</button>
                <br />
            </div>
        )
    }
}

const SpanChildrenButton = styled.button`
  padding: 1em 1.3em;
  border-radius: 1em 1em 1em 1em;
  font-size: 1.2em;
  font-weight: bold;
  background-color: #1E88E5;
`

const ChildCell = styled.div`
  position: absolute;
  background-color: ${(props) => props.color};
  padding: 10px;
  border-radius: 10px;
  transition: top 2s, left 2s;

  ${(props) => {
    const {x, y} = props.position
    return `
      left: ${x}px;
      top: ${y}px;
    `
  }}
`

const ChildData = styled.span`
    position: absolute;
    left: 0;
    top: 40px;
    font-size: 0.5em;
    color: red;
`
