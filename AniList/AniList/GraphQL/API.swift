// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// The format the media was released in
public enum MediaFormat: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Anime broadcast on television
  case tv
  /// Anime which are under 15 minutes in length and broadcast on television
  case tvShort
  /// Anime movies with a theatrical release
  case movie
  /// Special episodes that have been included in DVD/Blu-ray releases, picture dramas, pilots, etc
  case special
  /// (Original Video Animation) Anime that have been released directly on DVD/Blu-ray without originally going through a theatrical release or television broadcast
  case ova
  /// (Original Net Animation) Anime that have been originally released online or are only available through streaming services.
  case ona
  /// Short anime released as a music video
  case music
  /// Professionally published manga with more than one chapter
  case manga
  /// Written books released as a series of light novels
  case novel
  /// Manga with just one chapter
  case oneShot
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "TV": self = .tv
      case "TV_SHORT": self = .tvShort
      case "MOVIE": self = .movie
      case "SPECIAL": self = .special
      case "OVA": self = .ova
      case "ONA": self = .ona
      case "MUSIC": self = .music
      case "MANGA": self = .manga
      case "NOVEL": self = .novel
      case "ONE_SHOT": self = .oneShot
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .tv: return "TV"
      case .tvShort: return "TV_SHORT"
      case .movie: return "MOVIE"
      case .special: return "SPECIAL"
      case .ova: return "OVA"
      case .ona: return "ONA"
      case .music: return "MUSIC"
      case .manga: return "MANGA"
      case .novel: return "NOVEL"
      case .oneShot: return "ONE_SHOT"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaFormat, rhs: MediaFormat) -> Bool {
    switch (lhs, rhs) {
      case (.tv, .tv): return true
      case (.tvShort, .tvShort): return true
      case (.movie, .movie): return true
      case (.special, .special): return true
      case (.ova, .ova): return true
      case (.ona, .ona): return true
      case (.music, .music): return true
      case (.manga, .manga): return true
      case (.novel, .novel): return true
      case (.oneShot, .oneShot): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MediaFormat] {
    return [
      .tv,
      .tvShort,
      .movie,
      .special,
      .ova,
      .ona,
      .music,
      .manga,
      .novel,
      .oneShot,
    ]
  }
}

/// The current releasing status of the media
public enum MediaStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Has completed and is no longer being released
  case finished
  /// Currently releasing
  case releasing
  /// To be released at a later date
  case notYetReleased
  /// Ended before the work could be finished
  case cancelled
  /// Version 2 only. Is currently paused from releasing and will resume at a later date
  case hiatus
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "FINISHED": self = .finished
      case "RELEASING": self = .releasing
      case "NOT_YET_RELEASED": self = .notYetReleased
      case "CANCELLED": self = .cancelled
      case "HIATUS": self = .hiatus
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .finished: return "FINISHED"
      case .releasing: return "RELEASING"
      case .notYetReleased: return "NOT_YET_RELEASED"
      case .cancelled: return "CANCELLED"
      case .hiatus: return "HIATUS"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaStatus, rhs: MediaStatus) -> Bool {
    switch (lhs, rhs) {
      case (.finished, .finished): return true
      case (.releasing, .releasing): return true
      case (.notYetReleased, .notYetReleased): return true
      case (.cancelled, .cancelled): return true
      case (.hiatus, .hiatus): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MediaStatus] {
    return [
      .finished,
      .releasing,
      .notYetReleased,
      .cancelled,
      .hiatus,
    ]
  }
}

public final class AllAnnimesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query AllAnnimes($page: Int) {
      Page(page: $page) {
        __typename
        pageInfo {
          __typename
          ...Pagination
        }
        media {
          __typename
          ...BaseAnimeInfo
        }
      }
    }
    """

  public let operationName: String = "AllAnnimes"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + Pagination.fragmentDefinition)
    document.append("\n" + BaseAnimeInfo.fragmentDefinition)
    document.append("\n" + NameInfo.fragmentDefinition)
    return document
  }

  public var page: Int?

  public init(page: Int? = nil) {
    self.page = page
  }

  public var variables: GraphQLMap? {
    return ["page": page]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Page", arguments: ["page": GraphQLVariable("page")], type: .object(Page.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(page: Page? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Page": page.flatMap { (value: Page) -> ResultMap in value.resultMap }])
    }

    public var page: Page? {
      get {
        return (resultMap["Page"] as? ResultMap).flatMap { Page(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Page")
      }
    }

    public struct Page: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Page"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("pageInfo", type: .object(PageInfo.selections)),
          GraphQLField("media", type: .list(.object(Medium.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(pageInfo: PageInfo? = nil, media: [Medium?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Page", "pageInfo": pageInfo.flatMap { (value: PageInfo) -> ResultMap in value.resultMap }, "media": media.flatMap { (value: [Medium?]) -> [ResultMap?] in value.map { (value: Medium?) -> ResultMap? in value.flatMap { (value: Medium) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The pagination information
      public var pageInfo: PageInfo? {
        get {
          return (resultMap["pageInfo"] as? ResultMap).flatMap { PageInfo(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "pageInfo")
        }
      }

      public var media: [Medium?]? {
        get {
          return (resultMap["media"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Medium?] in value.map { (value: ResultMap?) -> Medium? in value.flatMap { (value: ResultMap) -> Medium in Medium(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Medium?]) -> [ResultMap?] in value.map { (value: Medium?) -> ResultMap? in value.flatMap { (value: Medium) -> ResultMap in value.resultMap } } }, forKey: "media")
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PageInfo"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(Pagination.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(currentPage: Int? = nil, total: Int? = nil, hasNextPage: Bool? = nil) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "currentPage": currentPage, "total": total, "hasNextPage": hasNextPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var pagination: Pagination {
            get {
              return Pagination(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Medium: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Media"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(BaseAnimeInfo.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var baseAnimeInfo: BaseAnimeInfo {
            get {
              return BaseAnimeInfo(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class FindAnimeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FindAnime($search: String, $page: Int) {
      Page(page: $page) {
        __typename
        pageInfo {
          __typename
          ...Pagination
        }
        media(search: $search) {
          __typename
          ...BaseAnimeInfo
        }
      }
    }
    """

  public let operationName: String = "FindAnime"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + Pagination.fragmentDefinition)
    document.append("\n" + BaseAnimeInfo.fragmentDefinition)
    document.append("\n" + NameInfo.fragmentDefinition)
    return document
  }

  public var search: String?
  public var page: Int?

  public init(search: String? = nil, page: Int? = nil) {
    self.search = search
    self.page = page
  }

  public var variables: GraphQLMap? {
    return ["search": search, "page": page]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Page", arguments: ["page": GraphQLVariable("page")], type: .object(Page.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(page: Page? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Page": page.flatMap { (value: Page) -> ResultMap in value.resultMap }])
    }

    public var page: Page? {
      get {
        return (resultMap["Page"] as? ResultMap).flatMap { Page(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Page")
      }
    }

    public struct Page: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Page"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("pageInfo", type: .object(PageInfo.selections)),
          GraphQLField("media", arguments: ["search": GraphQLVariable("search")], type: .list(.object(Medium.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(pageInfo: PageInfo? = nil, media: [Medium?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Page", "pageInfo": pageInfo.flatMap { (value: PageInfo) -> ResultMap in value.resultMap }, "media": media.flatMap { (value: [Medium?]) -> [ResultMap?] in value.map { (value: Medium?) -> ResultMap? in value.flatMap { (value: Medium) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The pagination information
      public var pageInfo: PageInfo? {
        get {
          return (resultMap["pageInfo"] as? ResultMap).flatMap { PageInfo(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "pageInfo")
        }
      }

      public var media: [Medium?]? {
        get {
          return (resultMap["media"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Medium?] in value.map { (value: ResultMap?) -> Medium? in value.flatMap { (value: ResultMap) -> Medium in Medium(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Medium?]) -> [ResultMap?] in value.map { (value: Medium?) -> ResultMap? in value.flatMap { (value: Medium) -> ResultMap in value.resultMap } } }, forKey: "media")
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PageInfo"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(Pagination.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(currentPage: Int? = nil, total: Int? = nil, hasNextPage: Bool? = nil) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "currentPage": currentPage, "total": total, "hasNextPage": hasNextPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var pagination: Pagination {
            get {
              return Pagination(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Medium: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Media"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(BaseAnimeInfo.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var baseAnimeInfo: BaseAnimeInfo {
            get {
              return BaseAnimeInfo(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class FetchDetailQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchDetail($mediaId: Int) {
      Page {
        __typename
        media(id: $mediaId) {
          __typename
          ...BaseAnimeInfo
          ...DetailAnimeInfo
        }
      }
    }
    """

  public let operationName: String = "FetchDetail"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + BaseAnimeInfo.fragmentDefinition)
    document.append("\n" + NameInfo.fragmentDefinition)
    document.append("\n" + DetailAnimeInfo.fragmentDefinition)
    return document
  }

  public var mediaId: Int?

  public init(mediaId: Int? = nil) {
    self.mediaId = mediaId
  }

  public var variables: GraphQLMap? {
    return ["mediaId": mediaId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Page", type: .object(Page.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(page: Page? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Page": page.flatMap { (value: Page) -> ResultMap in value.resultMap }])
    }

    public var page: Page? {
      get {
        return (resultMap["Page"] as? ResultMap).flatMap { Page(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Page")
      }
    }

    public struct Page: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Page"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("media", arguments: ["id": GraphQLVariable("mediaId")], type: .list(.object(Medium.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(media: [Medium?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Page", "media": media.flatMap { (value: [Medium?]) -> [ResultMap?] in value.map { (value: Medium?) -> ResultMap? in value.flatMap { (value: Medium) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var media: [Medium?]? {
        get {
          return (resultMap["media"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Medium?] in value.map { (value: ResultMap?) -> Medium? in value.flatMap { (value: ResultMap) -> Medium in Medium(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Medium?]) -> [ResultMap?] in value.map { (value: Medium?) -> ResultMap? in value.flatMap { (value: Medium) -> ResultMap in value.resultMap } } }, forKey: "media")
        }
      }

      public struct Medium: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Media"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(BaseAnimeInfo.self),
            GraphQLFragmentSpread(DetailAnimeInfo.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var baseAnimeInfo: BaseAnimeInfo {
            get {
              return BaseAnimeInfo(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public var detailAnimeInfo: DetailAnimeInfo {
            get {
              return DetailAnimeInfo(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public struct NameInfo: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment NameInfo on MediaTitle {
      __typename
      english
      native
      romaji
    }
    """

  public static let possibleTypes: [String] = ["MediaTitle"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("english", type: .scalar(String.self)),
      GraphQLField("native", type: .scalar(String.self)),
      GraphQLField("romaji", type: .scalar(String.self)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(english: String? = nil, native: String? = nil, romaji: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "MediaTitle", "english": english, "native": native, "romaji": romaji])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The official english title
  public var english: String? {
    get {
      return resultMap["english"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "english")
    }
  }

  /// Official title in it's native language
  public var native: String? {
    get {
      return resultMap["native"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "native")
    }
  }

  /// The romanization of the native language title
  public var romaji: String? {
    get {
      return resultMap["romaji"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "romaji")
    }
  }
}

public struct Pagination: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment Pagination on PageInfo {
      __typename
      currentPage
      total
      hasNextPage
    }
    """

  public static let possibleTypes: [String] = ["PageInfo"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("currentPage", type: .scalar(Int.self)),
      GraphQLField("total", type: .scalar(Int.self)),
      GraphQLField("hasNextPage", type: .scalar(Bool.self)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(currentPage: Int? = nil, total: Int? = nil, hasNextPage: Bool? = nil) {
    self.init(unsafeResultMap: ["__typename": "PageInfo", "currentPage": currentPage, "total": total, "hasNextPage": hasNextPage])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The current page
  public var currentPage: Int? {
    get {
      return resultMap["currentPage"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "currentPage")
    }
  }

  /// The total number of items. Note: This value is not guaranteed to be accurate, do not rely on this for logic
  public var total: Int? {
    get {
      return resultMap["total"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "total")
    }
  }

  /// If there is another page
  public var hasNextPage: Bool? {
    get {
      return resultMap["hasNextPage"] as? Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "hasNextPage")
    }
  }
}

public struct BaseAnimeInfo: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment BaseAnimeInfo on Media {
      __typename
      id
      title {
        __typename
        ...NameInfo
      }
      coverImage {
        __typename
        extraLarge
        color
      }
      meanScore
      genres
      episodes
      meanScore
      format
      popularity
    }
    """

  public static let possibleTypes: [String] = ["Media"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(Int.self))),
      GraphQLField("title", type: .object(Title.selections)),
      GraphQLField("coverImage", type: .object(CoverImage.selections)),
      GraphQLField("meanScore", type: .scalar(Int.self)),
      GraphQLField("genres", type: .list(.scalar(String.self))),
      GraphQLField("episodes", type: .scalar(Int.self)),
      GraphQLField("meanScore", type: .scalar(Int.self)),
      GraphQLField("format", type: .scalar(MediaFormat.self)),
      GraphQLField("popularity", type: .scalar(Int.self)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: Int, title: Title? = nil, coverImage: CoverImage? = nil, meanScore: Int? = nil, genres: [String?]? = nil, episodes: Int? = nil, format: MediaFormat? = nil, popularity: Int? = nil) {
    self.init(unsafeResultMap: ["__typename": "Media", "id": id, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }, "meanScore": meanScore, "genres": genres, "episodes": episodes, "format": format, "popularity": popularity])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The id of the media
  public var id: Int {
    get {
      return resultMap["id"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  /// The official titles of the media in various languages
  public var title: Title? {
    get {
      return (resultMap["title"] as? ResultMap).flatMap { Title(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "title")
    }
  }

  /// The cover images of the media
  public var coverImage: CoverImage? {
    get {
      return (resultMap["coverImage"] as? ResultMap).flatMap { CoverImage(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "coverImage")
    }
  }

  /// Mean score of all the user's scores of the media
  public var meanScore: Int? {
    get {
      return resultMap["meanScore"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "meanScore")
    }
  }

  /// The genres of the media
  public var genres: [String?]? {
    get {
      return resultMap["genres"] as? [String?]
    }
    set {
      resultMap.updateValue(newValue, forKey: "genres")
    }
  }

  /// The amount of episodes the anime has when complete
  public var episodes: Int? {
    get {
      return resultMap["episodes"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "episodes")
    }
  }

  /// The format the media was released in
  public var format: MediaFormat? {
    get {
      return resultMap["format"] as? MediaFormat
    }
    set {
      resultMap.updateValue(newValue, forKey: "format")
    }
  }

  /// The number of users with the media on their list
  public var popularity: Int? {
    get {
      return resultMap["popularity"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "popularity")
    }
  }

  public struct Title: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["MediaTitle"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(NameInfo.self),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(english: String? = nil, native: String? = nil, romaji: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "MediaTitle", "english": english, "native": native, "romaji": romaji])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var nameInfo: NameInfo {
        get {
          return NameInfo(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }

  public struct CoverImage: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["MediaCoverImage"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("extraLarge", type: .scalar(String.self)),
        GraphQLField("color", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(extraLarge: String? = nil, color: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "MediaCoverImage", "extraLarge": extraLarge, "color": color])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The cover image url of the media at its largest size. If this size isn't available, large will be provided instead.
    public var extraLarge: String? {
      get {
        return resultMap["extraLarge"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "extraLarge")
      }
    }

    /// Average #hex color of cover image
    public var color: String? {
      get {
        return resultMap["color"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "color")
      }
    }
  }
}

public struct DetailAnimeInfo: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment DetailAnimeInfo on Media {
      __typename
      description
      chapters
      status
      startDate {
        __typename
        day
        month
        year
      }
      endDate {
        __typename
        day
        month
        year
      }
      characters {
        __typename
        nodes {
          __typename
          id
          name {
            __typename
            alternative
            full
          }
          age
          gender
          image {
            __typename
            large
          }
          description
          media {
            __typename
            nodes {
              __typename
              staff {
                __typename
                nodes {
                  __typename
                  id
                  name {
                    __typename
                    full
                  }
                  image {
                    __typename
                    large
                  }
                  description
                  primaryOccupations
                  age
                  languageV2
                }
              }
            }
          }
        }
      }
      bannerImage
      nextAiringEpisode {
        __typename
        airingAt
        episode
        timeUntilAiring
        media {
          __typename
          bannerImage
        }
      }
      relations {
        __typename
        nodes {
          __typename
          id
          title {
            __typename
            ...NameInfo
          }
          coverImage {
            __typename
            extraLarge
          }
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["Media"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("description", type: .scalar(String.self)),
      GraphQLField("chapters", type: .scalar(Int.self)),
      GraphQLField("status", type: .scalar(MediaStatus.self)),
      GraphQLField("startDate", type: .object(StartDate.selections)),
      GraphQLField("endDate", type: .object(EndDate.selections)),
      GraphQLField("characters", type: .object(Character.selections)),
      GraphQLField("bannerImage", type: .scalar(String.self)),
      GraphQLField("nextAiringEpisode", type: .object(NextAiringEpisode.selections)),
      GraphQLField("relations", type: .object(Relation.selections)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(description: String? = nil, chapters: Int? = nil, status: MediaStatus? = nil, startDate: StartDate? = nil, endDate: EndDate? = nil, characters: Character? = nil, bannerImage: String? = nil, nextAiringEpisode: NextAiringEpisode? = nil, relations: Relation? = nil) {
    self.init(unsafeResultMap: ["__typename": "Media", "description": description, "chapters": chapters, "status": status, "startDate": startDate.flatMap { (value: StartDate) -> ResultMap in value.resultMap }, "endDate": endDate.flatMap { (value: EndDate) -> ResultMap in value.resultMap }, "characters": characters.flatMap { (value: Character) -> ResultMap in value.resultMap }, "bannerImage": bannerImage, "nextAiringEpisode": nextAiringEpisode.flatMap { (value: NextAiringEpisode) -> ResultMap in value.resultMap }, "relations": relations.flatMap { (value: Relation) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// Short description of the media's story and characters
  public var description: String? {
    get {
      return resultMap["description"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "description")
    }
  }

  /// The amount of chapters the manga has when complete
  public var chapters: Int? {
    get {
      return resultMap["chapters"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "chapters")
    }
  }

  /// The current releasing status of the media
  public var status: MediaStatus? {
    get {
      return resultMap["status"] as? MediaStatus
    }
    set {
      resultMap.updateValue(newValue, forKey: "status")
    }
  }

  /// The first official release date of the media
  public var startDate: StartDate? {
    get {
      return (resultMap["startDate"] as? ResultMap).flatMap { StartDate(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "startDate")
    }
  }

  /// The last official release date of the media
  public var endDate: EndDate? {
    get {
      return (resultMap["endDate"] as? ResultMap).flatMap { EndDate(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "endDate")
    }
  }

  /// The characters in the media
  public var characters: Character? {
    get {
      return (resultMap["characters"] as? ResultMap).flatMap { Character(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "characters")
    }
  }

  /// The banner image of the media
  public var bannerImage: String? {
    get {
      return resultMap["bannerImage"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "bannerImage")
    }
  }

  /// The media's next episode airing schedule
  public var nextAiringEpisode: NextAiringEpisode? {
    get {
      return (resultMap["nextAiringEpisode"] as? ResultMap).flatMap { NextAiringEpisode(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "nextAiringEpisode")
    }
  }

  /// Other media in the same or connecting franchise
  public var relations: Relation? {
    get {
      return (resultMap["relations"] as? ResultMap).flatMap { Relation(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "relations")
    }
  }

  public struct StartDate: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["FuzzyDate"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("day", type: .scalar(Int.self)),
        GraphQLField("month", type: .scalar(Int.self)),
        GraphQLField("year", type: .scalar(Int.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(day: Int? = nil, month: Int? = nil, year: Int? = nil) {
      self.init(unsafeResultMap: ["__typename": "FuzzyDate", "day": day, "month": month, "year": year])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Numeric Day (24)
    public var day: Int? {
      get {
        return resultMap["day"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "day")
      }
    }

    /// Numeric Month (3)
    public var month: Int? {
      get {
        return resultMap["month"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "month")
      }
    }

    /// Numeric Year (2017)
    public var year: Int? {
      get {
        return resultMap["year"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "year")
      }
    }
  }

  public struct EndDate: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["FuzzyDate"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("day", type: .scalar(Int.self)),
        GraphQLField("month", type: .scalar(Int.self)),
        GraphQLField("year", type: .scalar(Int.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(day: Int? = nil, month: Int? = nil, year: Int? = nil) {
      self.init(unsafeResultMap: ["__typename": "FuzzyDate", "day": day, "month": month, "year": year])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Numeric Day (24)
    public var day: Int? {
      get {
        return resultMap["day"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "day")
      }
    }

    /// Numeric Month (3)
    public var month: Int? {
      get {
        return resultMap["month"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "month")
      }
    }

    /// Numeric Year (2017)
    public var year: Int? {
      get {
        return resultMap["year"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "year")
      }
    }
  }

  public struct Character: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["CharacterConnection"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("nodes", type: .list(.object(Node.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(nodes: [Node?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "CharacterConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var nodes: [Node?]? {
      get {
        return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
      }
    }

    public struct Node: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Character"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .object(Name.selections)),
          GraphQLField("age", type: .scalar(String.self)),
          GraphQLField("gender", type: .scalar(String.self)),
          GraphQLField("image", type: .object(Image.selections)),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("media", type: .object(Medium.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, name: Name? = nil, age: String? = nil, gender: String? = nil, image: Image? = nil, description: String? = nil, media: Medium? = nil) {
        self.init(unsafeResultMap: ["__typename": "Character", "id": id, "name": name.flatMap { (value: Name) -> ResultMap in value.resultMap }, "age": age, "gender": gender, "image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }, "description": description, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The id of the character
      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The names of the character
      public var name: Name? {
        get {
          return (resultMap["name"] as? ResultMap).flatMap { Name(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "name")
        }
      }

      /// The character's age. Note this is a string, not an int, it may contain further text and additional ages.
      public var age: String? {
        get {
          return resultMap["age"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "age")
        }
      }

      /// The character's gender. Usually Male, Female, or Non-binary but can be any string.
      public var gender: String? {
        get {
          return resultMap["gender"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender")
        }
      }

      /// Character images
      public var image: Image? {
        get {
          return (resultMap["image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "image")
        }
      }

      /// A general description of the character
      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      /// Media that includes the character
      public var media: Medium? {
        get {
          return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "media")
        }
      }

      public struct Name: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CharacterName"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("alternative", type: .list(.scalar(String.self))),
            GraphQLField("full", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(alternative: [String?]? = nil, full: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "CharacterName", "alternative": alternative, "full": full])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Other names the character might be referred to as
        public var alternative: [String?]? {
          get {
            return resultMap["alternative"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "alternative")
          }
        }

        /// The character's first and last name
        public var full: String? {
          get {
            return resultMap["full"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "full")
          }
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CharacterImage"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("large", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(large: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "CharacterImage", "large": large])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The character's image of media at its largest size
        public var large: String? {
          get {
            return resultMap["large"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "large")
          }
        }
      }

      public struct Medium: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nodes", type: .list(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nodes: [Node?]? {
          get {
            return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Media"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("staff", type: .object(Staff.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(staff: Staff? = nil) {
            self.init(unsafeResultMap: ["__typename": "Media", "staff": staff.flatMap { (value: Staff) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The staff who produced the media
          public var staff: Staff? {
            get {
              return (resultMap["staff"] as? ResultMap).flatMap { Staff(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "staff")
            }
          }

          public struct Staff: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["StaffConnection"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("nodes", type: .list(.object(Node.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(nodes: [Node?]? = nil) {
              self.init(unsafeResultMap: ["__typename": "StaffConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var nodes: [Node?]? {
              get {
                return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
              }
              set {
                resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
              }
            }

            public struct Node: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Staff"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                  GraphQLField("name", type: .object(Name.selections)),
                  GraphQLField("image", type: .object(Image.selections)),
                  GraphQLField("description", type: .scalar(String.self)),
                  GraphQLField("primaryOccupations", type: .list(.scalar(String.self))),
                  GraphQLField("age", type: .scalar(Int.self)),
                  GraphQLField("languageV2", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: Int, name: Name? = nil, image: Image? = nil, description: String? = nil, primaryOccupations: [String?]? = nil, age: Int? = nil, languageV2: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Staff", "id": id, "name": name.flatMap { (value: Name) -> ResultMap in value.resultMap }, "image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }, "description": description, "primaryOccupations": primaryOccupations, "age": age, "languageV2": languageV2])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The id of the staff member
              public var id: Int {
                get {
                  return resultMap["id"]! as! Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              /// The names of the staff member
              public var name: Name? {
                get {
                  return (resultMap["name"] as? ResultMap).flatMap { Name(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "name")
                }
              }

              /// The staff images
              public var image: Image? {
                get {
                  return (resultMap["image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "image")
                }
              }

              /// A general description of the staff member
              public var description: String? {
                get {
                  return resultMap["description"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "description")
                }
              }

              /// The person's primary occupations
              public var primaryOccupations: [String?]? {
                get {
                  return resultMap["primaryOccupations"] as? [String?]
                }
                set {
                  resultMap.updateValue(newValue, forKey: "primaryOccupations")
                }
              }

              /// The person's age in years
              public var age: Int? {
                get {
                  return resultMap["age"] as? Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "age")
                }
              }

              /// The primary language of the staff member. Current values: Japanese, English, Korean, Italian, Spanish, Portuguese, French, German, Hebrew, Hungarian, Chinese, Arabic, Filipino, Catalan, Finnish, Turkish, Dutch, Swedish, Thai, Tagalog, Malaysian, Indonesian, Vietnamese, Nepali, Hindi, Urdu
              public var languageV2: String? {
                get {
                  return resultMap["languageV2"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "languageV2")
                }
              }

              public struct Name: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["StaffName"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("full", type: .scalar(String.self)),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(full: String? = nil) {
                  self.init(unsafeResultMap: ["__typename": "StaffName", "full": full])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The person's first and last name
                public var full: String? {
                  get {
                    return resultMap["full"] as? String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "full")
                  }
                }
              }

              public struct Image: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["StaffImage"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("large", type: .scalar(String.self)),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(large: String? = nil) {
                  self.init(unsafeResultMap: ["__typename": "StaffImage", "large": large])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The person's image of media at its largest size
                public var large: String? {
                  get {
                    return resultMap["large"] as? String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "large")
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  public struct NextAiringEpisode: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["AiringSchedule"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("airingAt", type: .nonNull(.scalar(Int.self))),
        GraphQLField("episode", type: .nonNull(.scalar(Int.self))),
        GraphQLField("timeUntilAiring", type: .nonNull(.scalar(Int.self))),
        GraphQLField("media", type: .object(Medium.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(airingAt: Int, episode: Int, timeUntilAiring: Int, media: Medium? = nil) {
      self.init(unsafeResultMap: ["__typename": "AiringSchedule", "airingAt": airingAt, "episode": episode, "timeUntilAiring": timeUntilAiring, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The time the episode airs at
    public var airingAt: Int {
      get {
        return resultMap["airingAt"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "airingAt")
      }
    }

    /// The airing episode number
    public var episode: Int {
      get {
        return resultMap["episode"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "episode")
      }
    }

    /// Seconds until episode starts airing
    public var timeUntilAiring: Int {
      get {
        return resultMap["timeUntilAiring"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "timeUntilAiring")
      }
    }

    /// The associate media of the airing episode
    public var media: Medium? {
      get {
        return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "media")
      }
    }

    public struct Medium: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Media"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("bannerImage", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(bannerImage: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Media", "bannerImage": bannerImage])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The banner image of the media
      public var bannerImage: String? {
        get {
          return resultMap["bannerImage"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "bannerImage")
        }
      }
    }
  }

  public struct Relation: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["MediaConnection"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("nodes", type: .list(.object(Node.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(nodes: [Node?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "MediaConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var nodes: [Node?]? {
      get {
        return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
      }
    }

    public struct Node: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Media"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("title", type: .object(Title.selections)),
          GraphQLField("coverImage", type: .object(CoverImage.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, title: Title? = nil, coverImage: CoverImage? = nil) {
        self.init(unsafeResultMap: ["__typename": "Media", "id": id, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The id of the media
      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The official titles of the media in various languages
      public var title: Title? {
        get {
          return (resultMap["title"] as? ResultMap).flatMap { Title(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "title")
        }
      }

      /// The cover images of the media
      public var coverImage: CoverImage? {
        get {
          return (resultMap["coverImage"] as? ResultMap).flatMap { CoverImage(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "coverImage")
        }
      }

      public struct Title: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaTitle"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(NameInfo.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(english: String? = nil, native: String? = nil, romaji: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaTitle", "english": english, "native": native, "romaji": romaji])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var nameInfo: NameInfo {
            get {
              return NameInfo(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct CoverImage: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaCoverImage"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("extraLarge", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(extraLarge: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaCoverImage", "extraLarge": extraLarge])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The cover image url of the media at its largest size. If this size isn't available, large will be provided instead.
        public var extraLarge: String? {
          get {
            return resultMap["extraLarge"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "extraLarge")
          }
        }
      }
    }
  }
}
