//
//  RelationViewModel.swift
//  AniList
//
//  Created by Luann Marques Luna on 26/04/24.
//

import Foundation

struct RelationViewModel {
    private let relation: DetailAnimeInfo.Relation.Node
    
    init(relation: DetailAnimeInfo.Relation.Node) {
        self.relation = relation
    }
    
    var id: Int {
        relation.id
    }
    
    var title: String {
        relation.title?.fragments.nameInfo.english ?? ""
    }
    
    var originalName: String {
        relation.title?.fragments.nameInfo.native ?? ""
    }
    
    var url: URL? {
        URL(string: relation.coverImage?.extraLarge ?? "")
    }
}
