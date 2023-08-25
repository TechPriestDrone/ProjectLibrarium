//
//  BookOnShelfView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 20/08/2023.
//

import SwiftUI

struct BookOnShelfView: View {
    let bookTitle: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 100, height: 200)
                .border(.black, width: 3)
                .padding(.bottom, 0)
                .padding(.horizontal, 5)
            Text(bookTitle)
                .rotationEffect(.degrees(90))
        }
    }
}

struct BookOnShelfView_Previews: PreviewProvider {
    static var previews: some View {
        BookOnShelfView(bookTitle: "Foundation")
    }
}
