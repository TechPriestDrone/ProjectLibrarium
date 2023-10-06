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
        if viewModel.isLoadingMainScreen {
            TabView {
                TrendingView(librariumViewModel: viewModel)
                    .tabItem {
                        Text("Discover")
                        Image(systemName: "book")
                    }
                SearchTabView(librariumViewModel: viewModel)
                    .tabItem {
                        Text("Search")
                        Image(systemName: "doc.text.magnifyingglass")
                    }
                    .background {
                        Color("PageColor")
                            .ignoresSafeArea()
                    }
                ReadBooksView(librariumViewModel: viewModel)
                    .tabItem {
                        Text("My Shelf")
                        Image(systemName: "books.vertical")
                    }
                    .background {
                        Color("PageColor")
                            .ignoresSafeArea()
                    }
            }
            .background {
                Color("PageColor")
                    .ignoresSafeArea()
            }
        } else {
            LoadingSplashView(librariumViewModel: viewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LibrariumMainView(viewModel: LibrariumViewModel(searchService: SearchServicesMock()))
    }
}
