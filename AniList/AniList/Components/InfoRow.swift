//
//  InfoRow.swift
//  AniList
//
//  Created by Luann Marques Luna on 27/04/24.
//

import SwiftUI

struct InfoRow: View {
    var title: String
    var subtitle: String
    var body: some View {
        HStack {
            Text(title)
                .fontWeight(.semibold)
                .font(.footnote)
                .multilineTextAlignment(.leading)
            
            Text(subtitle)
                .font(.footnote)
        }
    }
}

#Preview {
    InfoRow(title: "Mean Score", subtitle: "86 %")
}
