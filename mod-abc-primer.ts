#!env -S deno --allow-net

import { Application } from "https://deno.land/x/abc/mod.ts";

const app = new Application();

console.log("http://localhost:8080/hello");

app
  .get("/hello", c => {
    return "Hello, Abc!";
  })
  .start({ port: 8080 });