import React from 'react'

class AddressList extends React.Component{
  contacts = () => {
    const {addresses} = this.props;

    return addresses.map((data, index) => {
      return <li key={index}>
        <span className='field'>
          {data.name}
        </span>
        <span className='value'>
          {data.mobile}
        </span>
      </li>
    })
  }

  render(){
    return(
      <div className='address-list'>
        <ul>
          {this.contacts()}
        </ul>
      </div>
    )
  }
}

export default AddressList;