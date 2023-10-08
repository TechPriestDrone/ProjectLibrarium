//
//  BookShelfView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 20/08/2023.
//

import SwiftUI

struct TrendingView: View {
    
    @StateObject var librariumViewModel: LibrariumViewModel
    
    var body: some View {
        NavigationView{
            if librariumViewModel.isLoadingTrending == true {
                VStack{
                    Text("Fetching you some trending books")
                    
                    Image("CarrierFox")
                        .resizable()
                        .scaledToFit()
                }
                .font(Constants.appFont)
            } else {
                BookShelfView(listOfBooks: librariumViewModel.openLibraryTrending, titleOfPage: "Today's Trending Books")
                    .toolbar{
                        ToolbarItem(placement: .cancellationAction) {
                            Button {
                                librariumViewModel.showSheetBookInfo = true
                            } label: {
                                HStack{
                                    Image(systemName: "questionmark.circle")
                                }
                            }
                        }
                    }
                    .sheet(isPresented: $librariumViewModel.showSheetBookInfo) {
                        InfoSheetView()
                    }
            }
        }.task {
            await librariumViewModel.fetchOpenLibraryTrendingList()
            librariumViewModel.getReadBook()
        }
    }
}

struct TrendingView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingView(librariumViewModel: LibrariumViewModel(searchService: SearchServicesMock()))
    }
}

