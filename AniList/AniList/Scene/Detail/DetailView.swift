//
//  DetailView.swift
//  AniList
//
//  Created by Luann Marques Luna on 26/04/24.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewViewModel
    @State private var isShowingNewDetails = false
    @State private var selectedSegment = 0
    let segments = ["Relations", "Characters", "Staffs"]
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                if let anime = viewModel.anime {
                    VStack(alignment: .leading) {
                        URLImage(url: anime.banner)
                        VStack(spacing: 15) {
                            Text(anime.title)
                                .font(.headline)
                                .foregroundColor(.primary)
                                .lineLimit(2)
                                .multilineTextAlignment(.leading)
                            Text(anime.originalName)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.leading)
                            HTMLContentView(htmlString: anime.description)
                                .font(.footnote)
                            
                            Picker(selection: $selectedSegment, label: Text("Segments")) {
                                ForEach(0..<segments.count, id: \.self) { index in
                                    Text(segments[index]).tag(index)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            
                            switch selectedSegment {
                            case 0:
                                HorizontalGrid(items: anime.relations.map {
                                    HorizontalGrid.HGridItem(
                                        id: $0.id,
                                        url: $0.url,
                                        title: $0.title
                                    )
                                })
                            case 1:
                                HorizontalGrid(items: anime.charNames.map {
                                    HorizontalGrid.HGridItem(
                                        id: $0.id,
                                        url: URL(string: $0.url),
                                        title: $0.name
                                    )
                                })
                            default:
                                HorizontalGrid(items: anime.staff.map {
                                    HorizontalGrid.HGridItem(
                                        id: $0.id,
                                        url: URL(string: $0.url),
                                        title: $0.name
                                    )
                                })
                            }
                            
                            VStack(alignment: .leading, spacing: 20) {
                                InfoRow(title: "Format", subtitle: anime.type)
                                InfoRow(title: "Status", subtitle: anime.status)
                                InfoRow(title: "Start date", subtitle: anime.startDate)
                                InfoRow(title: "End date", subtitle: anime.endDate)
                                InfoRow(title: "Mean Score", subtitle: "\(anime.meanScore)%")
                                InfoRow(title: "Popularity", subtitle: anime.numberUser)
                                InfoRow(title: "Episodes", subtitle: anime.numberEpisodes)
                                if let chapters = anime.chapters {
                                    InfoRow(title: "Chapters", subtitle: chapters)
                                }
                                Text("Genres")
                                    .fontWeight(.semibold)
                                    .font(.subheadline)
                                    .multilineTextAlignment(.leading)
                                GenresGrid(
                                    genres: anime.genres,
                                    color: anime.hexColor
                                )
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            
            if viewModel.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .task {
            await viewModel.fetchAnime()
        }
    }
    
}

#Preview {
    DetailView(
        viewModel: DetailViewViewModel(
            anime: DetailAnimeViewModel(
                anime: ShortAnimeViewModel(
                    anime: BaseAnimeInfo(
                        id: 1,
                        title: BaseAnimeInfo.Title(
                            english: "Cowboy Bebop",
                            native: "カウボーイビバップ"
                        ),
                        coverImage: BaseAnimeInfo.CoverImage(
                            extraLarge: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx1-CXtrrkMpJ8Zq.png",
                            color: "#f1785d"
                        ),
                        meanScore: 86,
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
                        episodes: 26,
                        format: .tv,
                        popularity: 345926
                    )
                ),
                detail: DetailAnimeInfo(
                    description: "Alchemy tore the Elric brothers’ bodies apart. Can their bond make them whole again?<br>\nIn this world, alchemists are those who study and perform the art of alchemical transmutation—the science of manipulating and transforming matter. They are bounded by the Law of Equivalent Exchange: in order to gain something, one must sacrifice something of equal value.<br>\nIn an alchemical ritual gone wrong, Edward Elric lost his arm and his leg, and his brother Alphonse became nothing but a soul in a suit of armor. Equipped with mechanical “auto-mail” limbs, Edward becomes a state alchemist, seeking the one thing that can restore his and his brother’s bodies...the legendary Philosopher’s Stone.\n<br><br>\n(Source: Viz Media)\n<br><br>\n<i>Note: Includes 8 extra chapters.</i>",
                    chapters: 116,
                    status: .finished,
                    startDate: DetailAnimeInfo.StartDate(
                        day: 19,
                        month: 10,
                        year: 2002
                    ),
                    endDate: DetailAnimeInfo.EndDate(
                        day: 20,
                        month: 12,
                        year: 2010
                    ),
                    characters: DetailAnimeInfo.Character (
                        nodes: [
                            DetailAnimeInfo.Character.Node(
                                id: 1,
                                name: DetailAnimeInfo.Character.Node.Name(
                                    alternative: [
                                        "Ed",
                                        "Fullmetal Alchemist",
                                        "Pipsqueak",
                                        "Little Red Runt",
                                        "Shorty",
                                        "Insect",
                                        "Hero of the People"
                                    ],
                                    full: "Edward Elric"
                                ),
                                age: "15-16 (series), 18 (movie, End of the series)",
                                gender: "Male",
                                image: DetailAnimeInfo.Character.Node.Image(
                                    large: "https://s4.anilist.co/file/anilistcdn/character/large/b11-TA5Nuk7EDUZG.jpg"
                                ),
                                description: "__Birthplace:__ Resembool, Amestris\n__Height:__ 1,65m\n__Family:__ [Alphonse Elric (brother)](https://anilist.co/character/12/Alphonse-Elric), [Van Hohenheim (father)](https://anilist.co/character/9792/Van-Hohenheim), [Trisha Elric (mother, deceased)](https://anilist.co/character/10085/Trisha-Elric)\n__Affiliations:__ State Military, [Pinako Rockbell](https://anilist.co/character/65/Pinako-Rockbell), [Izumi Curtis (teacher)](https://anilist.co/character/67/Izumi-Curtis), [Roy Mustang (Commander)](https://anilist.co/character/68/Roy-Mustang)\n__Occupation:__ State Alchemist\n\nEdward \"Fullmetal Alchemist\" Elric is a young alchemical prodigy. He is the youngest State Alchemist ever to be recognized by the Amestris State Military, having received the title at the age of 12. Ed's primary motivation throughout the series is to return his younger brother, Alphonse, to his original body, which was lost in a failed human transmutation. Edward, despite his occasional bouts of immaturity, is a selfless boy who gains a reputation as a \"hero of the people\" throughout his youth. Notably, he doesn't seem concerned about returning his own arm and leg, instead focusing entirely on Al's suffering.\n\nEdward is small for his age, standing at only 149 cm (4'11\"), however his body is that of an experienced martial artist, with noticeable muscles and a wealth of agility. Although he lacks both his right arm and left leg, Ed's ability to fight is not impaired, and is in fact improved, as he will often use alchemy to cause his metal arm to partly transform into a blade or shield. His heavy automail limbs are considered by him to be the very best in Amestris. They were made by his childhood friend, Winry Rockbell, and she is constantly working on them. He is able to think quickly, even in desperate situations, though can still be frightened into paralysis. These qualities, combined with his alchemical powers and physical strength, make him a formidable fighter."
                            )
                        ]
                    ),
                    bannerImage: "https://s4.anilist.co/file/anilistcdn/media/manga/banner/30025-IaxAxX9hIGx0.jpg",
                    nextAiringEpisode: nil,
                    relations: DetailAnimeInfo.Relation(
                        nodes: [
                            DetailAnimeInfo.Relation.Node(
                                id: 115,
                                title: DetailAnimeInfo.Relation.Node.Title (
                                    english: "Fullmetal Alchemist: Brotherhood",
                                    native: "鋼の錬金術師 FULLMETAL ALCHEMIST"
                                ),
                                coverImage: DetailAnimeInfo.Relation.Node.CoverImage(
                                    extraLarge: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx5114-Dilr312jctdJ.jpg"
                                )
                            )
                        ]
                    )
                )
            )
        )
    )
}
