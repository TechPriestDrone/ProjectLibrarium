//
//  SingleTrendingBookView.swift
//  FoxBooksBox
//
//  Created by Andrey Safronov on 08/10/2023.
//

import SwiftUI
import NukeUI

struct SingleTrendingBookView: View {
    
    let coverId: Int
    var body: some View {
        LazyImage(url: URL(string: "https://covers.openlibrary.org/b/id/\(coverId)-M.jpg")) { state in
            if let image = state.image {
                image
                    .resizable()
                    .frame(width: 120 , height: 190)
            } else if state.error != nil {
                VStack{
                    Text("Didnt find the cover\nI will draw one")
                        .font(Constants.appFont)
                        .multilineTextAlignment(.center)
                    Image("NoCover")
                        .resizable()
                        .scaledToFill()
                }
            } else {
                Image("NoCover")
                    .resizable()
                    .frame(width: 130 , height: 200)
                Text("Working on the cover")
                    .font(Constants.appFont)
                    .frame(width: 130 , height: 200,alignment: .bottom)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.orange)
            }
        }
    }
}

#Preview {
    SingleTrendingBookView(coverId: 8315603)
}
