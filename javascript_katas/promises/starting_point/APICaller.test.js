const APICaller = require('./APICaller')

describe('APICaller', () => {

  describe('When there is no errors', () => {
    const endpoint = 'https://jsonplaceholder.typicode.com/todos/1';
    const apiCaller = new APICaller(endpoint);

    describe('Calling in a Synchronous fashion', () => {
      it('returns a json payload', async () => {
        const response = await apiCaller.callSync();
       expect(response.userId).toEqual(1)
      });
    });

    describe('Calling in a Asynchronous fashion', () => {
      it('returns a Promise object', () => {
        const call = apiCaller.call();
        expect(call.toString()).toEqual('[object Promise]')
      });

      it('returns a Promise', () => {
        expect.assertions(1); // expect the async assertion

        const call = apiCaller.call();

        return call.then(response => response.json())
        .then((response) => {
          expect(response.userId).toEqual(1)
        })
      });
    })
  });
});
