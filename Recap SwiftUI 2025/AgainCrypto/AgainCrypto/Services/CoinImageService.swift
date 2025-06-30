//
//  CoinImageService.swift
//  AgainCrypto
//
//  Created by Sajid Shanta on 30/6/25.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: Coin
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    
    init(coin: Coin) {
        self.coin = coin
        getCoinImage()
    }
    
    func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: coin.id, folderName: folderName) {
            self.image = savedImage
            print("Retrived image from File Manager!")
        } else {
            downloadCoinImage()
            print("download coin image")
        }
    }
    
    func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ imageData in
                return UIImage(data: imageData)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedImage in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.coin.id, folderName: self.folderName)
            })
    }
}
