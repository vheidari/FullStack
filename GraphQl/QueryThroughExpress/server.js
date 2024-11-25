var express = require("express")
var { createHandler } = require("graphql-http/lib/use/express")
var { buildSchema } = require("graphql")
var { ruruHTML } = require("ruru/server")

// create schema
var schema = buildSchema(`
	type Query {
		hello: String
	}
`)

// create queries function
var root  = {
	hello() {
		return "Hello Wrold!"
	},
}

//  
var app = express()

// define API url
app.all(
	"/graphql",
	 createHandler({
		schema: schema,
		rootValue: root,
	 })
)

// Serve the GraphiQL IDE.
app.get("/", (_req, res) => {
  res.type("html")
  res.end(ruruHTML({ endpoint: "/graphql" }))
})

// running express app
app.listen(4000)
console.log("Running GraphQlL API server at http://localhost:4000/graphql");






