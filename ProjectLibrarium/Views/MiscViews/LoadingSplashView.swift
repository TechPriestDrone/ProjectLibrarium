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
                        Spacer()
                        Image("LoadingFox")
                            .resizable()
                            .scaledToFit()
                        Text("Fox Books Box")
                            .font(Constants.appFont)
                        Spacer()
                        Text("Powered by OpenLibrary")
                        Divider()
                        Text("LOADING")
                            .font(.headline)
                    }
                    .multilineTextAlignment(.center)
                }
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                librariumViewModel.isLoadingMainScreen = true
            }
        }
    }
}

struct LoadingSplashView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingSplashView(librariumViewModel: LibrariumViewModel(searchType: SearchServicesMock()))
    }
}
