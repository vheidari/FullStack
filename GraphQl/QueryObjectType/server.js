var express = require("express")
var {createHandler} = require("graphql-http/lib/use/express")
var {buildSchema} = require("graphql")


// query on client side through curl :
// curl -X POST -H "Content-Type: application/json" -d '{"query": "{coinList{id, name, logo, lastPrice, lastMarketcap, oneLineNews{title,link}}}" }' http://localhost:4000/graphql

// Fake Coins Dataset
const Coins = [
	{
		id: 121646483131,
		name: "Bitcoin",
		logo: "https://s2.coinmarketcap.com/static/img/coins/64x64/1.png",
		lastPrice: 99500.0,
		lastMarketcap: "1.2T",
		oneLineNews: [
			{
				title: "Bitcoin Futures",
				shortDescription: "Bitcoin Futures Open Interest Jumps 56% to $60.9B Following Trump’s Election, While Ethereum ...",
				imageUrl: "https://academy-public.coinmarketcap.com/optimized-uploads/d6a7dbb9a5d7429baa424652b120d6dd.jpg",
				link: "https://coinmarketcap.com/headlines/news/bitcoin-futures-open-interest-jumps-56percent-to-dollar609b-following-trumps-election-while-ethereum-sees-strong-performance-with-5percent-daily-surge/"

			},
			{
				title: "What Are The Most Popular Crypto-to-Fiat Pairs in South Africa?",
				shortDescription: "Discover why crypto-to-fiat pairs are essential for users to move between the cryptocurrency world and the traditional South African financial system.",
				imageUrl: "https://academy-public.coinmarketcap.com/optimized-uploads/6651e8bfaea74b1484d22b7dddd042ce.jpg",
				link: "https://coinmarketcap.com/headlines/news/what-are-the-most-popular-crypto-to-fiat-pairs-in-south-africa/"

			},
			{
				title: "President Vlad Putin declares that Bitcoin is now ‘legal property’ in Russia",
				shortDescription: "Russia just put Bitcoin at the center of its economic chessboard. Earlier today, President Vladimir Putin signed a law that not only recognizes Bitcoin and other cryptocurrencies as ...",
				imageUrl: "https://academy-public.coinmarketcap.com/srd-optimized-uploads/9cece959bbd94aa2b0004970bb360468.webp",
				link: "https://coinmarketcap.com/community/articles/6749f431d9ff5864bded772c/"

			}
		]
	},
	{
		id: 646313156,
		name: "Etherum",
		logo: "https://s2.coinmarketcap.com/static/img/coins/64x64/1027.png",
		lastPrice: 3589.53,
		lastMarketcap: "431.86B",
		oneLineNews: [
			{
				title: "Ethereum Eyes $4K as Leveraged ETF Demand Soars 160% and Market Dynamics Shift",
				shortDescription: "Investor interest in leveraged Ethereum products has surged, with VolatilityShares’ 2x Ether ETF seeing a 160% increase in exposure since early November.",
				imageUrl: "https://academy-public.coinmarketcap.com/optimized-uploads/898a9ca99a1e474b8436391bc12a6384.png",
				link: "https://coinmarketcap.com/headlines/news/bitcoin-futures-open-interest-jumps-56percent-to-dollar609b-following-trumps-election-while-ethereum-sees-strong-performance-with-5percent-daily-surge/"

			},
			{
				title: "Week in L1: Near Protocol Steals the Spotlight as Sui Stagnates",
				shortDescription: "Despite its relatively weak performance throughout much of 2024, Ethereum returned to form over the last week and gained 7.4% in the past seven days.",
				imageUrl: "https://academy-public.coinmarketcap.com/optimized-uploads/026dc18475ac4f85a37561681ffd8a87.png", 
				link: "https://coinmarketcap.com/academy/article/week-in-l1-near-protocol-steals-the-spotlight-as-sui-stagnates"

			},
		]
	}
];

// Create QraphQL schema
const schema = buildSchema(`
	type Query {
	 coinList: [Coin!]!
	}
	
	type Coin {
	 id : ID!,
	 name: String!,
	 logo: String,
	 lastPrice: Float,
	 lastMarketcap : String,
         oneLineNews: [OneLineNews!]!
	}

	type OneLineNews {
	title: String!,
	shortDescription: String,
	image: String,
	link: String
	}
`);


// Implement Resolver function
const root = {
	coinList() {
		return Coins
	}
}

// Ready express app for query
const app = express()



// Handeling all `/graphql` request  
app.all(
	"/graphql",
	createHandler({
		schema: schema,
		rootValue: root
	})	
)

// Start listening on port 4000
app.listen(4000)

// Print information about server and port
console.log("Running a GraphQL API server at localhost:4000/graphql")




