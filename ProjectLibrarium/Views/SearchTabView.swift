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
            ScrollView{
                VStack{
                    Button {
                        Task{
                            await librariumViewModel.findBookOpenLibrary(searchQuerry: librariumViewModel.userSearchQuerry.replacingOccurrences(of: " ", with: "+"))
//                            print(librariumViewModel.searchResults)
                            print(librariumViewModel.userSearchQuerry)
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
                                .searchable(text: $librariumViewModel.userSearchQuerry, prompt: "What do you want to read")
                        }
                    }
                    
                    Spacer()
                    ForEach(librariumViewModel.searchResults, id: \.key) { book in
                        SearchResultsView(book: book)
                    }
//                    ForEach(librariumViewModel.recomended, id: \.self) { book in
//                        Text(book)
//                    }
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
