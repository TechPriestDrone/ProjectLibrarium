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
        GridItem(.flexible()),

    ]
    
    var body: some View {
        NavigationView{
            VStack{
                Button {
                    print(librariumViewModel.userSearchQuerry)
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
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(librariumViewModel.recomended, id: \.self){ book in
                        BookOnShelfView(bookTitle: book)
                    }
                    .border(.black)
                    .padding(.horizontal,0)
                }
                .border(.black, width: 10)
                .padding(.horizontal, 0)
//                HStack{
//                    Spacer()
//                    Rectangle()
//                        .frame(width: 10)
//                    Spacer(minLength: 280)
//                    Rectangle()
//                        .frame(width: 10)
//                    Spacer()
//                }
//                .padding(.vertical, 0)
            }
            .padding()
            .navigationTitle(Text("LIBRARIUM"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct BookShelfView_Previews: PreviewProvider {
    static var previews: some View {
        BookShelfView(librariumViewModel: LibrariumViewModel())
    }
}
