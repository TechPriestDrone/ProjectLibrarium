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
            VStack{
                Button {
                    Task{
                        await findBookOpenLibrary(searchQuerry: librariumViewModel.userSearchQuerry)
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
            }
        }
    }
}

struct SearchTabView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTabView(librariumViewModel: LibrariumViewModel())
    }
}
