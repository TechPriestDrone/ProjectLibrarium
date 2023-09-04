//
//  SearchService.swift
//  ProjectLibrarium
//
//  Created by ios5 on 21/08/2023.
//

import Foundation

protocol SearchProtocol {
    func findBookOpenLibrary(searchQuery: String) async -> [SearchResults]
    func openLibraryTrendingList() async -> [SearchResults]
    func openLibrarySingleBook(openLibraryKey: String) async -> OpenLibrarySingleWorkResponse
}

class SearchServices: SearchProtocol {
    func findBookOpenLibrary(searchQuery: String) async -> [SearchResults] {
        let url = URL(string: "https://openlibrary.org/search.json?q=\(searchQuery)")!
        let request = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            if (response as? HTTPURLResponse)?.statusCode == 200 {
                let openLibraryResponse = try JSONDecoder().decode(OpenLibraryResponse.self, from: data)
                return openLibraryResponse.docs
    //            print(openLibraryResponse)
            }
        } catch {
            print(error)
        }
        return []
    }
    
    func openLibraryTrendingList() async -> [SearchResults] {
         let url = URL(string: "https://openlibrary.org/trending/daily.json?")!
         let request = URLRequest(url: url)
         do {
             let (data, response) = try await URLSession.shared.data(for: request)
             if (response as? HTTPURLResponse)?.statusCode == 200 {
                 let openLibraryTrendingResponse = try JSONDecoder().decode(OpenLibraryTrendingResponse.self, from: data)
                 let slicedResponse = Array(openLibraryTrendingResponse.works.prefix(9))
                 return slicedResponse
     //            print(openLibraryResponse)
             }
         } catch {
             print(error)
         }
         return []
     }
    
    func openLibrarySingleBook(openLibraryKey: String) async -> OpenLibrarySingleWorkResponse {
         let url = URL(string: "https://openlibrary.org/\(openLibraryKey).json?")!
         let request = URLRequest(url: url)
         do {
             let (data, response) = try await URLSession.shared.data(for: request)
             if (response as? HTTPURLResponse)?.statusCode == 200 {
                 let openLibrarySingleBookResponse = try JSONDecoder().decode(OpenLibrarySingleWorkResponse.self, from: data)
                 return openLibrarySingleBookResponse
             }
         } catch {
             print(error)
         }
         return OpenLibrarySingleWorkResponse(title: "NO BOOK", description: "NO BOOK", covers: [])
     }
    
}

