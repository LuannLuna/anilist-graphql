//
//  ImageLoader.swift
//  DSKit
//
//  Created by Luann Marques Luna on 07/05/24.
//

import UIKit

class ImageLoader: ObservableObject {
//    @Published var downloadedData: UIImage?
    @Published var isLoading: Bool = false
    private var imageCache = ImageCache.getImageCache()
    
    func loadImage(url: URL?, completion: @escaping (UIImage) -> Void) {
        guard !loadedImageFromCache(url, completion: completion) else { return }
        DispatchQueue.main.async { [weak self] in
            self?.isLoading = true
        }
        downloadImage(url: url, completion: completion)
    }
}

private
extension ImageLoader {
    func loadedImageFromCache(_ url: URL?, completion: @escaping (UIImage) -> Void) -> Bool {
        guard
            let absoluteString = url?.absoluteString,
            let cacheImage = imageCache.get(forKey: absoluteString)
        else {
            return false
        }
        completion(cacheImage)
        return true
    }
    
    func downloadImage(url: URL?, completion: @escaping (UIImage) -> Void) {
        defer {
            DispatchQueue.main.async { [weak self] in
                self?.isLoading = false
            }
        }
        guard let url else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data, error == nil, let image = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async { [weak self] in
                completion(image)
                self?.imageCache.set(forKey: url.absoluteString, image: image)
            }
        }.resume()
    }
}
