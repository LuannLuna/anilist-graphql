//
//  GenresGrid.swift
//  DSKit
//
//  Created by Luann Marques Luna on 07/05/24.
//

import SwiftUI

public
struct GenresGrid: View {
    
    let columns = [GridItem(.adaptive(minimum: 80))]
    let genres: [String]
    let color: String
    
    public init(genres: [String], color: String) {
        self.genres = genres
        self.color = color
    }
    
    public var body: some View {
        LazyVGrid(columns: columns, spacing: 5) {
            ForEach(genres, id: \.self) { genre in
                Text(genre)
                    .padding(.horizontal, 5)
                    .padding(.vertical, 3)
                    .background(Color(hex: color))
                    .clipShape(Capsule())
            }
        }
        .foregroundColor(.white)
        .font(.footnote)
    }
}

#Preview {
    GenresGrid(
        genres: [
            "Action",
            "Adventure",
            "Drama",
            "Sci-Fi",
            "Mystery",
            "Mecha",
            "Slice of life",
            "Sports",
            "Psyclogical"
        ],
        color: "#f1785d"
    )
}
