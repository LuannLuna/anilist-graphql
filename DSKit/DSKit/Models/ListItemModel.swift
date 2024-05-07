//
//  ListItemModel.swift
//  DSKit
//
//  Created by Luann Marques Luna on 07/05/24.
//

import Foundation

public
struct ListItemModel {
    let url: URL?
    let title: String
    let subtitle: String
    let approvePercentage: String?
    let users: String?
    let type: String
    let episodes: String?
    let genres: [String]
    let hexColor: String
    
    public init(
        url: URL?,
        title: String,
        subtitle: String,
        approvePercentage: String?,
        users: String?,
        type: String,
        episodes: String?,
        genres: [String],
        hexColor: String
    ) {
        self.url = url
        self.title = title
        self.subtitle = subtitle
        self.approvePercentage = approvePercentage
        self.users = users
        self.type = type
        self.episodes = episodes
        self.genres = genres
        self.hexColor = hexColor
    }
}
