//
//  LibrariumViewModel.swift
//  ProjectLibrarium
//
//  Created by ios5 on 20/08/2023.
//

import Foundation
import SwiftUI

@MainActor
class LibrariumViewModel: ObservableObject{
    var searchServiceProtocol: SearchServiceProtocol
    @Published var userSearchQuery: String = ""
    @Published var singleBookDetails: OpenLibrarySingleWorkResponse = .empty
    @Published var searchResults: [SearchResults] = []
    @Published var openLibraryTrending: [SearchResults] = []
    @Published var readBookList: [ReadBooksModel] = []
    @Published var showSheetBookInspect: Bool = false
    @Published var isLoadingTrending: Bool = false
    @Published var isLoadingSearchingBooks: Bool = false
    @Published var isLoadingMainScreen: Bool = false
    @Published var bookSearchIsEmpty: Bool = false
    @Published var readBookAlreadyPresentAlert: Bool = false
    
    init(searchType: SearchServiceProtocol) {
        self.searchServiceProtocol = searchType
    }
        
    func findBookOpenLibrary(searchQuery: String) async {
        isLoadingSearchingBooks = true
        let searchResultsUnfiltered = await searchServiceProtocol.findBookOpenLibrary(searchQuery: searchQuery)
        let searchResultsFilter1 = searchResultsUnfiltered.filter { $0.averageRating != nil && $0.coverId != nil }
        let searchResultsFilter2 = searchResultsFilter1.filter { $0.title.lowercased().contains(userSearchQuery.lowercased())}
        searchResults = searchResultsFilter2
        if searchResults.isEmpty == true {
            bookSearchIsEmpty = true
        }
        isLoadingSearchingBooks = false
    }
    
    func fetchOpenLibraryTrendingList() async {
        isLoadingTrending = true
        if openLibraryTrending.isEmpty == true {
            openLibraryTrending = await searchServiceProtocol.openLibraryTrendingList()
        }
        isLoadingTrending = false
    }
    
    func fetchBookDetailsFromOpenLibrary(bookId: String) async {
        singleBookDetails = await searchServiceProtocol.openLibrarySingleBook(openLibraryKey: bookId)
        print(bookId)
    }
    
    func saveLocaly() {
        let encoder = JSONEncoder()
        let encodedBookList = try? encoder.encode(readBookList)
        UserDefaults.standard.set(encodedBookList, forKey: "ReadBooks")
    }
    
    func addtoReadBooks(bookToAdd: ReadBooksModel) {
        guard readBookList.contains(where: { book in
            book.bookInfo.id == bookToAdd.bookInfo.id
        }) else {
            readBookList.append(bookToAdd)
            saveLocaly()
            return
        }
        readBookAlreadyPresentAlert = true
        print(readBookAlreadyPresentAlert)
    }
    
    func getReadBook(){
        if let encodedBookList = UserDefaults.standard.value(forKey: "ReadBooks") as? Data {
            let decoder = JSONDecoder()
            if let decodedBookList = try? decoder.decode(Array.self, from: encodedBookList) as [ReadBooksModel] {
                readBookList = decodedBookList
            }
        }
    }
    
    func addBookToFavorites(bookId: String ) {
        if let indexOfBookInArray = readBookList.firstIndex(where: {$0.bookInfo.id == bookId}) {
            let favoriteBook = readBookList.remove(at: indexOfBookInArray)
            readBookList.insert(favoriteBook, at: 0)
            readBookList[0].favorite = true
            saveLocaly()
        }
    }
    
    func removeFromFavorites(bookId: String) {
        if let indexOfBookInArray = readBookList.firstIndex(where: {$0.bookInfo.id == bookId}) {
            readBookList[indexOfBookInArray].favorite = false
            let favoriteBook = readBookList.remove(at: indexOfBookInArray)
            readBookList.append(favoriteBook)
            saveLocaly()
        }
    }
    
    func removeFromReadBook(bookId: String){
        readBookList = readBookList.filter({$0.bookInfo.id != bookId})
        saveLocaly()
    }
    
}

struct ReadBook {
    let title: String
}

struct Constants {
    static func filterForSheet(book: ReadBooksModel, array: [ReadBooksModel]) -> ReadBooksModel? {
        return array.filter({ $0.bookInfo.id == book.bookInfo.id}).first
    }
    static let appFont: Font = .custom("MarkerFelt-Wide", size: 20)
}


