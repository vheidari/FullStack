var { graphql, buildSchema } = require("graphql")
 
// Construct a schema, using GraphQL schema language
var schema = buildSchema(`
	type Query {
		userinfo: User
	}

	type User {
		username: String
		userFullName: String
		userFamilyName: String
	}
`)
 
// The rootValue provides a resolver function for each API endpoint
var rootValue = {
   userinfo() {
    return {
	 username: "vheidari",
	 userFullName: "Vahid",
 	 userFamilyName : "Heidari"
    }
  }
}
 
// Run the GraphQL query '{ hello }' and print out the response
graphql({
  schema,
  source: "{ userinfo{username, userFullName, userFamilyName} }",
  rootValue
}).then(response => {
  console.log(response)
})
