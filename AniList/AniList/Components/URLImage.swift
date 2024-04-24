//
//  URLImage.swift
//  AniList
//
//  Created by Luann Marques Luna on 24/04/24.
//

import SwiftUI

struct URLImage: View {
    let url: URL?
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: width, height: height)
                    
            case .failure:
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width, height: height)
                    .foregroundColor(.gray)
            case .empty:
                ProgressView()
                    .frame(width: width, height: height)
            }
        }
    }
}

#Preview {
    URLImage(url: URL(string: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx1-CXtrrkMpJ8Zq.png"), width: 100, height: 150)
}
