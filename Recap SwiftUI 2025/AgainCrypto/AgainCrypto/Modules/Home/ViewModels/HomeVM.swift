//
//  HomeVM.swift
//  AgainCrypto
//
//  Created by Sajid Shanta on 29/6/25.
//
import Foundation
import Combine

class HomeVM: ObservableObject {
    
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    
    @Published var searchText: String = ""
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.allCoins.append(PreviewValues.demoCoin)
//            self.portfolioCoins.append(PreviewValues.demoCoin)
//            self.portfolioCoins.append(PreviewValues.demoCoin)
//        }
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] coins in
                self?.allCoins = coins
            }
            .store(in: &cancellables)
    }
}
