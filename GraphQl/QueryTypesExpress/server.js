
var express = require("express")
var {createHandler} = require("graphql-http/lib/use/express")
var {buildSchema} = require("graphql")

var schema = buildSchema(`
	type Query {
		quoteOfTheDay: String,
		random: Float,
		rollThreeDice: [Int]
	}
`)


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


var app = express()

app.all(
	"/graphql",
	createHandler({
		schema: schema,
		rootValue: root,
	})
)



app.listen(4000)

console.log("Running a GraphQL API server at localhost:4000/graphql")

