//
//  Coin.swift
//  AgainCrypto
//
//  Created by Sajid Shanta on 23/6/25.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

// convert snake_case to camelCase by setting the JSONDecoder's property -- `decoder.keyDecodingStrategy = .convertFromSnakeCase`

struct Coin: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume: Double?
    let high24H, low24H, priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H, marketCapChangePercentage24H, circulatingSupply, totalSupply: Double?
    let maxSupply: Double?
    let ath, athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    func updateHoldings(amount: Double) -> Coin {
        return Coin(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    }
    
    var currentHoldingValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}



/*
 CoinGecko API info
 
 URL: let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets")!

 curl --request GET \
      --url 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=bdt&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h' \
      --header 'accept: application/json' \
      --header 'x-cg-demo-api-key: CG-PwG9WnbkBP9JpWKBpHpLLCNE'
 
 
 Swift demo:--
 
 import Foundation

 let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets")!
 var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
 let queryItems: [URLQueryItem] = [
   URLQueryItem(name: "vs_currency", value: "bdt"),
   URLQueryItem(name: "order", value: "market_cap_desc"),
   URLQueryItem(name: "per_page", value: "250"),
   URLQueryItem(name: "page", value: "1"),
   URLQueryItem(name: "sparkline", value: "true"),
   URLQueryItem(name: "price_change_percentage", value: "24h"),
 ]
 components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

 var request = URLRequest(url: components.url!)
 request.httpMethod = "GET"
 request.timeoutInterval = 10
 request.allHTTPHeaderFields = [
   "accept": "application/json",
   "x-cg-demo-api-key": "CG-PwG9WnbkBP9JpWKBpHpLLCNE"
 ]

 let (data, _) = try await URLSession.shared.data(for: request)
 print(String(decoding: data, as: UTF8.self))
 
 --------
 JSON response:--
 
 [
   {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
     "current_price": 12481255,
     "market_cap": 248107114725359,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 248107114725359,
     "total_volume": 5924464995084,
     "high_24h": 12592326,
     "low_24h": 12049276,
     "price_change_24h": -92222.98768059723,
     "price_change_percentage_24h": -0.73347,
     "market_cap_change_24h": -1666078054474.625,
     "market_cap_change_percentage_24h": -0.66704,
     "circulating_supply": 19882425,
     "total_supply": 19882425,
     "max_supply": 21000000,
     "ath": 13603645,
     "ath_change_percentage": -8.45883,
     "ath_date": "2025-05-22T18:41:28.492Z",
     "atl": 9390.25,
     "atl_change_percentage": 132515.51721,
     "atl_date": "2013-09-08T00:00:00.000Z",
     "roi": null,
     "last_updated": "2025-06-23T05:58:49.588Z",
     "sparkline_in_7d": {
       "price": [
         105564.16534458233,
         105424.1991516492,
         105795.61846455558,
         105822.87037633503,
         105909.21219899655,
         106256.92883527248,
         106568.3578310115,
         106640.67506963534,
         107058.98628304974,
         107167.66939284577,
         106937.21209764318,
         106809.25210543645,
         106864.15294996247,
         106755.90135291078,
         107031.52687489196,
         107665.86321035959,
         107526.88230757095,
         107815.76993722937,
         107766.25399441826,
         108108.31509729645,
         108570.27085659963,
         108771.38706442164,
         108560.44292554783,
         107711.80016691367,
         106842.12269316117,
         107146.50622253398,
         107240.07959770689,
         107155.0114762305,
         107596.24063656588,
         107382.39871892119,
         107133.14042003587,
         106850.03969811338,
         106772.70279319353,
         106574.44033966033,
         106168.65582350684,
         105917.65595792574,
         105599.04234851847,
         105570.36903619586,
         105381.36738688366,
         104968.41290583643,
         104297.61351889996,
         103645.26543018637,
         103877.2191418644,
         104344.13863233314,
         104912.04098112213,
         104455.92935811245,
         104578.81861066536,
         104416.64158014965,
         104582.95726510268,
         104798.2038794596,
         104773.14827853611,
         104924.86078353191,
         105183.3456286072,
         105435.24666250582,
         105449.91858002415,
         105023.07221331273,
         104951.91473610546,
         104948.7529500298,
         104718.06109277342,
         104313.97756981917,
         104771.92548733331,
         104505.61321544959,
         104306.1049763894,
         104643.51384994881,
         104829.83465537477,
         104454.07992215517,
         104438.39655729047,
         104166.97215678326,
         103970.13038955415,
         104848.57074753435,
         105057.00100604363,
         104927.54470783188,
         104820.29452686982,
         105025.84848422589,
         104613.72402360111,
         104892.03095878595,
         105074.9655347677,
         105043.00622781515,
         104943.48955843282,
         104727.5535209207,
         104670.2894746033,
         104796.70436551528,
         104990.14470661181,
         104929.03005251053,
         104802.1549121279,
         104762.37665480703,
         104320.4352448131,
         104178.33476349211,
         104143.09391992082,
         104021.48549999535,
         104636.92145315508,
         104347.75103058896,
         104265.36628356976,
         104303.83159426716,
         104399.38649563897,
         104639.20468977488,
         104682.87661416734,
         104715.37285383092,
         104770.9909998162,
         104613.11525127603,
         104615.92536318803,
         104275.1716552832,
         104599.98114349897,
         104709.62757389038,
         105731.17713129212,
         106036.3757848508,
         105977.36720176769,
         105968.27628153792,
         106002.73146604195,
         105996.21559572467,
         105634.2365564137,
         104426.37561370363,
         104260.79423873087,
         103732.57742394695,
         103055.61941252834,
         103204.79616073096,
         103347.19840325843,
         103703.40368044314,
         103508.97527092896,
         103098.70998146721,
         103291.80698792482,
         103259.90734612882,
         103485.72748217356,
         103495.76214267968,
         103559.9717668143,
         103383.94229771197,
         103429.29233562193,
         103581.070084062,
         103471.44162362214,
         103738.04211818938,
         103880.80817585492,
         103839.2211389956,
         103900.88395114425,
         103811.51225268451,
         103612.15829068191,
         103582.03052164827,
         103525.2069026004,
         103505.42403280006,
         103232.39037742512,
         102871.28687622136,
         102380.0269301193,
         102857.80399902674,
         101588.31432572688,
         101824.54107207153,
         102092.12946975077,
         102949.09073657315,
         102511.70596202089,
         102372.11654090365,
         102328.93433953862,
         102598.19431204248,
         102751.21939870145,
         102750.98957518884,
         102431.3057604344,
         102653.05717196758,
         102236.88032084289,
         102498.50340508242,
         102732.23244414308,
         102737.39662399364,
         100818.35347599795,
         99561.78346781015,
         99161.14396983622,
         99518.50794367972,
         99589.66597957935,
         99547.11834309077,
         98974.66955517934,
         99514.84004623022,
         99281.86321149614,
         100744.79637480115
       ]
     },
     "price_change_percentage_24h_in_currency": -0.7334723948843475
   },
  
 
 */
