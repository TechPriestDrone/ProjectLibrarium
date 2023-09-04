//
//  SearchTabView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 21/08/2023.
//

import SwiftUI

struct SearchTabView: View {
    @StateObject var librariumViewModel: LibrariumViewModel
    var body: some View {
            NavigationView{
                if librariumViewModel.isLoadingSearchingBooks == true {
                    VStack{
                        Text("I know I had it here somwhere")
                        Image("SearchingFox")
                            .resizable()
                            .scaledToFit()
                    }
                    .font(Constants.appFont)
                } else {
                    ScrollView{
                        VStack{
                            Button {
                                Task{
                                    librariumViewModel.bookSearchIsEmpty = false
                                    await librariumViewModel.findBookOpenLibrary(searchQuery: librariumViewModel.userSearchQuery.replacingOccurrences(of: " ", with: "+"))
                                }
                            } label: {
                                ZStack{
                                    Image(systemName: "bookmark")
                                        .resizable()
                                        .frame(width: 50, height: 80)
                                    Text("Find")
                                        .searchable(text: $librariumViewModel.userSearchQuery, prompt: "Search Book Title")
                                }
                            }
                            Spacer()
                            if librariumViewModel.bookSearchIsEmpty == true {
                                VStack{
                                    Text("Something is wrong")
                                    Image("CheckSpelling")
                                        .resizable()
                                        .scaledToFit()
                                    Text("Check your spelling")
                                }
                                .font(Constants.appFont)
                            } else {
                                ForEach(librariumViewModel.searchResults) { book in
                                    NavigationLink {
                                        InspectBookView(librariumViewModel: librariumViewModel, book: book)
                                    } label: {
                                        Text("\(book.title)")
                                    }
                                    SearchResultsView(book: book)
                                }
                            }
                        }
                    }
                }
            }
    }
}

struct SearchTabView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTabView(librariumViewModel: LibrariumViewModel(searchType: SearchServicesMock()))
    }
}
