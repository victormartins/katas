const fetch = require('node-fetch');

class APICaller {
  constructor(endpoint) {
    console.log('APICalled initializer with: ', endpoint);
    this.endpoint = endpoint;
  }

  callSync() {
    return(this.callEndpointSync().catch(err => {
      return({error: true, msg: err})
    }))
  }


  call() {
    return this.callEndpoint()
  }

  // await for for the promise to complete and
  // convert the result into json
  async callEndpointSync() {
    console.log('Calling Sync...');
    let result = await this.callEndpoint();
    console.log('Result: ', result);
    const jsonResult = await result.json()
    console.log('jsonResult: ', jsonResult);
    return(jsonResult)
  }

  // Returns a Promise
  callEndpoint() {
    console.log('Calling: ', this.endpoint);
    // return fetch(this.endpoint)

    return new Promise((resolve, reject) => {
      const jsonObject = () => {
        return({userId: 1})
      }
      setInterval(( ) => {
        if(!this.endpoint.startsWith('http')) {
          reject('Reject Error Message!')
        }

        if(this.endpoint.startsWith('raise_exception')) {
          console.log('Throwing exception.');
          throw('Exception Inside Promise!')
        }

        resolve({json: jsonObject})
      }, 1000)
    })
  }
}

module.exports = APICaller;
