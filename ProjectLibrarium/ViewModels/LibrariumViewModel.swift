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
    @Published var userSearchQueryCheckup = ""
    @Published var sameSearchCounter = 0
    @Published var singleBookDetails: OpenLibrarySingleWorkResponse = .empty
    
    @Published var searchResults: [SearchResults] = []
    @Published var openLibraryTrending: [SearchResults] = []
    @Published var readBookList: [ReadBooksModel] = []
    @Published var sortedByAuthorBookList: [SortedByAuthort] = []

    @Published var sortBy: SortByOptions = .favorites
    
    @Published var selectedSearchType = "Book Title"
    @Published var userSelectedSearchType = SearchType.bookTitle
    
    @Published var showSheetBookInfo: Bool = false
    @Published var isLoadingTrending: Bool = false
    @Published var isLoadingSearchingBooks: Bool = false
    @Published var isLoadingMainScreen: Bool = false
    @Published var bookSearchIsEmpty: Bool = false
    @Published var readBookAlreadyPresentAlert: Bool = false
    
    enum SearchType: String {
        case bookTitle = "Book Title"
        case author = "Author"
    }
    
    enum SortByOptions {
        case bookTitle
        case authorName
        case favorites
    }
    
    init(searchService: SearchServiceProtocol) {
        self.searchServiceProtocol = searchService
    }
        
    func findBookOpenLibrary(searchQuery: String) async {
        isLoadingSearchingBooks = true
        let searchResultsUnfiltered = await searchServiceProtocol.findBookOpenLibrary(searchQuery: searchQuery)
        let searchResultsFilter1 = searchResultsUnfiltered.filter { $0.averageRating != nil && $0.coverId != nil }
        let searchResultsFilter2 = searchResultsFilter1.filter { $0.title.lowercased().contains(userSearchQuery.lowercased())}
        searchResults = searchResultsFilter2
        if searchResultsFilter2.isEmpty{
            searchResults = searchResultsFilter1
        }
        if searchResults.isEmpty == true {
            bookSearchIsEmpty = true
            userSearchQueryCheckup = searchQuery
            if userSearchQuery == userSearchQueryCheckup {
                sameSearchCounter = sameSearchCounter + 1
                isLoadingSearchingBooks = false
            }
        } else {
            userSearchQueryCheckup = ""
            sameSearchCounter = 0
            isLoadingSearchingBooks = false
        }
    }
    
    func findAuthorOpenLibrary(searchQuery: String) async {
        isLoadingSearchingBooks = true
        let searchResultsUnfiltered = await searchServiceProtocol.findAuthorOpenLibrary(searchQuery: searchQuery)
        let searchResultsFilter1 = searchResultsUnfiltered.filter { $0.averageRating != nil && $0.coverId != nil }
        searchResults = searchResultsFilter1
        if searchResults.isEmpty == true {
            bookSearchIsEmpty = true
            userSearchQueryCheckup = searchQuery
            if userSearchQuery == userSearchQueryCheckup {
                sameSearchCounter = sameSearchCounter + 1
                isLoadingSearchingBooks = false
            }
        } else {
            userSearchQueryCheckup = ""
            sameSearchCounter = 0
            isLoadingSearchingBooks = false
        }
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
                sortedByAuthorBookList = sortBooksByAuthor(passedArray: readBookList)
                sortedByAuthorBookList.sort{$0.author < $1.author}
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
    
//    func sortBooksByAuthor(passedArray: [ReadBooksModel]) -> [SortedByAuthort] {
//        var sortedArrayByAuthor: [SortedByAuthort] = []
//        for author in passedArray {
//            if passedArray.filter({$0.bookInfo.authorName == author.bookInfo.authorName}).first != nil {
//                if let index12 = sortedArrayByAuthor.firstIndex(where: {$0.author == author.bookInfo.authorName}){
//                    sortedArrayByAuthor[index12].works.append(author)
//            } else {
//                sortedArrayByAuthor.append(SortedByAuthort(author: author.bookInfo.authorName!, works: [author]))
//                }
//            }
//        }
////        sortedArrayByAuthor.sort {$0.author.first ?? "ZZZ" < $1.author.first ?? "ZZZZ"}
//        print(sortedArrayByAuthor.count)
//        return sortedArrayByAuthor
//    }
    func sortBooksByAuthor(passedArray: [ReadBooksModel]) -> [SortedByAuthort] {
        var sortedArrayByAuthor: [SortedByAuthort] = []
        for author in passedArray {
            if passedArray.filter({$0.bookInfo.authorName == author.bookInfo.authorName}).first != nil {
                if let index12 = sortedArrayByAuthor.firstIndex(where: {$0.author == author.bookInfo.authorName?.first}){
                    sortedArrayByAuthor[index12].works.append(author)
            } else {
                sortedArrayByAuthor.append(SortedByAuthort(author: author.bookInfo.authorName?.first ?? "ZXY", works: [author]))
                }
            }
        }
        return sortedArrayByAuthor
    }
}

//struct ReadBook {
//    let title: String
//}

struct Constants {
    
    static func filterForSheet(book: ReadBooksModel, array: [ReadBooksModel]) -> ReadBooksModel? {
        return array.filter({ $0.bookInfo.id == book.bookInfo.id}).first
    }
    
    static func checkIfBookIsRead(bookToCheck: SearchResults, array: [ReadBooksModel]) -> String?{
        let test = array.filter({$0.bookInfo.id == bookToCheck.id})
        if test.isEmpty == true {
            return nil
        } else {
            return "books.vertical"
        }
    }
    
//    static func sortBooksByAuthor(passedArray: [ReadBooksModel]) -> [SortedByAuthort] {
//        var sortedArrayByAuthor: [SortedByAuthort] = []
//        for author in passedArray {
//            if passedArray.filter({$0.bookInfo.authorName == author.bookInfo.authorName}).first != nil {
//                if let index12 = sortedArrayByAuthor.firstIndex(where: {$0.author == author.bookInfo.authorName}){
//                    sortedArrayByAuthor[index12].works.append(author)
//            } else {
//                sortedArrayByAuthor.append(SortedByAuthort(author: author.bookInfo.authorName!, works: [author]))
//                }
//            }
//            sortedArrayByAuthor.sort {$0.author.first ?? "ZZZ" < $1.author.first ?? "ZZZZ"}
//        }
//        return sortedArrayByAuthor
//    }
    
    static let appFont: Font = .custom("MarkerFelt-Wide", size: 20)
}


