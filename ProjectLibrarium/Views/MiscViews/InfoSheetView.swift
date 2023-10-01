//
//  SwiftUIView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 13/09/2023.
//

import SwiftUI

struct InfoSheetView: View {
    var body: some View {
        VStack{
            Text("Thank you for taking interest in the FOX BOOKS BOX credits")
                .multilineTextAlignment(.center)
            Spacer()
            HStack{
                VStack{
                    Text("The app is using:")
                    Spacer()
                }
                VStack{
                    Text("Open Library as the books API search and trending list\n\nBing Image Generato and Stable Diffusion as art generation engines")
                    Spacer()
                }
            }
            .frame(height: 200)
            Spacer()
            Group{
                HStack{
                    Text("Project creator:")
                    Spacer()
                    Text("Andrey Safronov")
                }
                HStack{
                    Text("Project Mentor:")
                    Spacer()
                    Text("Anan Sadiya")
                }
                Divider()
                Text("Special thanks to Amir Hayek, Shani Hajbi and Guy Cohen.")
                    .multilineTextAlignment(.center)
                Divider()
                HStack{
                    VStack{
                        Text("Honorable Mentions:")
                        Spacer()
                    }
                    Spacer()
                    ScrollView{
                        Text("Shutterfly Israel")
                    }
                    
                }
                    .multilineTextAlignment(.trailing)
            }
            Spacer()
            Group{
                Text("If you enjoyed this APP please consider donating to the OPEN Library project by tapping the banner below")
                    .multilineTextAlignment(.center)
                Link(destination: URL(string: "https://archive.org/donate/?platform=ol&origin=olwww-TopNavDonateButton")!) {
                    Image("openlibrary-logo-tighter")
                        .resizable()
                        .scaledToFit()
                }
                Text("THANK YOU")
                
            }
            
        }
        .font(Constants.appFont)
        .padding()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        InfoSheetView()
    }
}
