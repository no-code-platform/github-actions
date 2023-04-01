const fetch = require('node-fetch');
const { expect } = require("@jest/globals");


const BASE = "http://localhost:3000";

test("adds 1 + 2 to equal 3", async () => {
    const response = await fetch(`${BASE}/test`);
    expect(response.status).toBe(200);
});
