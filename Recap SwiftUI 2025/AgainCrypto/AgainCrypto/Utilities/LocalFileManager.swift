//
//  LocalFileManager.swift
//  AgainCrypto
//
//  Created by Sajid Shanta on 30/6/25.
//

import SwiftUI

class LocalFileManager {
    static let instance = LocalFileManager()
    private init() { }
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        
        // create folder
        createFolderIfNeeded(folderName: folderName)

        // get path for image
        guard
            let data = image.pngData(),
            let url = getURLForImage(imageName: imageName, folderName: folderName) else { return }
        
        // save image to path
        do {
            try data.write(to: url)
        } catch let error {
            print("Error in saving Image. Image Name: \(imageName). \(error.localizedDescription)")
        }
    }
    
    func getImage(imageName: String, folderName: String) -> UIImage? {
        guard
            let url = getURLForImage(imageName: imageName, folderName: folderName),
            FileManager.default.fileExists(atPath: url.path(percentEncoded: false)) else  { return nil }
        return UIImage(contentsOfFile: url.path(percentEncoded: false))
    }
    
    private func createFolderIfNeeded(folderName: String) {
        guard let url = getURLForFolder(folderName: folderName) else { return }
        if !FileManager.default.fileExists(atPath: url.path(percentEncoded: false)) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            } catch let error {
                print("Error creating directory. Folder Name: \(folderName). \(error)")
            }
        }
    }
    
    private func getURLForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        return url.appendingPathComponent(folderName, conformingTo: .folder)
    }
    
    private func getURLForImage(imageName: String, folderName: String) -> URL? {
        guard let folderURL = getURLForFolder(folderName: folderName) else { return nil }
        return folderURL.appendingPathComponent(imageName, conformingTo: .png)
    }
}
