//
//  CacheImage.swift
//  DSKit
//
//  Created by Luann Marques Luna on 07/05/24.
//

import SwiftUI

public
struct CacheImage: View {
    let url: URL?
    let placeholder: String
    @State var image: UIImage?
    @ObservedObject var imageLoader = ImageLoader()
    
    public init(url: URL?, placeholder: String = "no-image-placeholder") {
        self.url = url
        self.placeholder = placeholder
    }
    
    public var body: some View {
        ZStack {
            if let image {
                Image(uiImage: image)
                    .resizable()
                    .clipped()
            } else {
                Image(placeholder)
                    .resizable()
                    .clipped()
            }
            if imageLoader.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
            }
        }
        .task(priority: .high) {
            imageLoader.loadImage(url: url) { image in
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}

#Preview {
    CacheImage(
        url: URL(string: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx1-CXtrrkMpJ8Zq.png"),
        placeholder: "no-image-placeholder"
    )
}
