//
//  ContentView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 18/08/2023.
//

import SwiftUI

struct LibrariumMainView: View {
    @StateObject var viewModel: LibrariumViewModel
    var body: some View {
        TabView {
            BookShelfView(librariumViewModel: viewModel)
                .tabItem {
                    Text("Discover")
                    Image(systemName: "book")
                }
            SearchTabView(librariumViewModel: viewModel)
                .tabItem {
                    Text("Search")
                    Image(systemName: "doc.text.magnifyingglass")
                }
            ReadBooksView()
                .tabItem {
                Text("My Shelf")
                Image(systemName: "books.vertical")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LibrariumMainView(viewModel: LibrariumViewModel(searchType: SearchServicesMock()))
    }
}
