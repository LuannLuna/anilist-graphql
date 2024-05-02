//
//  DetailAnimeViewModel.swift
//  AniList
//
//  Created by Luann Marques Luna on 26/04/24.
//

import Foundation

struct DetailAnimeViewModel {
    private let anime: ShortAnimeViewModel
    private let detail: DetailAnimeInfo?
    
    init(anime: ShortAnimeViewModel, detail: DetailAnimeInfo? = nil) {
        self.anime = anime
        self.detail = detail
    }
    
    var url: URL? {
        anime.url
    }
    
    var banner: URL? {
        URL(string: detail?.bannerImage ?? "")
    }
    
    var title: String {
        anime.title
    }
    
    var originalName: String {
        anime.originalName
    }
    
    var description: String {
        detail?.description ?? ""
    }
    
    var genres: [String] {
        anime.genres
    }
    
    var hexColor: String {
        anime.hexColor
    }
    
    var meanScore: Int {
        anime.meanScore
    }
    
    var type: String {
        anime.type ?? ""
    }
    
    var numberUser: String {
        anime.numberUsers ?? ""
    }
    
    var numberEpisodes: String {
        anime.numberEpisodes ?? ""
    }
    
    var chapters: String? {
        guard let chapters = detail?.chapters else { return nil }
        return "\(chapters) chapters"
    }
    
    var status: String {
        detail?.status?.rawValue ?? ""
    }
    
    var startDate: String {
        var components = DateComponents()
        guard
            let year = detail?.startDate?.year,
            let month = detail?.startDate?.month,
            let day = detail?.startDate?.day
        else {
            return ""
        }
        components.year = year
        components.month = month
        components.day = day
        
        if let date = Calendar.current.date(from: components) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, yyyy"

            return dateFormatter.string(from: date)
        }
        return ""
    }
    
    var endDate: String {
        var components = DateComponents()
        guard
            let year = detail?.endDate?.year,
            let month = detail?.endDate?.month,
            let day = detail?.endDate?.day
        else {
            return ""
        }
        components.year = year
        components.month = month
        components.day = day
        
        if let date = Calendar.current.date(from: components) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, yyyy"

            return dateFormatter.string(from: date)
        }
        return ""
    }
    
    var relations: [RelationViewModel] {
        let relations: [DetailAnimeInfo.Relation.Node] = detail?.relations?.nodes?.compactMap { $0 } ?? []
        return relations.map(RelationViewModel.init)
    }
    
    var charNames: [CharNames] {
        detail?.characters?.nodes?.compactMap { node in
            CharNames(id: node?.id ?? UUID().hashValue, name: node?.name?.full ?? "", url: node?.image?.large ?? "")
        } ?? []
    }
    
    var staff: [Staff] {
        var staffs: [Staff] = []
        detail?.characters?.nodes?.forEach { characters in
            characters?.media?.nodes?.forEach { media in
                media?.staff?.nodes?.forEach { node in
                    staffs.append(Staff(id: node?.id ?? UUID().hashValue, name: node?.name?.full ?? "", url: node?.image?.large ?? ""))
                }
            }
        }
        
        return Array(Set(staffs))
    }
    
    struct Staff: Hashable {
        let id: Int
        let name: String
        let url: String
    }
    
    struct CharNames: Hashable {
        let id: Int
        let name: String
        let url: String
    }
}
