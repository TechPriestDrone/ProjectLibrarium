//
//  BookShelfView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 29/08/2023.
//

import SwiftUI

struct BookShelfView: View {
    let listOfBooks: [SearchResults]
    let titleOfPage: String
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Text("\(titleOfPage)")
                LazyVGrid(columns: columns, spacing: 3) {
                    ForEach(listOfBooks){ book in
                        BookOnShelfView(bookTitle: book.title, isFavorite: nil)
                    }
                }
//                .background(.brown)
                .background(BackgroundBrown())
                .padding()
                .padding(.vertical, -4)
                .border(.brown, width: 12)
//                .frame(height:550)
                VStack{
                    Text("Didn't find anything you like?")
                    Text("Check in tomorrow")
                }
                    .multilineTextAlignment(.center)
                    .font(Constants.appFont)
                Spacer(minLength: 100)
            }
            .padding(.horizontal, 50)
            .navigationBarTitleDisplayMode(.inline)
            .background {
                Color("PageColor")
                    .ignoresSafeArea()
            }

        }
    }
}

struct BookShelfView_Previews: PreviewProvider {
    static var previews: some View {
        BookShelfView(listOfBooks: [SearchResults(id: "HELLO", title: "ABC", authorId: ["ASDF"], authorName: ["ASSSD"], amazonId: ["asss"], goodreadsId: ["ssdsd"], averageRating: 3.1, coverId: 7890714),
                                    SearchResults(id: "123123", title: "Foundation", authorId: ["Asimov"], authorName: ["Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: 5.0, coverId: 7890714),
                                    SearchResults(id: "123124", title: "Life Of Pi", authorId: ["Asimov"], authorName: ["Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: nil, coverId: 7890714),
                                    SearchResults(id: "123125", title: "ABC", authorId: ["Asimov"], authorName: ["Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: 3.3, coverId: 7890714), SearchResults(id: "123127", title: "ABC", authorId: ["Asimov"], authorName: ["Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: 3.3, coverId: 7890714),SearchResults(id: "123129", title: "ABC", authorId: ["Asimov"], authorName: ["Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: 3.3, coverId: 7890714),SearchResults(id: "1231212", title: "ABC", authorId: ["Asimov"], authorName: ["Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: 3.3, coverId: 7890714),SearchResults(id: "1231245", title: "ABC", authorId: ["Asimov"], authorName: ["Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: 3.3, coverId: 7890714),SearchResults(id: "1231247", title: "ABC", authorId: ["Asimov"], authorName: ["Asimov"], amazonId: ["someID"], goodreadsId: ["someID"], averageRating: 3.3, coverId: 7890714),
], titleOfPage: "Test")
    }
}
