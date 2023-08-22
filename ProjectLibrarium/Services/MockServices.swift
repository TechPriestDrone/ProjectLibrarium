//
//  MockServices.swift
//  ProjectLibrarium
//
//  Created by ios5 on 22/08/2023.
//

import Foundation

class SearchServicesMock: Search {
    func findBookOpenLibrary(searchQuerry: String) async -> [SearchResults] {
        let mockResults: [SearchResults] = [SearchResults(key: "HELLO", title: "ABC", author_key: ["ASDF"], author_name: ["ASSSD"], id_amazon: ["asss"], id_goodreads: ["ssdsd"], ratings_average: 3.1), SearchResults(key: "123123", title: "Foundation", author_key: ["Asimov"], author_name: ["Asimov"], id_amazon: ["someID"], id_goodreads: ["someID"], ratings_average: 5.0)]
        return mockResults.filter{ $0.title.lowercased().hasPrefix(searchQuerry.lowercased()) }
    }
    
    
}
