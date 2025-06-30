//
//  CoinImageView.swift
//  AgainCrypto
//
//  Created by Sajid Shanta on 30/6/25.
//

import SwiftUI

struct CoinImageView: View {
    
    @StateObject var vm: CoinImageVM
    
    init(coin: Coin) {
        _vm = StateObject(wrappedValue: CoinImageVM(coin: coin))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundStyle(Color.theme.secondaryText)
            }
        }
    }
}

#Preview {
    CoinImageView(coin: PreviewValues.demoCoin)
}
