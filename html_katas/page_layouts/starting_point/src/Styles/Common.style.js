
import styled from 'styled-components';

const StyledPage = styled.div`
  background-color: rgb(239, 239, 239);
  padding: 2em;
`

const Header = styled.div`
  display: flex;
  justify-content:space-between;
  background-color: white;
  padding: 2em;
`

const HeaderInfo = styled.div`
  margin: auto 0;
`

const LayoutContainer = styled.div`
  background-color: white;
`;

const LayoutHolderContainer = styled.article`
`;

export {StyledPage, Header, HeaderInfo, LayoutContainer, LayoutHolderContainer};
