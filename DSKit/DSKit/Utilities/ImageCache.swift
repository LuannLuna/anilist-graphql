//
//  ImageCache.swift
//  DSKit
//
//  Created by Luann Marques Luna on 07/05/24.
//

import UIKit

class ImageCache {
    var cache = NSCache<NSString, UIImage>()
    
    func get(forKey key: String) -> UIImage? {
        return cache.object(forKey: NSString(string: key))
    }
    
    func set(forKey key: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: key))
    }
}

extension ImageCache {
    private static var imageCache = ImageCache()
    
    static func getImageCache() -> ImageCache {
        imageCache
    }
}
