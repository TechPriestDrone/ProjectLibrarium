//
//  LibrariumViewModel.swift
//  ProjectLibrarium
//
//  Created by ios5 on 20/08/2023.
//

import Foundation
@MainActor
class LibrariumViewModel: ObservableObject{
    var searchType: SearchProtocol
    @Published var userSearchQuery: String = ""
    @Published var searchResults: [SearchResults] = []
    @Published var openLibraryTrending: [SearchResults] = []
    @Published var showSheetBookInspect: Bool = false
    @Published var singleBookDetails: OpenLibrarySingleWorkResponse = .empty
    @Published var readBookList: [ReadBooksModel] = []
    
    init(searchType: SearchProtocol) {
        self.searchType = searchType
    }
        
    func findBookOpenLibrary(searchQuery: String) async {
        let searchResultsUnfiltered = await searchType.findBookOpenLibrary(searchQuery: searchQuery)
        let searchResultsFilter1 = searchResultsUnfiltered.filter { $0.averageRating != nil && $0.coverId != nil }
        let searchResultsFilter2 = searchResultsFilter1.filter { $0.title.lowercased() == userSearchQuery.lowercased() }
        searchResults = searchResultsFilter2
        // should add a filter? makes it case spell error sensitive but returns more focused results.
        // for some reason chaining filters doesn't work on the results.
        // searchResults = searchResultsUnfiltered.filter { $0.ratings_average != nil }
    }
    
    func fetchOpenLibraryTrendingList() async {
        openLibraryTrending = await searchType.openLibraryTrendingList()
    }
    
    func fetchBookDetailsFromOpenLibrary(bookId: String) async {
        singleBookDetails = await searchType.openLibrarySingleBook(openLibraryKey: bookId)
        print(bookId)
    }
    
    func addtoReadBooks(bookToAdd: ReadBooksModel) {
        readBookList.append(bookToAdd)
        let encoder = JSONEncoder()
        let encodedBookList = try? encoder.encode(readBookList)
        UserDefaults.standard.set(encodedBookList, forKey: "ReadBooks")
    }
    
    func getReadBook(){
//        return UserDefaults.standard.object(forKey: "ReadBooks") as? [ReadBook] ?? []
        if let encodedBookList = UserDefaults.standard.value(forKey: "ReadBooks") as? Data {
            let decoder = JSONDecoder()
            if let decodedBookList = try? decoder.decode(Array.self, from: encodedBookList) as [ReadBooksModel] {
                readBookList = decodedBookList
            }
        }
//        readBookList = UserDefaults.standard.object(forKey: "ReadBooks") as? [ReadBooksModel] ?? []
    }
    
}

struct ReadBook {
    let title: String
}


