//
//  NoSuchBookExistsView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 13/09/2023.
//

import SwiftUI

struct NoSuchBookExistsView: View {
    var body: some View {
        VStack{
            Text("Im sorry I dont have it")
            Image("guiltyFox")
                .resizable()
                .scaledToFit()
            Text("Please try looking for smething else")
        }
        .font(Constants.appFont)
    }
}

struct NoSuchBookExistsView_Previews: PreviewProvider {
    static var previews: some View {
        NoSuchBookExistsView()
    }
}
