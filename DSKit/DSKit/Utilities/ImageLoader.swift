//
//  ImageLoader.swift
//  DSKit
//
//  Created by Luann Marques Luna on 07/05/24.
//

import UIKit

class ImageLoader: ObservableObject {
    @Published var downloadedData: UIImage?
    @Published var isLoading: Bool = false
    var imageCache = ImageCache.getImageCache()
    
    func loadImage(url: URL?) async {
        guard await !loadImageFromCache(url) else { return }
        await MainActor.run {
            isLoading = true
        }
        await downloadImage(url: url)
    }
    
}

private
extension ImageLoader {
    func loadImageFromCache(_ url: URL?) async -> Bool {
        guard
            let absoluteString = url?.absoluteString,
            let cacheImage = imageCache.get(forKey: absoluteString)
        else {
            return false
        }
        await MainActor.run {
            downloadedData = cacheImage
        }
        return true
    }
    
    func downloadImage(url: URL?) async {
        guard let url else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let image = UIImage(data: data) else { return }
            await MainActor.run {
                downloadedData = image
                imageCache.set(forKey: url.absoluteString, image: image)
                isLoading = false
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
