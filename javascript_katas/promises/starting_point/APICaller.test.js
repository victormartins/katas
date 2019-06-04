const APICaller = require('./APICaller')

describe('APICaller', () => {


  describe('Calling in a Synchronous fashion', () => {
    describe('Happy Path', () => {
      it('returns a json payload', async () => {
        const endpoint = 'https://jsonplaceholder.typicode.com/todos/1';
        const apiCaller = new APICaller(endpoint);

        const response = await apiCaller.callSync();
        expect(response.userId).toEqual(1)
      });
    });

    describe('When there is errors', () => {
      xit('Reject errors are sent as an object', async () => {
        const invalidEndpoint = 'invalid';
        const brokeApiCaller = new APICaller(invalidEndpoint);

        const response = await brokeApiCaller.callSync();
        expect(response.error).toEqual(true)
        expect(response.msg).toEqual('Reject Error Message!')
      });

      fit('Thrown errors are captured', async () => {
        const invalidEndpoint = 'raise_exception';
        const brokeApiCaller = new APICaller(invalidEndpoint);

        const response = await brokeApiCaller.callSync();
        expect(response.error).toEqual(true)
        expect(response.msg).toEqual('Exception Inside Promise!')
      });
    });
  });

  describe('Calling in a Asynchronous fashion', () => {
    describe('Happy Path', () => {
      it('returns a Promise object', () => {
        const endpoint = 'https://jsonplaceholder.typicode.com/todos/1';
        const apiCaller = new APICaller(endpoint);

        const call = apiCaller.call();
        expect(call.toString()).toEqual('[object Promise]')
      });

      it('returns a Promise', () => {
        const endpoint = 'https://jsonplaceholder.typicode.com/todos/1';
        const apiCaller = new APICaller(endpoint);

        expect.assertions(1); // expect the async assertion

        const call = apiCaller.call();

        return call.then(response => response.json())
        .then((response) => {
          expect(response.userId).toEqual(1)
        })
      });
    });
  });
});
