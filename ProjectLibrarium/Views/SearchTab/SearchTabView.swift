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
                    Image("SearchingFox")
                        .resizable()
                        .scaledToFit()
                } else {
                    ScrollView{
                        VStack{
                            Button {
                                Task{
                                    await librariumViewModel.findBookOpenLibrary(searchQuery: librariumViewModel.userSearchQuery.replacingOccurrences(of: " ", with: "+"))
                                    //                            print(librariumViewModel.searchResults)
                                    //                            print(librariumViewModel.userSearchQuerry)
                                    //                            let test = librariumViewModel.searchResults.map{ $0.title.lowercased() == librariumViewModel.userSearchQuerry.lowercased() }
                                    //                            print(test)
                                    // trying to filter out excessive results.
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

struct SearchTabView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTabView(librariumViewModel: LibrariumViewModel(searchType: SearchServicesMock()))
    }
}
