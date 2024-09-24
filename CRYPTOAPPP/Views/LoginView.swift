//
//  LoginView.swift
//  CRYPTOAPPP
//
//  Created by Vladyslav Mi on 02.03.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var loginInProgress: String = "Trying to login..."
    
    var body: some View {
        NavigationView{
            ZStack{
                back
                    .ignoresSafeArea()
                
                VStack(alignment : .center) {
                    
                    upText
                    
                    Spacer().frame(height:30)
                    
                    logImage
                    
                    Spacer().frame(height:30)
                    
                    HStack (alignment: .center,spacing: 30, content: {
                        buttons(social_media: "logo_apple", loginInProgress: $loginInProgress)
                        buttons(social_media: "logo_fb", loginInProgress: $loginInProgress)
                        buttons(social_media: "logo_google", loginInProgress: $loginInProgress)
                    })
                    loginStatus
                    
                }

            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    LoginView()
}

extension LoginView {

    private var back : some View {
        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)), Color(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 0.7399368791))]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
    
    private var upText : some View {
        Text("Ready to accept the \n challenge?")
            .font(.custom("Helvetica", size: 18.5))
            .bold()
            .baselineOffset(20.0)
            .kerning(3.0)
            .multilineTextAlignment(.center)
            .frame(width: 360)
            .foregroundColor(.white.opacity(0.9))
            .padding(.top, 10)
            .background(
                RoundedRectangle(cornerRadius: 15.0)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 0.5586568709)), Color(#colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 0.7056084437))]), startPoint: .leading, endPoint: .trailing)
                    )
                    .stroke(Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)), lineWidth: 4)
                    .frame(width: 370.0, height: 110.0)
                    .shadow(color:Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)), radius:20, x: -30, y: -30)
                
            )
    }
    
    private var logImage: some View {
        Image("login_image")
            .resizable()
            .frame(width:300, height:330 )
            .padding(.bottom, 50)
    }
    
   private var loginStatus: some View {
        Text(loginInProgress)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .foregroundColor(.white.opacity(0.9))
            .padding()
    }
}

struct buttons: View {
    
    @State var social_media : String
    @Binding var loginInProgress: String
    
    
    var body: some View {
        NavigationLink(destination: CourseMapView()) {
            RoundedRectangle(cornerRadius: 15.0)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                )
                .frame(width: 80.0, height: 80.0)
                .shadow(color:Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)), radius:10, x: -10, y: -10)
                .overlay(
                    Image(social_media)
                        .resizable()
                        .frame(width:45, height: 45)
                )
        }
    }
}
