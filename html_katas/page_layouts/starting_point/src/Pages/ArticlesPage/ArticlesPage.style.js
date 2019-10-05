import styled from 'styled-components';

const StyledArticlesPage = styled.div`
  color: white;


  .main-header{
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
    flex-flow: column;
    border: 1px solid blue;
  }

  .logo {
    color: red;
    width: 100px;
    border: 1px solid red;
    padding: 0em 1em;
  }

  .header-menu{
    display: flex;
    justify-content: center;
    justify-content: space-evenly;
    border: 1px solid yellow;
    width: 100%;
    padding: 1em;
  }

  .nav-item{
  }

  .main-content{
    display: flex;
  }

  .secondary-nav{
    flex: 1;
    border: 1px solid orange;
  }

  .content{
    flex: 3;
    border: 1px solid green;
  }

  .two-columns{
    display: flex;
  }

  .two-columns p{
    flex: 1;
    border: 1px solid orange;
    padding: 1em;
  }

  .footer-icons{
    padding: 0px;
    margin: 0px;
    list-style: none;
    display: flex;
    justify-content: space-evenly;
    border: 1px solid olivedrab;
  }

  .footer-icon {
    border: 1px solid hotpink;
    padding: 0.5em;
  }

  .article-with-icons {
    display: flex;
  }

  .article-with-icons p:first-child{
    margin-top: 0px;
    padding-top: 0px;
  }

  .article-icons-container {
    flex: 1;
  }

  .article-content{
    flex: 4;
  }

  .article-icons {
    padding: 0px;
    margin: 0px;
    list-style: none;

    display: flex;
    flex-flow: column;
  }

  .article-icon{
    padding: 0.2em;
    margin-bottom: 0.5em;
    border: 1px solid red;
    width: 50px;
  }
`;

export default StyledArticlesPage
