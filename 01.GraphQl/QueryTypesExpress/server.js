
var express = require("express")
var {createHandler} = require("graphql-http/lib/use/express")
var {buildSchema} = require("graphql")

// ClientSide - query through curl :
// curl -X POST -H "Content-Type: application/json" -d '{"query": "{random,rollThreeDice, quoteOfTheDay}" }' http://localhost:4000/graphql

// create schema types
var schema = buildSchema(`
	type Query {
		quoteOfTheDay: String,
		random: Float,
		rollThreeDice: [Int]
	}
`)

// create query functions
var root = {
	quoteOfTheDay() {
		return Math.random() < 0.5 ? "You should not Stop anyway" : "You should making your gole every data"
	},
	random() {
		return Math.random()
	},
	rollThreeDice() {
		return [1,2,3].map(_ => 1 + Math.floor(Math.random() * 6))
	}
}

// ready express app
var app = express()

// define API endpoint
app.all(
	"/graphql",
	createHandler({
		schema: schema,
		rootValue: root,
	})
)

// running express app
app.listen(4000)
console.log("Running a GraphQL API server at localhost:4000/graphql")

