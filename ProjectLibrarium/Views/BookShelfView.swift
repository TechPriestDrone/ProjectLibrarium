//
//  BookShelfView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 20/08/2023.
//

import SwiftUI

struct BookShelfView: View {
    
    @StateObject var librariumViewModel: LibrariumViewModel
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
//        GridItem(.flexible()),

    ]
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Trending Books")
                Spacer()
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(librariumViewModel.openLibraryTrending){ book in
                        BookOnShelfView(bookTitle: book.title)
                    }
                }
                .padding()
            }
            .padding()
            .navigationTitle(Text("LIBRARIUM"))
            .navigationBarTitleDisplayMode(.inline)
        }.task {
            await librariumViewModel.fetchOpenLibraryTrendingList()
        }
    }
}

struct BookShelfView_Previews: PreviewProvider {
    static var previews: some View {
        BookShelfView(librariumViewModel: LibrariumViewModel(searchType: SearchServicesMock()))
    }
}
