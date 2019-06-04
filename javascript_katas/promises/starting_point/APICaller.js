const fetch = require('node-fetch');

class APICaller {
  constructor(endpoint) {
    this.endpoint = endpoint;
  }

  // await for for the promise to complete and
  // convert the result into json
  async callSync() {
    let result = await this.callEndpoint();
    result = await result.json()
    // console.log('Result: ', result);
    return(result)
  }

  call() {
    return this.callEndpoint()
  }

  // Returns a Promise
  callEndpoint() {
    // console.log('Calling: ', this.endpoint);
    return fetch(this.endpoint)
  }
}

module.exports = APICaller;
