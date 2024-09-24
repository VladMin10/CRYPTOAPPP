//
//  CommunityView.swift
//  CRYPTOAPPP
//
//  Created by Vladyslav Mi on 09.03.2024.
//

import SwiftUI

struct CommunityView: View {
    var body: some View {
        NavigationView {
            List {
                // Первый пост
                Posts(
                    author: "Admin",
                    title: "Welcome to our community!",
                    content: "We're glad you're here. This is a place where you can share your thoughts, engage in discussions, and be part of a supportive community. Feel free to post, comment, and interact with others. Let's make this a positive and inclusive space for everyone. Enjoy your stay!"
                )
                // Второй пост
                Posts(
                    author: "Admin",
                    title: "Updates!",
                    content: "New modules will be added soon!"
                )
                
                // Другие посты идут сюда
                
                Posts(
                    author: "Admin",
                    title: "Module 1 is added!",
                    content: "MODULE 1 : \n 1.1 Вступ. Словник. Базові поняття \n 1.2 Види аналізу. Таймфрейми. Стилі торгівлі \n 1.3 Блокчейн. Монети. Токени. Смарт-контракт \n 1.4 Японські свічки \n 1.5 Робота з біржею та гаманцями."
                )
            }
            .navigationBarTitle("Community")
        }
    }
}

struct Posts: View {
    let author: String
    let title: String
    let content: String

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 10)
                VStack(alignment: .leading) {
                    Text(author)
                        .font(.headline)
                    Text(title)
                        .font(.subheadline)
                }
            }
            Text(content)
                .padding(.top, 3)
        }
        .padding(20)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 0.3818294702)), Color(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 0.1987272351))]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 2)
       // .listRowBackground()
        
        
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}

extension CommunityView{
    private var back : some View {
        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)), Color(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 0.7399368791))]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}
