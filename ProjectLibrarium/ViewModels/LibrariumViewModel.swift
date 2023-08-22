//
//  LibrariumViewModel.swift
//  ProjectLibrarium
//
//  Created by ios5 on 20/08/2023.
//

import Foundation
@MainActor
class LibrariumViewModel: ObservableObject{
    var searchType: Search
    @Published var userSearchQuerry: String = ""
    @Published var searchResults: [SearchResults] = []
    @Published var recomended: [String] = ["abc", "cbe", "sdafgsdf","abc2", "cb1e", "aasddff","abcs", "fcbe", "dsfvf","abcf", "cbew", "UwUsd","abc65", "c234be", "U3w"]
    
    init(searchType: Search) {
        self.searchType = searchType
    }
    
//    func findBookOpenLibrary(searchQuerry: String) async {
////        print("https://openlibrary.org/search.json?q=\(searchQuerry)")
//        let url = URL(string: "https://openlibrary.org/search.json?q=\(searchQuerry)")!
//        let request = URLRequest(url: url)
//        do {
//            let (data, response) = try await URLSession.shared.data(for: request)
//            if (response as? HTTPURLResponse)?.statusCode == 200 {
//                let openLibraryResonse = try JSONDecoder().decode(OpenLibraryResponse.self, from: data)
////                searchResults = openLibraryResonse.docs
//                searchResults = openLibraryResonse.docs
//    //            print(openLibraryResonse)
//            }
//
//        } catch {
//            print(error)
//        }
//    }
    
    func findBookOpenLibrary(searchQuerry: String) async {
        let searchResultsUnfiltered = await searchType.findBookOpenLibrary(searchQuerry: searchQuerry)
        searchResults = searchResultsUnfiltered.filter { $0.ratings_average != nil }
    }
    
}



