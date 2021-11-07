const express = require('express');
const app = express();
const port = 8080;
const got = require('got');

app.get('/', (req, thisRes) => {
  got.get('http://192.168.0.245/?rest_route=/random/v1/any', {responseType: 'json'})
  .then(res => {
    const headerDate = res.headers && res.headers.date ? res.headers.date : 'no response date';
    console.log('Status Code:', res.statusCode);
    const jsonResponse = res.body[0];
    thisRes.send(jsonResponse.post_content);
  })
  .catch(err => {
    console.log('Error: ', err.message);
  });

});

app.listen(port, () => {

});
