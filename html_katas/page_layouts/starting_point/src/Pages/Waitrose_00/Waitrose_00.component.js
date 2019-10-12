import React from 'react';
import {TopBar, MainContainer, Sponsors, SponsorContainer, Shout, Headline, GrayBox, MainContent, MainContentBackground, MainContentText, HeadLight} from './Waitrose_00.style';
import LayoutHolder from '../../Components/LayoutHolder';
import Sponsor1 from './imgs/by_appointment.png'
import Sponsor2 from './imgs/royal-warrant.png'

const Waitrose_00 = (props) => {
  return(
    <LayoutHolder
    name='Waitrose Partners'
    info='pag.0 - 9 October 2019'
    >
      <MainContainer>
        <TopBar>
          <Sponsors>
            <SponsorContainer>
              <img src={Sponsor1} alt="By Royal Appointment"/>
            </SponsorContainer>
            <SponsorContainer>
              <img src={Sponsor2} alt="By Royal Appointment"/>
            </SponsorContainer>
          </Sponsors>
          <Shout>
            <h1>Free</h1>
            <p>
              Your regular edition <br />
              of Weekend is inside</p>
          </Shout>
        </TopBar>
        <Headline>
          <p className="part_1">Waitrose</p>
          <p className="part_2">& Partners</p>
          <p className="part_3">Weekend</p>
        </Headline>
      </MainContainer>
      <MainContent>
        <MainContentText>
          <HeadLight>
            <h1>
              N°l
            </h1>
            <span>––––</span>
            <h1>
              WAITROSE
            </h1>
            <h2>
              & PARTNERS
            </h2>
          </HeadLight>
          <h3>
            The Very Best of
            <br/>
            Waitrose & Partners
          </h3>
        </MainContentText>
        <MainContentBackground>
          <GrayBox />
          <GrayBox />
        </MainContentBackground>
      </MainContent>
    </LayoutHolder>
  )
}

export default Waitrose_00;
