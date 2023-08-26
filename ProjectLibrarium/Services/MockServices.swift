//
//  MockServices.swift
//  ProjectLibrarium
//
//  Created by ios5 on 22/08/2023.
//

import Foundation

class SearchServicesMock: SearchProtocol {
    func openLibraryTrendingList() async -> [SearchResults] {
        let mockResults: [SearchResults] = [SearchResults(id: "HELLO", title: "ABC", authorId: nil, authorName: nil, amazonId: nil, goodreadsId: nil, averageRating: nil),
                                            SearchResults(id: "123123", title: "Foundation", authorId: nil, authorName: nil, amazonId: nil, goodreadsId: nil, averageRating: nil),
                                            SearchResults(id: "123124", title: "Life Of Pi", authorId: nil, authorName: nil, amazonId: nil, goodreadsId: nil, averageRating: nil)]
                return mockResults
    }
    
    func findBookOpenLibrary(searchQuery: String) async -> [SearchResults] {
        let mockResults: [SearchResults] = [SearchResults(id: "HELLO", title: "ABC", authorId: ["ASDF"], authorName: ["ASSSD"], amazonId: ["asss"], goodreadsId: ["ssdsd"], averageRating: 3.1),
                                            SearchResults(id: "123123", title: "Foundation", authorId: ["Asimov"], authorName: ["Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: 5.0),
                                            SearchResults(id: "123124", title: "Life Of Pi", authorId: ["Asimov"], authorName: ["Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: nil),
                                            SearchResults(id: "123124", title: "ABC", authorId: ["Asimov"], authorName: ["Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: 3.3)
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
