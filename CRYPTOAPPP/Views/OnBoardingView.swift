//
//  OnBoardingView.swift
//  CRYPTOAPPP
//
//  Created by Vladyslav Mi on 01.03.2024.
//

import SwiftUI

struct OnBoardingView: View {
    
    @State var MyTitle:String = "START LEARNING NOW!"
    
    var body: some View {
        NavigationView {
            ZStack{
                back
                    .ignoresSafeArea()
                VStack(alignment:.center, spacing : 20, content: {
                    
                    header
                    
                    mainImage
                   
                    Spacer().frame(height: 40)

                    buttonView
                   
                })
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    OnBoardingView()
}



extension OnBoardingView{
    
    private var back : some View {
        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)), Color(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 0.7399368791))]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
    
    private var header : some View{
        Text("Welcome!\n We bring the new way of learning about crypto, providing customers with an inspiring way to learn about cryptocurrencies.")
            .font(.custom("Helvetica", size: 17.5))
            .bold()
            .baselineOffset(20.0)
            .kerning(3.0)
            .multilineTextAlignment(.trailing)
            .frame(width: 360)
            .padding()
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 15.0)
                    .stroke(Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)), lineWidth: 3)
                    .padding(.leading,17)
                    .padding(.trailing, 7)
                    .padding(.bottom, 15)
                    .shadow(color:Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)), radius:20, x: -10, y: 20)
                
            )
    }
    
    private var mainImage: some View{
        Image("start")
            .resizable()
            .frame(width: 300, height:310)
    }
    
    private var buttonView : some View{
        
        NavigationLink(destination: LoginView()) {
            Text(MyTitle)
                .font(.custom("Helvetica", size: 16.0))
                .bold()
                .kerning(1.5)
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6166142225, green: 0.5138229728, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1))]), startPoint: .leading, endPoint: .trailing)
                        )
                        .frame(width: 320.0, height: 60.0)
                        .shadow(color:Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)), radius:10, x: -10, y: -10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)), lineWidth: 2)
                        )
                )
            
        }
    }
    
}





