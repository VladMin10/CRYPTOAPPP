//
//  LeaderBoardView.swift
//  CRYPTOAPPP
//
//  Created by Vladyslav Mi on 10.03.2024.
//

import SwiftUI

struct UserModel : Identifiable {
    let id = UUID().uuidString
    let name : String
    let points : Int
    let isVerified : Bool
}

class LeaderBoardViewModel : ObservableObject {
    
    @Published var dataArray : [UserModel] = []
    @Published var filteredArray : [UserModel] = []
    @Published var mappedArray : [String] = []
    
    init(){
        getUsers()
        updateFilteredArray()
    }
    func getUsers(){
        let user1 = UserModel(name: "Katya", points: 100, isVerified: true)
        let user2 = UserModel(name: "Vlad", points: 99, isVerified: true)
        let user3 = UserModel(name: "Steve", points: 75, isVerified: false)
        let user4 = UserModel(name: "Joe", points: 31, isVerified: true)
        let user5 = UserModel(name: "Bob", points: 66, isVerified: false)
        let user6 = UserModel(name: "Lisa", points: 42, isVerified: false)
        let user7 = UserModel(name: "Sarah", points: 10, isVerified: true)
        let user8 = UserModel(name: "Amanda", points: 89, isVerified: false)
        let user9 = UserModel(name: "Chris", points: 60, isVerified: false)
        let user10 = UserModel(name: "Nastya", points: 76, isVerified: true)
        self.dataArray.append(contentsOf:[user1,user2,user3,user4,user5,user6,user7,user8,user9,user10])
    }
    
    func updateFilteredArray(){
        //sort
  /*    filteredArray = dataArray.sorted { (user1, user2) -> Bool in
          return user1.points > user2.points
        }*/

        filteredArray = dataArray.sorted(by: {$0.points > $1.points})
        //filter
 /*       filteredArray = dataArray.filter({ (user) ->Bool in
            return user.points > 50 */
        
    //    filteredArray = dataArray.filter({$0.isVerified})
        
        //map
        
    }
}
struct LeaderBoardView: View {
    @StateObject var vmd = LeaderBoardViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(vmd.filteredArray) { user in
                            HStack { // Wrap the user info in an HStack
                                Image(systemName: "person.circle") // User icon
                                    .foregroundColor(.white)
                                    .font(.system(size: 24))
                                // Adjust the size as needed
                                VStack(alignment: .leading) {
                                    Text(user.name)
                                    HStack {
                                        Text("Points: \(user.points)")
                                    }
                                }
                                Spacer()
                                if user.isVerified {
                                    Image(systemName: "checkmark")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0.5616351366, blue: 0, alpha: 1)))
                                        .background(
                                            Circle()
//                                            .fill(Color(#colorLiteral(red: 0, green: 0.5616351366, blue: 0, alpha: 1)))
                                            .fill(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                                            .frame(width: 28, height: 28)
                                        )

                                }
                            }
                            .foregroundColor(.white)
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)), Color(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 0.7399368791))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                .cornerRadius(9))
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationTitle("Leaderboard")
        }
    }
}


#Preview {
    LeaderBoardView()
}
