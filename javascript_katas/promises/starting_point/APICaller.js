const fetch = require('node-fetch');

class APICaller {
  constructor(endpoint) {
    this.endpoint = endpoint;
  }

  // await for for the promise to complete and
  // convert the result into json
  async callSync() {
    try {
      console.log('Calling Sync...');
      let result = await this.callEndpoint();
      console.log('Result: ', result);
      const jsonResult = await result.json()
      console.log('jsonResult: ', jsonResult);
      return(jsonResult)
    } catch(err) {
      console.log('callAsync failed!', err);
      return({error: true, msg: err})
    }
  }

  call() {
    return this.callEndpoint()
  }

  // Returns a Promise
  callEndpoint() {
    // console.log('Calling: ', this.endpoint);
    // return fetch(this.endpoint)

    return new Promise((resolve, reject) => {
      const jsonObject = () => {
        return({userId: 1})
      }
      setInterval(( ) => {
        if(!this.endpoint.startsWith('http')) {
          reject('Reject Error Message!')
          // console.log('Invalid Endoint. Throwing exception.');
          // throw(`Invalid Endpoint! ${this.endpoint}`)
        }
        resolve({json: jsonObject})
      }, 1000)
    })
  }
}

module.exports = APICaller;
