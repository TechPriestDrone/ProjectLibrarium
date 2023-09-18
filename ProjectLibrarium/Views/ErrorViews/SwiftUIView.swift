//
//  SwiftUIView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 18/09/2023.
//

import SwiftUI

struct SwiftUIView2: View {
    var mockResults: [SearchResults] = [SearchResults(id: "HELLO", title: "ABC", authorId: ["ASDF"], authorName: ["BSSSD"], amazonId: ["asss"], goodreadsId: ["ssdsd"], averageRating: 3.1, coverId: 7890714),
                                        SearchResults(id: "123123", title: "Foundation", authorId: ["Asimov"], authorName: ["Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: 5.0, coverId: 7890714),
                                        SearchResults(id: "123124", title: "Life Of Pi", authorId: ["Asimov"], authorName: ["Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: nil, coverId: 7890714),
                                        SearchResults(id: "1231243776", title: "ABzac", authorId: ["Asimov"], authorName: ["Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: 3.3, coverId: 7890714)
    ]
    @State var newArray: [SortedByAuthort] = [SortedByAuthort(author: ["ANANAS"], works: [SearchResults(id: "HELLO", title: "ABC", authorId: ["ASDF"], authorName: ["ASSSD"], amazonId: ["asss"], goodreadsId: ["ssdsd"], averageRating: 3.1, coverId: 7890714)])]
    let columns = [
        GridItem(.flexible()),

    ]
    
    var body: some View {
//        List(mockResults, id: \.id) { book in
//            var authorName = book.authorName
//                let mappedArray = mockResults.filter({$0.authorName == authorName})
//                Section {
//                    ForEach(mappedArray, id: \.id) { book in
//                        LazyVGrid(columns: columns) {
//                            Text(book.title)
//                        }
//                    }
//                } header: {
//                    Text(book.authorId?.first ?? "ANON")
//                }
//        }
//        .listStyle(.sidebar)
//        if let sortedByAuthor = mockResults.map({sortedByAuthort(author: $0.authorName, works: mockResults.filter({$0.authorName == author}))})
        VStack{
            Text("Sorted By Author")
                .task {
                    newArray = test(passedArray: mockResults)
                    newArray.sort {$0.author.first ?? "ZZZ" < $1.author.first ?? "ZZZZ"}
                }
            List(newArray, id: \.author) { book in
                Section{
                    ForEach(book.works) { result in
                        Text(result.title)
                    }
                } header: {
                    Text(book.author.first ?? "ANON")
                }
            }
            .listStyle(.sidebar)
        }
        
    }
}

struct SwiftUIView2_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView2()
    }
}

struct SortedByAuthort {
    let author: [String]
    var works: [SearchResults]
}

func test(passedArray: [SearchResults]) -> [SortedByAuthort] {
    var arrayThingy: [SortedByAuthort] = []
    for author in passedArray {
        if passedArray.filter({$0.authorName == author.authorName}).first != nil {
            if let index12 = arrayThingy.firstIndex(where: {$0.author == author.authorName}){
                arrayThingy[index12].works.append(author)
        } else {
            arrayThingy.append(SortedByAuthort(author: author.authorName!, works: [author]))
            }
        }
    }
    return arrayThingy
}
