//
//  HomeVM.swift
//  AgainCrypto
//
//  Created by Sajid Shanta on 29/6/25.
//
import Foundation

class HomeVM: ObservableObject {
    
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.allCoins.append(PreviewValues.demoCoin)
            self.portfolioCoins.append(PreviewValues.demoCoin)
            self.portfolioCoins.append(PreviewValues.demoCoin)
        }
    }
}
