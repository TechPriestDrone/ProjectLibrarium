//
//  NoBooksFoundErrorView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 13/09/2023.
//

import SwiftUI

struct NoBooksFoundErrorView: View {
    var body: some View {
        VStack{
            Text("Something is wrong")
            Image("CheckSpelling")
                .resizable()
                .scaledToFit()
            Text("Check your spelling")
        }
        .font(Constants.appFont)
    }
}

struct NoBooksFoundErrorView_Previews: PreviewProvider {
    static var previews: some View {
        NoBooksFoundErrorView()
    }
}
