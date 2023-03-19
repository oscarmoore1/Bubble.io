//
//  RegisterForm.swift
//  Bubble.io
//
//  Created by Oscar Moore on 14/03/23.
//

import SwiftUI

struct RegisterForm: View {
    let color = Color(red: 65/255.0, green: 169/255.0, blue: 202/255.0, opacity: 1)
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var email = ""
    var body: some View {
        VStack (spacing: 30) {
            
            HStack(spacing: -45){
                Text("the")
                    .foregroundColor(Color(red: 0/255.0, green: 0/255.0, blue: 0/255.0, opacity: 1))
                    .frame(width: 122, height: 32)
                    .font(Font.custom("Inter-Bold", size: 24))
                Text("Bubble")
                    .foregroundColor(color)
                    .font(Font.custom("Inter-Bold", size: 24))
            }
            .fontWeight(.bold)
            .offset(x:-20, y:20)
            
            Text("Create an Account")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            TextField("Username", text: $username)
                .padding(.horizontal)
                .padding(.bottom)
                .font(Font.custom("Inter-Bold", size: 25))
                .foregroundColor(color)
            
                
            
            SecureField("Password", text: $password)
                .padding(.horizontal)
                .padding(.bottom)
                .font(Font.custom("Inter-Bold", size: 25))
            
            SecureField("Confirm Password", text: $confirmPassword)
                .padding(.horizontal)
                .padding(.bottom)
                .font(Font.custom("Inter-Bold", size: 25))
            Button(action: {
                // Handle registration logic here
            }, label: {
                Text("Create Account")
//                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(color)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            })
            .padding(.top)
            .offset(x:0, y:250)
            
            Spacer()
        }
    }
}


struct RegisterForm_Previews: PreviewProvider {
    static var previews: some View {
        RegisterForm()
    }
}
