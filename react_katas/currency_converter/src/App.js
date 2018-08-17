// Tutorial on Render Prop Pattern

import React from "react";

const Euro = ({ amount }) => <p className="EUR">Euro: {amount * 0.86}</p>;
const Pound = ({ amount }) => <p className="GBP">Pound: {amount * 0.76}</p>;
class Amount extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      amount: 0
    };
  }

  onIncrement = () => {
    this.setState({ amount: this.state.amount + 1 });
  };

  onDecrement = () => {
    if (this.state.amount <= 0) {
      return;
    }
    this.setState({ amount: this.state.amount - 1 });
  };

  render() {
    return (
      <React.Fragment>
        <span>US Dollar: {this.state.amount}</span>
        <button type="button" onClick={this.onIncrement}>
          +
        </button>
        <button type="button" onClick={this.onDecrement}>
          -
        </button>
        {/* We call this.props.childre() as a function here and pass state */}
        {/* Also known as children as a function or child as a function */}
        {this.props.children(this.state.amount)}
      </React.Fragment>
    );
  }
}

const App = () => (
  // Instead of passing the Euro and Pound components as components,
  // we pass them as a function which renders them
  <React.Fragment>
    <Amount>
      {amount => (
        <React.Fragment>
          <Euro amount={amount} />
          <Pound amount={amount} />
        </React.Fragment>
      )}
    </Amount>
  </React.Fragment>
);

export default App;
