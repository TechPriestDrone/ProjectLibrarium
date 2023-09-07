//
//  BookOnShelfView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 20/08/2023.
//

import SwiftUI

struct BookOnShelfView: View {
    let bookTitle: String
    let isFavorite: Bool?
    let widthOfBook: CGFloat = 90
    let heightOfBook: CGFloat = 180
    
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: widthOfBook, height: heightOfBook)
                    .border(.black, width: 3)
//                    .padding(.horizontal, 0)
                VStack{
                    if isFavorite == true {
                        Image(systemName: "rosette")
                    }
                    ZStack{
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: (widthOfBook - 6), height: (heightOfBook - 40))
                        Text(bookTitle)
                            .rotationEffect(.degrees(90))
                            .font(.system(size: 15))
                    }
                }
            }
        }
    }
}

struct BookOnShelfView_Previews: PreviewProvider {
    static var previews: some View {
        BookOnShelfView(bookTitle: "Control your mind and master your feelings", isFavorite: true)
    }
}
