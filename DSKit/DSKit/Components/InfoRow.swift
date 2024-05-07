//
//  InfoRow.swift
//  DSKit
//
//  Created by Luann Marques Luna on 07/05/24.
//

import SwiftUI

public
struct InfoRow: View {
    var title: String
    var subtitle: String
    
    public init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }
    
    public var body: some View {
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
