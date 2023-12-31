//
//  OpenLibraryModel.swift
//  ProjectLibrarium
//
//  Created by ios5 on 21/08/2023.
//

import Foundation


struct OpenLibraryResponse: Codable {
    let docs: [SearchResults]
}

struct SearchResults: Codable, Identifiable {
    let id: String
    let title: String
    let authorId: [String]?
    let authorName: [String]?
    let amazonId: [String]?
    let goodreadsId: [String]?
    let averageRating: Double?
    var coverId: Int?
//    let favorite: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case authorId = "author_key"
        case authorName = "author_name"
        case amazonId = "id_amazon"
        case goodreadsId = "id_goodreads"
        case averageRating = "ratings_average"
        case id = "key"
        case coverId = "cover_i"
        case title
    }
}

struct OpenLibraryTrendingResponse: Codable {
    let works: [SearchResults]
}

struct OpenLibrarySingleWorkResponse: Codable {
    let title: String
    let description: String
    // find a way to have also with the second result key: string, value string
    let covers: [Int]?
    
    init(title: String, description: String, covers: [Int]) {
        self.title = title
        self.description = description
        self.covers = covers
    }
    
    static let empty = OpenLibrarySingleWorkResponse(title: "", description: "", covers: [])
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        covers = try container.decode([Int].self, forKey: .covers)
        do {
            description = try String(container.decode(String.self, forKey: .description))
        } catch DecodingError.typeMismatch {
            description = try container.decode(BookDescription.self, forKey: .description).value
        } catch {
            description = "N/A"
        }
    }
}

struct BookDescription: Codable {
    let value: String
}

struct AuthorSearchResponse: Codable {
    let numFound: Int
    let docs: [Author]
    
    struct Author: Codable {
        let key: String
    }
}
