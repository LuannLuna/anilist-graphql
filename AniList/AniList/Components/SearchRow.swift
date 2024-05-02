//
//  SearchRow.swift
//  AniList
//
//  Created by Luann Marques Luna on 29/04/24.
//

import SwiftUI

struct SearchRow: View {
    var id: Int
    var title: String
    var url: URL?
    
    var body: some View {
        HStack(spacing: 5) {
            URLImage(url: url, width: 50, height: 50)
            Text(title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.primary)
        }
    }
}

#Preview {
    SearchRow(
        id: 1,
        title: "Ragnarok",
        url: URL(string: "https://s4.anilist.co/file/anilistcdn/media/manga/banner/30025-IaxAxX9hIGx0.jpg")
    )
}
