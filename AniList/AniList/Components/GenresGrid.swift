//
//  GenrerGrid.swift
//  AniList
//
//  Created by Luann Marques Luna on 27/04/24.
//

import SwiftUI

struct GenresGrid: View {
    
    let columns = [GridItem(.adaptive(minimum: 80))]
    let genres: [String]
    let color: String
    
    var body: some View {
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
