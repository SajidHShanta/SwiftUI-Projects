//
//  CoinDataService.swift
//  AgainCrypto
//
//  Created by Sajid Shanta on 29/6/25.
//

import Foundation
import Combine

class CoinDataService {
    @Published var allCoins: [Coin] = []
    var coinSubscriotion: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    private func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=bdt&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h?x_cg_demo_api_key=CG-PwG9WnbkBP9JpWKBpHpLLCNE") else { return }
        
//        var request = URLRequest(url: url )
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = [
//          "accept": "application/json",
//          "x-cg-demo-api-key": "CG-PwG9WnbkBP9JpWKBpHpLLCNE"
//        ]
        
        // convert snake_case to camelCase by setting the JSONDecoder's property -- `decoder.keyDecodingStrategy = .convertFromSnakeCase`

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
//        coinSubscriotion = URLSession.shared.dataTaskPublisher(for: url)
//            .subscribe(on: DispatchQueue.global(qos: .default))
//            .tryMap { (output) -> Data in
//                guard let response = output.response as? HTTPURLResponse,
//                      response.statusCode >= 200 && response.statusCode < 300 else {
//                    throw URLError(.badServerResponse)
//                }
//                return output.data
//            }
//            .receive(on: DispatchQueue.main)
//            .decode(type: [Coin].self, decoder: decoder)
//            .sink { (completion) in
//                switch completion {
//                case .finished:
//                    break
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            } receiveValue: { [weak self] returnedCoins in
//                self?.allCoins = returnedCoins
//                self?.coinSubscriotion?.cancel()
//            }
        
        coinSubscriotion = NetworkingManager.download(url: url)
            .decode(type: [Coin].self, decoder: decoder)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
                self?.coinSubscriotion?.cancel()
            })
        
        
    }
}
