//
//  SearchService.swift
//  ProjectLibrarium
//
//  Created by ios5 on 21/08/2023.
//

import Foundation

protocol Search {
    func findBookOpenLibrary(searchQuerry: String) async -> [SearchResults]
}

class SearchServices: Search {
    func findBookOpenLibrary(searchQuerry: String) async -> [SearchResults] {
        let url = URL(string: "https://openlibrary.org/search.json?q=\(searchQuerry)")!
        let request = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            if (response as? HTTPURLResponse)?.statusCode == 200 {
                let openLibraryResonse = try JSONDecoder().decode(OpenLibraryResponse.self, from: data)
                return openLibraryResonse.docs
    //            print(openLibraryResonse)
            }
        } catch {
            print(error)
        }
        return []
    }
}
