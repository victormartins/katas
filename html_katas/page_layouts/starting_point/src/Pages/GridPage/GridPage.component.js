import React from 'react';
import StyledGridPage from './GridPage.style';

const GridPage = (props) => {
  return(
    <StyledGridPage>
      <header className='main-header'>
        <div className="logo">
          <h1>LOGO</h1>
        </div>
        <nav className='header-menu'>
          <div className="nav-item">About</div>
          <div className="nav-item">Articles</div>
          <div className="nav-item">Help</div>
        </nav>
      </header>
      <div className='main-content'>
        <section className="secondary-nav">
          <header>
            <h1>Side Bar</h1>
          </header>

        </section>
        <section className="content">
          <header>
            <h1>Articles</h1>
          </header>
          <article>
            <header>
              <h1>Article 1</h1>
            </header>
            <div className="two-columns">
              <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Molestias, veritatis! Adipisci natus possimus quasi perspiciatis. Iure a aliquid, nostrum eum vero minus repudiandae laboriosam? Repudiandae commodi tempore recusandae esse minus.</p>
              <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Molestias, veritatis! Adipisci natus possimus quasi perspiciatis.</p>
            </div>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Molestias, veritatis! Adipisci natus possimus quasi perspiciatis. Iure a aliquid, nostrum eum vero minus repudiandae laboriosam? Repudiandae commodi tempore recusandae esse minus.</p>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Molestias, veritatis! Adipisci natus possimus quasi perspiciatis.</p>
            <footer>
              <ul className='footer-icons'>
                <li className="footer-icon">Foo</li>
                <li className="footer-icon">Bar</li>
                <li className="footer-icon">Baz</li>
                <li className="footer-icon">Xpt</li>
                <li className="footer-icon">Opt</li>
                <li className="footer-icon">Icn</li>
              </ul>
            </footer>
          </article>

          <article>
            <header>
              <h1>Article 1</h1>
            </header>
            <div className="article-with-icons">
              <aside className='article-icons-container'>
                <ul className='article-icons'>
                  <li className="article-icon">Foo</li>
                  <li className="article-icon">Bar</li>
                  <li className="article-icon">Baz</li>
                  <li className="article-icon">Xpt</li>
                  <li className="article-icon">Opt</li>
                  <li className="article-icon">Icn</li>
                </ul>
              </aside>
              <div className="article-content">
                <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Molestias, veritatis! Adipisci natus possimus quasi perspiciatis. Iure a aliquid, nostrum eum vero minus repudiandae laboriosam? Repudiandae commodi tempore recusandae esse minus.</p>
                <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Molestias, veritatis! Adipisci natus possimus quasi perspiciatis.</p>
              </div>
            </div>
            <footer>
              <footer>
                <ul className='footer-icons'>
                  <li className="footer-icon">Foo</li>
                  <li className="footer-icon">Bar</li>
                  <li className="footer-icon">Baz</li>
                </ul>
              </footer>
            </footer>
          </article>
        </section>
      </div>
    </StyledGridPage>
  )
}

export default GridPage;
