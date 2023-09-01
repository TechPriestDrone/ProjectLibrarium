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
    
    var body: some View {
        VStack{
//            if isFavorite == true {
//                Image(systemName: "rosette")
//            }
//            ZStack{
//                Rectangle()
//                    .foregroundColor(.white)
//                    .frame(width: 100, height: 200)
//                    .border(.black, width: 3)
//                    .padding(.bottom, 0)
//                    .padding(.horizontal, 5)
//                VStack{
//                    if isFavorite == true {
//                        Image(systemName: "rosette")
//                    }
//                    Text("    ")
//                    Text("    ")
//                    Text("    ")
//                    Text("    ")
//                    Text(bookTitle)
//                        .rotationEffect(.degrees(90))
//                }
//            }
            ZStack{
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 100, height: 200)
                    .border(.black, width: 3)
                    .padding(.bottom, 0)
                    .padding(.horizontal, 5)
                VStack{
                    if isFavorite == true {
                        Image(systemName: "rosette")
                    }
                    ZStack{
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 94, height: 169)
                        Text(bookTitle)
                            .rotationEffect(.degrees(90))
                    }
                }
            }
        }
    }
}

struct BookOnShelfView_Previews: PreviewProvider {
    static var previews: some View {
        BookOnShelfView(bookTitle: "Foundation", isFavorite: true)
    }
}
