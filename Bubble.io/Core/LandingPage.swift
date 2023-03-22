//
//  LandingPage.swift
//  Bubble.io
//
//  Created by Oscar Moore on 5/03/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase

struct LandingPage: View {
//    var ref: DatabaseReference!
//    ref = Database.database().reference()
    
    
    let color = Color(red: 65/255.0, green: 169/255.0, blue: 202/255.0, opacity: 1)
    @State var shouldShowNextView = false
    @State var name = ""

    
    var body: some View {
        
        NavigationView{
            VStack {
                //MUST DOWNLOAD FONT ASSETS
                HStack(spacing: -45){
                    Text("the")
                        .foregroundColor(Color(red: 0/255.0, green: 0/255.0, blue: 0/255.0, opacity: 1))
                        .frame(width: 122, height: 32)
                        .font(Font.custom("Inter-Bold", size: 24))
                    Text("Bubble")
                        .foregroundColor(color)
                        .font(Font.custom("Inter-Bold", size: 24))
                }
                .offset(x:-20, y:-250)
                
                VStack(alignment: .leading,spacing: 0){
                    Text("Welcome, ")
                        .foregroundColor(Color(red: 9/255.0, green: 10/255.0, blue: 10/255.0, opacity: 1))
                        .font(Font.custom("Inter-Bold", size: 30))
                    
                    HStack(spacing: -45){
                        Text("my nickname is")
                            .foregroundColor(Color(red: 0/255.0, green: 0/255.0, blue: 0/255.0, opacity: 1))
                            .font(Font.custom("Inter-Bold", size: 28))
                        TextField(
                            "",
                            text: $name,
                            onCommit:{
                                loginSequence(var: name)
                                shouldShowNextView = true
                            })
                        .offset(x:55)
                        .foregroundColor(color)
                        .font(Font.custom("Inter-Bold", size: 28))
                        
                    }
                }
                .offset(x:30, y:-160)
                
                ZStack {
                    Rectangle()
                        .fill(color)
                        .frame(width: 182, height: 48)
                        .cornerRadius(48)
                    Text("Create account")
                        .foregroundColor(Color(red: 255/255.0, green: 255/255.0, blue: 255/255.0, opacity: 1))
                        .frame(width: 118, height: 16)
                        .font(Font.custom("Inter-Medium", size: 16))
                    
                }
                .offset(x:0, y:250)
                Text("Have an account? Log in")
                    .foregroundColor(Color(red: 32/255.0, green: 35/255.0, blue: 37/255.0, opacity: 1))
                    .frame(width: 186, height: 24)
                    .font(Font.custom("Inter-Regular", size: 16))
                    .offset(x:0, y:250)
                
                //                                Navigate to the next page
                if shouldShowNextView{
                    NavigationLink(
                        destination: BubblesPageView(),
                        isActive: $shouldShowNextView,
                        label: {
                            
                            EmptyView()
                        })
                }
            }
            .padding()
            
        }
    }
}

private func loginSequence(var nickname: String){
    let url = URL(string: "http://localhost:3000/login/hsis")!
//    var request = URLRequest(url: url)
//    request.httpMethod = "POST"
//
//    let jsonData = try JSONSerialization.data(withJSONObject: ["key": "value"], options: [])
//    request.httpBody = jsonData
//    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//    let session = URLSession.shared
//    let task = session.dataTask(with: request) { data, response, error in
//        guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
//            print("Error: \(error?.localizedDescription ?? "Unknown error")")
//            return
//        }
//
//        if response.statusCode == 200 {
//            print("Request successful")
//            // Process the response data
//        } else {
//            print("Request failed with status code: \(response.statusCode)")
//        }
//    }
    
    Auth.auth().signInAnonymously { authResult, error in
        guard let result = authResult, error == nil else {
            print("Failed to log in")
            return
        }
        let user = result.user
        print("Logged in user")
    }
}


struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
