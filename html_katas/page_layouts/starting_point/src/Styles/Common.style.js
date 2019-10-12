
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
  width: 90%;
  margin: 0 auto;
`

const HeaderInfo = styled.div`
  margin: auto 0;
`

const LayoutContainer = styled.div`
  background-color: white;
`;

const LayoutHolderContainer = styled.article`
  background-color: white;
`;

export {StyledPage, Header, HeaderInfo, LayoutContainer, LayoutHolderContainer};
