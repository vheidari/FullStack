var express = require("express")
var {createHandler} = require("graphql-http/lib/use/express")
var {buildSchema} = require("graphql")


// query on client side through curl :
// curl -X POST -H "Content-Type: application/json" -d '{"query": "{returnXRandomNum(xNumber:10, sideNum:5)}" }' http://localhost:4000/graphql


// define arggument
var schema = buildSchema(`
	type Query {
		returnXRandomNum(xNumber: Int!, sideNum: Int) : [Int]
	}
`)


var root = {
	returnXRandomNum(args) {
	let output = []
	const xNumber = args.xNumber
	
	for(let i=0; i < xNumber; i++ ) {
		output.push( i + Math.floor(Math.random() * (args.sideNum || 6)))
	}

	return output

	},
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

