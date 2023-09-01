//
//  BookShelfView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 20/08/2023.
//

import SwiftUI

struct TrendingView: View {
    
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
            if librariumViewModel.isLoadingTrending == true {
                Image(systemName: "heart")
            }else {
                BookShelfView(listOfBooks: librariumViewModel.openLibraryTrending, titleOfPage: "Trending Books")
            }
//            VStack{
//                Text("Trending Books")
//                Spacer()
//                LazyVGrid(columns: columns, spacing: 10) {
//                    ForEach(librariumViewModel.openLibraryTrending){ book in
//                        BookOnShelfView(bookTitle: book.title)
//                    }
//                }
//                .padding()
//            }
//            .padding()
//            .navigationBarTitleDisplayMode(.inline)
        }.task {
            await librariumViewModel.fetchOpenLibraryTrendingList()
            librariumViewModel.getReadBook()
        }
    }
}

struct TrendingView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingView(librariumViewModel: LibrariumViewModel(searchType: SearchServicesMock()))
    }
}
