//
//  LibrariumViewModel.swift
//  ProjectLibrarium
//
//  Created by ios5 on 20/08/2023.
//

import Foundation
@MainActor
class LibrariumViewModel: ObservableObject{
    @Published var userSearchQuerry: String = ""
    @Published var searchResults: [SearchResults] = []
//    @Published var searchResults: [SearchResults] = [SearchResults(key: "HELLO", title: "ABC", author_key: ["ASDF"], author_name: ["ASSSD"], id_amazon: ["asss"], id_goodreads: ["ssdsd"], ratings_average: 3.1)]
    @Published var recomended: [String] = ["abc", "cbe", "UwU","abc2", "cb1e", "Uw4U","abcs", "fcbe", "aUwU","abcf", "cbew", "UwUsd","abc65", "c234be", "U3wU"]
    
    func findBookOpenLibrary(searchQuerry: String) async {
        print("https://openlibrary.org/search.json?q=\(searchQuerry)")
        let url = URL(string: "https://openlibrary.org/search.json?q=\(searchQuerry)")!
        let request = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            if (response as? HTTPURLResponse)?.statusCode == 200 {
                let openLibraryResonse = try JSONDecoder().decode(OpenLibraryResponse.self, from: data)
                searchResults = openLibraryResonse.docs
    //            print(openLibraryResonse)
            }
            
        } catch {
            print(error)
        }
    }
    
}



