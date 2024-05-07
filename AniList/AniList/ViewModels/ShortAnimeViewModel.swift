//
//  ShortAnimeViewModel.swift
//  AniList
//
//  Created by Luann Marques Luna on 24/04/24.
//

import Foundation
import DSKit

struct ShortAnimeViewModel {
    
    private let anime: BaseAnimeInfo
    let id = UUID()
    
    init(anime: BaseAnimeInfo) {
        self.anime = anime
    }
    
    var animeID: Int {
        anime.id
    }
    
    var url: URL? {
        URL(string: anime.coverImage?.extraLarge ?? "")
    }
    
    var title: String {
        anime.title?.fragments.nameInfo.english ?? "--"
    }
    
    var originalName: String {
        anime.title?.fragments.nameInfo.native ?? ""
    }
    
    var approvePercentage: String? {
        guard let percent = anime.meanScore else { return nil }
        return "\(percent) %"
    }
    
    var numberUsers: String? {
        guard let users = anime.popularity else { return nil }
        return "\(users) users"
    }
    
    var numberEpisodes: String? {
        guard let number = anime.episodes else { return nil }
        var result = "\(number) episodio"
        if number > 1 {
            result += "s"
        }
        return result
    }
    
    var genres: [String] {
        let genres: [String] = anime.genres?.compactMap { $0 } ?? []
        return genres
    }
    
    var hexColor: String {
        anime.coverImage?.color ?? "#aee493"
    }
    
    var type: String? {
        anime.format?.rawValue
    }
    
    var meanScore: Int {
        anime.meanScore ?? 0
    }
}

extension ShortAnimeViewModel {
    var asListItemModel: ListItemModel {
        ListItemModel(
            url: url,
            title: title,
            subtitle: originalName,
            approvePercentage: approvePercentage,
            users: numberUsers,
            type: type ?? "",
            episodes: numberEpisodes,
            genres: genres,
            hexColor: hexColor
        )
    }
}

extension ShortAnimeViewModel: Hashable, Identifiable {
    static func == (lhs: ShortAnimeViewModel, rhs: ShortAnimeViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
