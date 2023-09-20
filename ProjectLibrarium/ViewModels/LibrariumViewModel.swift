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
    @Published var readBookList: [ReadBooksModel] = [ReadBooksModel(bookInfo: SearchResults(id: "/works/OL679357W", title: "Smoke and Mirrors", authorId: Optional(["OL53305A", "OL3060816A", "OL81831A", "OL3027409A", "OL1452221A", "OL7752487A", "OL19593A", "OL92947A"]), authorName: Optional(["Neil Gaiman", "Richard Chizmar", "William Peter Blatty", "Kealan Patrick Burke", "Brian Keene", "Joe Hill", "Joe R. Lansdale", "Ray Garton"]), amazonId: nil, goodreadsId: Optional(["505060", "219543", "1116806", "1063555", "531127", "16790", "1084196", "92065", "597623", "1358538"]), averageRating: Optional(3.8333333), coverId: Optional(6754762)), bookDetails: OpenLibrarySingleWorkResponse(title: "Smoke and Mirrors", description: "\"En las manos maestras de Neil Gaiman, la magia es mucho más que un mero juego de engaños. La destreza y el poder de invención de este gran fabulador transforman el entorno cotidiano en un mundo hechizado por sucesos sombríos y extraños, en el que una anciana puede comprar el Santo Grial en una tienda de segunda mano, unos asesinos se anuncian en los clasificados de un periódico bajo la rúbrica ±CONTROL DE PLAGAS¬, o un muchacho asustado debe negociar con un trol malcarado y mezquino que vive bajo un puente ferroviario. Esta recopilación de treinta relatos, poemas narrativos y piezas breves e inclasificables ofrece múltiples y variadas posibilidades para que el lector explore una realidad transformada, astutamente velada por el humo y las sombras, a la vez que tangible y afilada. Todo parece posible en el universo de Gaiman, el gran maestro prestidigitador que despierta los sentidos, cautiva los sueños y mantiene en vilo nuestra mente.\"--", covers: ([6754762, 1322404, 3202686, 8541928, -1, 10942075, 10201771])), favorite: true, userReview: nil), ReadBooksModel(bookInfo: SearchResults(id: "/works/OL46125W", title: "Foundation", authorId: Optional(["OL34221A"]), authorName: Optional(["Isaac Asimov"]), amazonId: Optional(["B0027ISZIM", "B07M6NR1G1", "2724222490"]), goodreadsId: Optional(["294477", "3129794", "2767978", "53690", "122363", "3901317", "58123", "651644", "837194", "1706324", "1368369", "2250967", "1002096", "427235", "1706321", "1706323", "1706320", "414853", "1706322", "29579", "76680", "2460583", "583219", "332040", "920239", "66852", "2460570", "53695", "53687"]), averageRating: (4.105991), coverId: Optional(6501822)), bookDetails: OpenLibrarySingleWorkResponse(title: "Foundation", description: "One of the great masterworks of science fiction, the Foundation novels of Isaac Asimov are unsurpassed for their unique blend of nonstop action, daring ideas, and extensive world-building. \r\n\r\nThe story of our future begins with the history of Foundation and its greatest psychohistorian: Hari Seldon.  For twelve thousand years the Galactic Empire has ruled supreme. Now it is dying.  Only Hari Seldon, creator of the revolutionary science of psychohistory, can see into the future--a dark age of ignorance, barbarism, and warfare that will last thirty thousand years. To preserve knowledge and save mankind, Seldon gathers the best minds in the Empire--both scientists and scholars--and brings them to a bleak planet at the edge of the Galaxy to serve as a beacon of hope for future generations. He calls his sanctuary the Foundation.\r\n\r\nBut soon the fledgling Foundation finds itself at the mercy of corrupt warlords rising in the wake of the receding Empire. And mankind\'s last best hope is faced with an agonizing choice: submit to the barbarians and live as slaves--or take a stand for freedom and risk total destruction.", covers: ([6501822, -1, 13811470])), favorite: false, userReview: nil), ProjectLibrarium.ReadBooksModel(bookInfo: SearchResults(id: "/works/OL46224W", title: "Foundation and Empire", authorId: Optional(["OL34221A"]), authorName: (["Isaac Asimov"]), amazonId: (["B002JJ8D3G", "B002C1BT1O", "B001O82GIQ", "B000OC0AXG", "B000O5SMYC", "B000HZ7YV6", "B002DPQGFS", "B0020NAXCA", "B002JJ7XFU", "B06WWPRTW4", "0553382586"]), goodreadsId: Optional(["402043", "3129796", "53697", "53685", "122365", "2460586", "1706325", "1523104", "837178", "66849", "2126625", "53694", "1513691", "1706326", "651641", "63706", "2066629", "414854", "29581", "1408090", "1354178", "2460561", "837235", "76682"]), averageRating: Optional(4.074766), coverId: Optional(9300695)), bookDetails: OpenLibrarySingleWorkResponse(title: "Foundation and Empire", description: "Led by its founding father, the great psychohistorian Hari Seldon, and taking advantage of its superior science and technology, the Foundation has survived the greed and barbarism of its neighboring warrior-planets. Yet now it must face the Empire still the mightiest force in the Galaxy even in its death throes. When an ambitious general determined to restore the Empire\'s glory turns the vast Imperial fleet toward the Foundation, the only hope for the small planet of scholars and scientists lies in the prophecies of Hari Seldon.", covers: ([9300695, 10196561, 10942331, 10942345, 9306443, 10131360, 10201023, 10230437, 12227175, 12277290, 13811488])), favorite: false, userReview: nil), ProjectLibrarium.ReadBooksModel(bookInfo: ProjectLibrarium.SearchResults(id: "/works/OL46309W", title: "Second Foundation", authorId: Optional(["OL34221A", "OL12632633A"]), authorName: Optional(["Isaac Asimov", "Kim Ok-su"]), amazonId: Optional(["B0041SO6Z2", "B0886DXR6M", "B0007E5UMW", "B000MEA3GU", "B000FH89LA", "B01LSQ9DS4", "B002C14FMY"]), goodreadsId: Optional(["837189", "66853", "2380804", "122364", "697246", "63708", "583216", "341680", "2460571", "58153", "2460573", "414855", "651640", "341679", "66851", "1360360", "2460576", "2460575", "861140", "837236", "626781", "29580", "920246", "2460587"]), averageRating: (4.300971), coverId: Optional(12991841)), bookDetails: OpenLibrarySingleWorkResponse(title: "Second Foundation", description: "After years of struggle, the Foundation lay in ruins -- destroyed by the mutant mind power of the Mule. But it was rumored that there was a Second Foundation hidden somewhere at the end of the Galaxy, established to preserve the knowledge of mankind through the long centuries of barbarism. The Mule had failed to find it the first time -- but now he was certain he knew where it lay.\r\n\r\nThe fate of the Foundation rests on young Arkady Darell, only fourteen years old and burdened with a terrible secret. As its scientists girded for a final showdown with the Mule, the survivors of the First Foundation began their desperate search. They too wanted the Second Foundation destroyed... before it destroyed them.", covers: ([12991841, 9261324, 10942399, 10641306, 12277294, 13811505])), favorite: false, userReview: nil)]
    @Published var sortedByAuthorBookList: [SortedByAuthort] = [ProjectLibrarium.SortedByAuthort(author: "Neil Gaiman", works: [ProjectLibrarium.ReadBooksModel(bookInfo: ProjectLibrarium.SearchResults(id: "/works/OL679357W", title: "Smoke and Mirrors", authorId: Optional(["OL53305A", "OL3060816A", "OL81831A", "OL3027409A", "OL1452221A", "OL7752487A", "OL19593A", "OL92947A"]), authorName: Optional(["Neil Gaiman", "Richard Chizmar", "William Peter Blatty", "Kealan Patrick Burke", "Brian Keene", "Joe Hill", "Joe R. Lansdale", "Ray Garton"]), amazonId: nil, goodreadsId: Optional(["505060", "219543", "1116806", "1063555", "531127", "16790", "1084196", "92065", "597623", "1358538"]), averageRating: Optional(3.8333333), coverId: Optional(6754762)), bookDetails: ProjectLibrarium.OpenLibrarySingleWorkResponse(title: "Smoke and Mirrors", description: "\"En las manos maestras de Neil Gaiman, la magia es mucho más que un mero juego de engaños. La destreza y el poder de invención de este gran fabulador transforman el entorno cotidiano en un mundo hechizado por sucesos sombríos y extraños, en el que una anciana puede comprar el Santo Grial en una tienda de segunda mano, unos asesinos se anuncian en los clasificados de un periódico bajo la rúbrica ±CONTROL DE PLAGAS¬, o un muchacho asustado debe negociar con un trol malcarado y mezquino que vive bajo un puente ferroviario. Esta recopilación de treinta relatos, poemas narrativos y piezas breves e inclasificables ofrece múltiples y variadas posibilidades para que el lector explore una realidad transformada, astutamente velada por el humo y las sombras, a la vez que tangible y afilada. Todo parece posible en el universo de Gaiman, el gran maestro prestidigitador que despierta los sentidos, cautiva los sueños y mantiene en vilo nuestra mente.\"--", covers: ([6754762, 1322404, 3202686, 8541928, -1, 10942075, 10201771])), favorite: true, userReview: nil)]), ProjectLibrarium.SortedByAuthort(author: "Isaac Asimov", works: [ProjectLibrarium.ReadBooksModel(bookInfo: ProjectLibrarium.SearchResults(id: "/works/OL46125W", title: "Foundation", authorId: Optional(["OL34221A"]), authorName: Optional(["Isaac Asimov"]), amazonId: Optional(["B0027ISZIM", "B07M6NR1G1", "2724222490"]), goodreadsId: Optional(["294477", "3129794", "2767978", "53690", "122363", "3901317", "58123", "651644", "837194", "1706324", "1368369", "2250967", "1002096", "427235", "1706321", "1706323", "1706320", "414853", "1706322", "29579", "76680", "2460583", "583219", "332040", "920239", "66852", "2460570", "53695", "53687"]), averageRating: Optional(4.105991), coverId: Optional(6501822)), bookDetails: ProjectLibrarium.OpenLibrarySingleWorkResponse(title: "Foundation", description: "One of the great masterworks of science fiction, the Foundation novels of Isaac Asimov are unsurpassed for their unique blend of nonstop action, daring ideas, and extensive world-building. \r\n\r\nThe story of our future begins with the history of Foundation and its greatest psychohistorian: Hari Seldon.  For twelve thousand years the Galactic Empire has ruled supreme. Now it is dying.  Only Hari Seldon, creator of the revolutionary science of psychohistory, can see into the future--a dark age of ignorance, barbarism, and warfare that will last thirty thousand years. To preserve knowledge and save mankind, Seldon gathers the best minds in the Empire--both scientists and scholars--and brings them to a bleak planet at the edge of the Galaxy to serve as a beacon of hope for future generations. He calls his sanctuary the Foundation.\r\n\r\nBut soon the fledgling Foundation finds itself at the mercy of corrupt warlords rising in the wake of the receding Empire. And mankind\'s last best hope is faced with an agonizing choice: submit to the barbarians and live as slaves--or take a stand for freedom and risk total destruction.", covers: ([6501822, -1, 13811470])), favorite: false, userReview: nil), ProjectLibrarium.ReadBooksModel(bookInfo: ProjectLibrarium.SearchResults(id: "/works/OL46224W", title: "Foundation and Empire", authorId: Optional(["OL34221A"]), authorName: Optional(["Isaac Asimov"]), amazonId: Optional(["B002JJ8D3G", "B002C1BT1O", "B001O82GIQ", "B000OC0AXG", "B000O5SMYC", "B000HZ7YV6", "B002DPQGFS", "B0020NAXCA", "B002JJ7XFU", "B06WWPRTW4", "0553382586"]), goodreadsId: Optional(["402043", "3129796", "53697", "53685", "122365", "2460586", "1706325", "1523104", "837178", "66849", "2126625", "53694", "1513691", "1706326", "651641", "63706", "2066629", "414854", "29581", "1408090", "1354178", "2460561", "837235", "76682"]), averageRating: Optional(4.074766), coverId: Optional(9300695)), bookDetails: ProjectLibrarium.OpenLibrarySingleWorkResponse(title: "Foundation and Empire", description: "Led by its founding father, the great psychohistorian Hari Seldon, and taking advantage of its superior science and technology, the Foundation has survived the greed and barbarism of its neighboring warrior-planets. Yet now it must face the Empire still the mightiest force in the Galaxy even in its death throes. When an ambitious general determined to restore the Empire\'s glory turns the vast Imperial fleet toward the Foundation, the only hope for the small planet of scholars and scientists lies in the prophecies of Hari Seldon.", covers:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ([9300695, 10196561, 10942331, 10942345, 9306443, 10131360, 10201023, 10230437, 12227175, 12277290, 13811488])), favorite: false, userReview: nil), ProjectLibrarium.ReadBooksModel(bookInfo: ProjectLibrarium.SearchResults(id: "/works/OL46309W", title: "Second Foundation", authorId: Optional(["OL34221A", "OL12632633A"]), authorName: Optional(["Isaac Asimov", "Kim Ok-su"]), amazonId: Optional(["B0041SO6Z2", "B0886DXR6M", "B0007E5UMW", "B000MEA3GU", "B000FH89LA", "B01LSQ9DS4", "B002C14FMY"]), goodreadsId: Optional(["837189", "66853", "2380804", "122364", "697246", "63708", "583216", "341680", "2460571", "58153", "2460573", "414855", "651640", "341679", "66851", "1360360", "2460576", "2460575", "861140", "837236", "626781", "29580", "920246", "2460587"]), averageRating: Optional(4.300971), coverId: Optional(12991841)), bookDetails: ProjectLibrarium.OpenLibrarySingleWorkResponse(title: "Second Foundation", description: "After years of struggle, the Foundation lay in ruins -- destroyed by the mutant mind power of the Mule. But it was rumored that there was a Second Foundation hidden somewhere at the end of the Galaxy, established to preserve the knowledge of mankind through the long centuries of barbarism. The Mule had failed to find it the first time -- but now he was certain he knew where it lay.\r\n\r\nThe fate of the Foundation rests on young Arkady Darell, only fourteen years old and burdened with a terrible secret. As its scientists girded for a final showdown with the Mule, the survivors of the First Foundation began their desperate search. They too wanted the Second Foundation destroyed... before it destroyed them.", covers: ([12991841, 9261324, 10942399, 10641306, 12277294, 13811505])), favorite: false, userReview: nil)])]

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
    
    init(searchType: SearchServiceProtocol) {
        self.searchServiceProtocol = searchType
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


