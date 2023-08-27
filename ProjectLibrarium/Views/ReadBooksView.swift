//
//  ReadBooksView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 20/08/2023.
//

import SwiftUI
import NukeUI

struct ReadBooksView: View {
    var body: some View {
        VStack{
            Text("READ BOOKS")
            LazyImage(url: URL(string: "https://covers.openlibrary.org/b/id/7890714-M.jpg"))
        }
    }
}

struct ReadBooksView_Previews: PreviewProvider {
    static var previews: some View {
        ReadBooksView()
    }
}
