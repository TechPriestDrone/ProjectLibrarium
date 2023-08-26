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
    
    init(searchType: SearchProtocol) {
        self.searchType = searchType
    }
        
    func findBookOpenLibrary(searchQuery: String) async {
        let searchResultsUnfiltered = await searchType.findBookOpenLibrary(searchQuery: searchQuery)
        let searchResultsFilter1 = searchResultsUnfiltered.filter { $0.averageRating != nil }
        let searchResultsFilter2 = searchResultsFilter1.filter { $0.title.lowercased() == userSearchQuery.lowercased() }
        searchResults = searchResultsFilter2
        // should add a filter? makes it case spell error sensitive but returns more focused results.
        // for some reason chaining filters doesn't work on the results.
        // searchResults = searchResultsUnfiltered.filter { $0.ratings_average != nil }
    }
    
    func fetchOpenLibraryTrendingList() async {
        openLibraryTrending = await searchType.openLibraryTrendingList()
    }
    
}



