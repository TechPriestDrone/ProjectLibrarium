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
                            await librariumViewModel.findBookOpenLibrary(searchQuerry: librariumViewModel.userSearchQuerry)
                            print(librariumViewModel.searchResults)
                            print(librariumViewModel.userSearchQuerry)
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
                        Text(book.title)
                        if let rating = book.ratings_average {
                            Text("\(rating)")
                        }
                    }
//                    ForEach(librariumViewModel.recomended, id: \.self) { book in
//                        Text(book)
//                    }
                    Text("AAAA")
                }
            }
        }
    }
}

struct SearchTabView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTabView(librariumViewModel: LibrariumViewModel())
    }
}
