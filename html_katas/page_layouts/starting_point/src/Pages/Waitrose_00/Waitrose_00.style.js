import styled from 'styled-components';

const MainContainer = styled.div`
  position: relative;

  width: 90%;
  margin: 0 auto;
  color: #222;
`;

const TopBar = styled.div`
  position: absolute;
  left: 0px;
  top: 0px;
  width: 100%;
  display: flex;
  justify-content: space-between;
  border-top: 1px solid black;
  padding-top: 1em;
  margin-top: 3em;
`;

const Sponsors = styled.div`
  display: inline-flex;
`;

const SponsorContainer = styled.div `
  img {
    display: inline-block;
    height: 5em;
  }
`

const Shout = styled.div`
  display: inline-flex;
  flex-direction:column;
  justify-content: flex-start;

  text-align:right;
  font-family: 'Playfair Display', serif;

  h1{
    font-size: 4em;
    font-variant-caps:all-small-caps;
    font-weight: 900;
    font-style:italic;

    padding: 0px;
    margin: 0px;
    margin-top: -.5em;
    margin-bottom: -.1em;
  }

  p {
    padding: 0px;
    margin: 0px;
    font-size: 1.2em;
    font-style:italic;
    font-family: 'Old Standard TT', serif;
  }
`

const Headline = styled.h1`
  font-family: 'Montserrat', san-serif;
  text-align: center;
  padding: 0px;
  margin: 0px;
  padding-top: 1em;
  font-size: 4em;
  font-variant-caps:all-small-caps;
  border-bottom: 2px solid black;

  p{
    padding: 0px;
    margin: 0px;

    &.part_2{
      margin-top: -0.5em;
      font-size: 50%;
    }
    &.part_3{
      margin-top: -0.3em;
      font-size: 300%;
    }
  }
`

const MainContent = styled.div`
  position: relative;
  width: 90%;
  height: 1000px;
  padding-top: 1.5em;
  margin: 0 auto;
`

const MainContentText = styled.div`
  position: relative;
  z-index: 100;
  text-align: center;


  h1, h2, span {
  }

  h1, h2{
    margin: 0;
    padding: 0;

    background-clip: text;
  }

  h2 {
    margin-top: -0.3em;
    font-size: 50%;
  }

  span {
    display: block;
    font-size: 1em;
    margin-top: -0.6em;
    margin-bottom: -0.5em;
    padding: 0;
  }

  h3 {
    margin-top: 5em;
    font-size: 250%;
    font-family: 'Baskerville', serif;
  }
`
const HeadLight = styled.div`
  margin-top: 2em;
  font-size: 550%;
  font-family: 'Montserrat', san-serif;
  font-weight: lighter;
  background: linear-gradient(to right, #664d00 , #ffd24d, orange, yellow);
  -webkit-background-clip: text;
  background-clip: text;
  -webkit-text-fill-color: transparent;
`

const MainContentBackground = styled.div`
  position: absolute;
  top: 2em;
  left: 0;
  width: 100%;
  height: 95%;
  display: flex;
  justify-content: space-between;
`

const GrayBox = styled.div`
  background-color: #EEE;
  height: 100%;
  width: 47%;
`


export {
  MainContainer,
  MainContentText,
  MainContentBackground,
  HeadLight,
  TopBar,
  Sponsors,
  SponsorContainer,
  Shout,
  Headline,
  MainContent,
  GrayBox,
};
