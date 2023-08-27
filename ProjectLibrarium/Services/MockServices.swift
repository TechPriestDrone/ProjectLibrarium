//
//  MockServices.swift
//  ProjectLibrarium
//
//  Created by ios5 on 22/08/2023.
//

import Foundation

class SearchServicesMock: SearchProtocol {
    func openLibrarySingleBook(openLibraryKey: String) async -> OpenLibrarySingleWorkResponse {
        OpenLibrarySingleWorkResponse(title: "NO BOOK", description: "NO BOOK", covers: [6498519, 8904777, 108274, 233884, 1119236, -1, 10222599, 10482837, 3216657, 10519563, 10835922, 10835924, 10861366, 10883671])
    }
    
    func openLibraryTrendingList() async -> [SearchResults] {
        let mockResults: [SearchResults] = [SearchResults(id: "HELLO", title: "ABC", authorId: nil, authorName: nil, amazonId: nil, goodreadsId: nil, averageRating: nil, coverId: 7890714),
                                            SearchResults(id: "123123", title: "Foundation", authorId: nil, authorName: nil, amazonId: nil, goodreadsId: nil, averageRating: nil, coverId: 7890714),
                                            SearchResults(id: "123124", title: "Life Of Pi", authorId: nil, authorName: nil, amazonId: nil, goodreadsId: nil, averageRating: nil, coverId: 7890714)]
                return mockResults
    }
    
    func findBookOpenLibrary(searchQuery: String) async -> [SearchResults] {
        let mockResults: [SearchResults] = [SearchResults(id: "HELLO", title: "ABC", authorId: ["ASDF"], authorName: ["ASSSD"], amazonId: ["asss"], goodreadsId: ["ssdsd"], averageRating: 3.1, coverId: 7890714),
                                            SearchResults(id: "123123", title: "Foundation", authorId: ["Asimov"], authorName: ["Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: 5.0, coverId: 7890714),
                                            SearchResults(id: "123124", title: "Life Of Pi", authorId: ["Asimov"], authorName: ["Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: nil, coverId: 7890714),
                                            SearchResults(id: "123124", title: "ABC", authorId: ["Asimov"], authorName: ["Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: 3.3, coverId: 7890714)
        ]
        return mockResults
    }
    
    
}

//class NetworkServiceMock: Search {
//    func openLinraryTrendingList() async -> [SearchResults] {
//        let mockResults: [SearchResults] = [SearchResults(key: "HELLO", title: "ABC", author_key: nil, author_name: nil, id_amazon: nil, id_goodreads: nil, ratings_average: nil), SearchResults(key: "123123", title: "Foundation", author_key: nil, author_name: nil, id_amazon: nil, id_goodreads: nil, ratings_average: nil), SearchResults(key: "123124", title: "Life Of Pi", author_key: nil, author_name: nil, id_amazon: nil, id_goodreads: nil, ratings_average: nil)]
//        return mockResults
//    }
//    
//    
//}
