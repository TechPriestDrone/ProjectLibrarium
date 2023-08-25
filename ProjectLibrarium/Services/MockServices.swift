//
//  MockServices.swift
//  ProjectLibrarium
//
//  Created by ios5 on 22/08/2023.
//

import Foundation

class SearchServicesMock: Search {
    func openLinraryTrendingList() async -> [SearchResults] {
                let mockResults: [SearchResults] = [SearchResults(key: "HELLO", title: "ABC", author_key: nil, author_name: nil, id_amazon: nil, id_goodreads: nil, ratings_average: nil), SearchResults(key: "123123", title: "Foundation", author_key: nil, author_name: nil, id_amazon: nil, id_goodreads: nil, ratings_average: nil), SearchResults(key: "123124", title: "Life Of Pi", author_key: nil, author_name: nil, id_amazon: nil, id_goodreads: nil, ratings_average: nil)]
                return mockResults
    }
    
    func findBookOpenLibrary(searchQuerry: String) async -> [SearchResults] {
        let mockResults: [SearchResults] = [SearchResults(key: "HELLO", title: "ABC", author_key: ["ASDF"], author_name: ["ASSSD"], id_amazon: ["asss"], id_goodreads: ["ssdsd"], ratings_average: 3.1), SearchResults(key: "123123", title: "Foundation", author_key: ["Asimov"], author_name: ["Asimov"], id_amazon: ["someID"], id_goodreads: ["someID"], ratings_average: 5.0), SearchResults(key: "123124", title: "Life Of Pi", author_key: ["Asimov"], author_name: ["Asimov"], id_amazon: ["someID"], id_goodreads: ["someID"], ratings_average: nil)]
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
