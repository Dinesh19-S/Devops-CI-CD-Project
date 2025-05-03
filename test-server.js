const request = require('supertest');
const app = require('../server');

describe('GET /', () => {
  it('responds with Hello message', async () => {
    const response = await request(app).get('/');
    expect(response.statusCode).toBe(200);
    expect(response.text).toContain('Hello from Docker CI/CD Pipeline!');
  });
});
