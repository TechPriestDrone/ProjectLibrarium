//
//  SearchService.swift
//  ProjectLibrarium
//
//  Created by ios5 on 21/08/2023.
//

import Foundation

protocol Search {
    func findBookOpenLibrary(searchQuerry: String) async -> [SearchResults]
    func openLinraryTrendingList() async -> [SearchResults]
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
    
    func openLinraryTrendingList() async -> [SearchResults] {
         let url = URL(string: "https://openlibrary.org/trending/daily.json?")!
         let request = URLRequest(url: url)
         do {
             let (data, response) = try await URLSession.shared.data(for: request)
             if (response as? HTTPURLResponse)?.statusCode == 200 {
                 let openLibraryTrendingResonse = try JSONDecoder().decode(OpenLibraryTrendingResponse.self, from: data)
                 let slicedResponse = Array(openLibraryTrendingResonse.works.prefix(15))
                 return slicedResponse
     //            print(openLibraryResonse)
             }
         } catch {
             print(error)
         }
         return []
     }
    
}

