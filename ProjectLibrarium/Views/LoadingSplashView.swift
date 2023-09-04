//
//  LoadingSplasgView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 04/09/2023.
//

import SwiftUI

struct LoadingSplashView: View {
    @StateObject var librariumViewModel: LibrariumViewModel
    
    var body: some View {
        VStack{
            VStack{
                ZStack{
                    VStack{
                        Text("Fox Books\n Box")
                        Image("LoadingFox")
                            .resizable()
                            .scaledToFit()
                        Spacer()
                        Text("LOADING")
                    }
                    .multilineTextAlignment(.center)
                }
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                librariumViewModel.isLoadingMainScreen = true
            }
        }
    }
}

//struct LoadingSplasgView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoadingSplasgView()
//    }
//}
