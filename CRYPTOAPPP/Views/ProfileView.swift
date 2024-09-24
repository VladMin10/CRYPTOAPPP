//
//  ProfileView.swift
//  CRYPTOAPPP
//
//  Created by Vladyslav Mi on 09.03.2024.
//

import SwiftUI
import CoreData

//class ProfileViewModel : ObservableObject{
//    
//    let container : NSPersistentContainer
//    @Published var savedEntities : [ToDoEntity] = []
//    
//    init(){
//        container = NSPersistentContainer(name: "ProfileInfoContainer")
//        container.loadPersistentStores { (description, error) in
//            if let error = error {
//                print("ERROR LOADING CORE DATA! \(error)")
//            }else{
//                print("SUCCESFULLY LOADED DATA!")
//            }
//        }
//        fetchToDoThings()
//    }
//    
//    func fetchToDoThings(){
//        let request = NSFetchRequest<ToDoEntity>(entityName: "ToDoEntity")
//        
//        do{
//            savedEntities = try container.viewContext.fetch(request)
//        } catch let error {
//            print("Error fetching!\(error)")
//        }
//    }
//    
//    func addToDoThings(text : String){
//        let newToDoThing = ToDoEntity(context: container.viewContext)
//        newToDoThing.info = text
//        saveData()
//    }
//    
//    func deleteToDoThings(indexSet : IndexSet){
//        guard let index = indexSet.first else {return}
//        let entity = savedEntities[index]
//        container.viewContext.delete(entity)
//        saveData()
//    }
//    
//    func saveData(){
//        do{
//            try container.viewContext.save()
//            fetchToDoThings()
//        } catch let error {
//            print("Error loading! \(error)")
//        }
//    }
//}

struct ProfileView: View {
    
//    @StateObject var vmdl = ProfileViewModel()
    @State var textFieldText : String = ""
    var body: some View {
        ZStack {
            back
                .ignoresSafeArea()
            VStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .padding(.top, 50)

                Text("Vladyslav Miniailo")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)

                Text("vlad@gmail.com")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(.bottom, 50)

                VStack(alignment: .leading, spacing: 20) {
                    ProfileRow(title: "Location", icon: "mappin.and.ellipse", value: "Lviv, Ukraine")
                    ProfileRow(title: "Joined", icon: "calendar", value: "March 8, 2024")
                    ProfileRow(title: "Points", icon: "scope", value: "100")
                }
                .padding([.leading, .trailing], 20)

            //    Spacer()
//                TextField("Add text here...", text: $textFieldText)
//                    .font(.headline)
//                    .padding(.leading)
//                    .frame(height : 50)
//                    .background(Color.white.cornerRadius(8))
//                
//                .padding([.leading, .trailing], 20)
//                
//                Button(action: {
//                    guard !textFieldText.isEmpty else {return}
//                    vmdl.addToDoThings(text: textFieldText)
//                    textFieldText = ""
//                }, label: {
//                    Text("Save To Do!")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .frame(height : 50)
//                        .frame(maxWidth: .infinity)
//                        .background(Color(#colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)).cornerRadius(8))
//                })
//                .padding([.leading, .trailing], 20)
//                
//                List {
//                    ForEach(vmdl.savedEntities){ entity in
//                        Text(entity.info ?? "NO NAME")
//                    }
//                    .onDelete(perform: vmdl.deleteToDoThings)
//                }
//                .listStyle(PlainListStyle())
                Spacer()
            }
        }
    }
}

struct ProfileRow: View {
    var title: String
    var icon: String
    var value: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white)
                .imageScale(.large)
            Text(title)
                .foregroundColor(.white)
                .font(.headline)
            Spacer()
            Text(value)
                .foregroundColor(.white)
                .font(.subheadline)
        }
    }
}


#Preview {
    ProfileView()
}

extension ProfileView {
    
    private var back : some View {
        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}
