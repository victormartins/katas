import React from 'react';
import {
  StyledPage,
  Header, HeaderInfo, LayoutContainer, LayoutHolderContainer} from '../../Styles/Common.style';
import thumb from './imgs/thumb.png'

const LayoutHolder = (props) => {
  return(
    <LayoutHolderContainer>
      <Header>
        <HeaderInfo>
          <h1>{props.name}</h1>
          <p>{props.info}</p>
        </HeaderInfo>
        <div>
          <img src={thumb} alt="Thumbnail"/>
        </div>
      </Header>
      <LayoutContainer>
        {props.children}
      </LayoutContainer>
    </LayoutHolderContainer>
  )
}

export default LayoutHolder;
