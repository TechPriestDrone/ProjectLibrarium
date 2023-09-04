//
//  CoversDisplayView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 01/09/2023.
//

import SwiftUI
import NukeUI

struct CoversDisplayView: View {
    let coversToDisplay: [Int]?
    var body: some View {
        VStack{
            TabView {
                ForEach(coversToDisplay ?? [-1], id: \.self) { cover in
                    LazyImage(url: URL(string: "https://covers.openlibrary.org/b/id/\(cover)-M.jpg")) { state in
                        if let image = state.image {
                            image // Displays the loaded image.
                        } else if state.error != nil {
                            VStack{
//                                Text(state.error?.localizedDescription ?? "ERROR!")
                                Text("Didnt find the cover\nI will draw one")
                                    .font(Constants.appFont)
                                    .multilineTextAlignment(.center)
                                Image("NoCover")
                                    .resizable()
                                    .scaledToFill()
                            }
                        } else {
                            ProgressView()
                        }
                    }
                    .frame(width: 200, height: 300)
                }
                
            }
        }

    }
}

struct CoversDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        CoversDisplayView(coversToDisplay: nil)
    }
}
