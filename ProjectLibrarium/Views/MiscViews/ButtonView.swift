//
//  ButtonView.swift
//  ProjectLibrarium
//
//  Created by ios5 on 12/09/2023.
//

import SwiftUI

struct ButtonView: View {
    
    let buttonText: String
    let buttonType: ButtonTypes
    let widthOfButton:CGFloat = UIScreen.main.bounds.width
    let heightOfButton: CGFloat = UIScreen.main.bounds.height
    let cornerRadius: CGFloat = 50
    enum ButtonTypes: String {
        case remover = "multiply"
        case favorite = "rosette"
        case addToRead = "books.vertical.fill"
    }
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(LinearGradient(colors: [Color(uiColor: .orange), Color(uiColor: .yellow)], startPoint: .top, endPoint: .bottom))
                .frame(width: widthOfButton * 0.4, height: heightOfButton * 0.06)
                .cornerRadius(cornerRadius)
                .background {
                    Rectangle()
                        .fill(LinearGradient(colors: [Color(uiColor: .black), Color(uiColor: .white)], startPoint: .leading, endPoint: .trailing))
                        .frame(width: widthOfButton * 0.42, height: heightOfButton * 0.04)
                        .cornerRadius(cornerRadius)
                }
                .background {
                    Rectangle()
                        .fill(LinearGradient(colors: [Color(uiColor: .black), Color(uiColor: .clear)], startPoint: .bottom, endPoint: .top))
                        .frame(width: widthOfButton * 0.4, height: heightOfButton * 0.07)
                        .cornerRadius(cornerRadius)
                }
                .overlay {
                        if buttonType == .remover {
                            ZStack{
                                Text("\(buttonText)")
                                    .font(Constants.appFont)
                                    .padding()
                                    .foregroundColor(.white)
                                Image(systemName: buttonType.rawValue)
                                    .resizable()
                                    .opacity(0.5)
                                    .frame(width: widthOfButton * 0.3, height: heightOfButton * 0.04)
                                Spacer(minLength: widthOfButton * 0.1 )
                            }
                        } else {
                            HStack{
                                Text("\(buttonText)")
                                    .font(Constants.appFont)
                                    .padding()
                                    .foregroundColor(.white)

                                Image(systemName: buttonType.rawValue)
                            }
                        }
                }
                .padding()
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonText: "FAVORITE", buttonType: .remover)
    }
}
