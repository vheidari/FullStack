var express = require("express")
var {createHandler} = require("graphql-http/lib/use/express")
var {buildSchema} = require("graphql")


// query on client side through curl :
// curl -X POST -H "Content-Type: application/json" -d '{"query": "{returnXRandomNum(xNumber:10, sideNum:5)}" }' http://localhost:4000/graphql

const app = express()

app.listen(4000)

console.log("Running a GraphQL API server at localhost:4000/graphql")

