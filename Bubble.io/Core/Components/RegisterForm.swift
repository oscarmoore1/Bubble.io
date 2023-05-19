
import SwiftUI // SwiftUI is used to create the views in this file.

// The RegisterForm View is the registration form for the Bubble.io app.
struct RegisterForm: View {
    
    // The color used in this View.
    let color = Color(red: 65/255.0, green: 169/255.0, blue: 202/255.0, opacity: 1)
    
    // State variables are used to store user input from the form.
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var email = ""
    
    // The body of the RegisterForm View.
    var body: some View {
        // Vertically stacked elements with spacing of 30.
        VStack (spacing: 30) {
            
            // Logo text with custom font and color.
            HStack(spacing: -45){
                Text("the")
                    .foregroundColor(Color(red: 0/255.0, green: 0/255.0, blue: 0/255.0, opacity: 1))
                    .frame(width: 122, height: 32)
                    .font(Font.custom("Inter-Bold", size: 24))
                Text("Bubble")
                    .foregroundColor(color)
                    .font(Font.custom("Inter-Bold", size: 24))
            }
            .fontWeight(.bold) // Bold font weight for the logo.
            .offset(x:-20, y:20) // Offset the logo slightly.
            
            // Header text for the registration form.
            Text("Create an Account")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            // Text field for username input.
            TextField("Username", text: $username)
                .padding(.horizontal)
                .padding(.bottom)
                .font(Font.custom("Inter-Bold", size: 25))
                .foregroundColor(color)
            
            // Secure fields for password and password confirmation input.
            SecureField("Password", text: $password)
                .padding(.horizontal)
                .padding(.bottom)
                .font(Font.custom("Inter-Bold", size: 25))
            
            SecureField("Confirm Password", text: $confirmPassword)
                .padding(.horizontal)
                .padding(.bottom)
                .font(Font.custom("Inter-Bold", size: 25))
            
            // Button to submit the registration form.
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
            .offset(x:0, y:250) // Offset the button slightly.
            
            Spacer() // Empty space to push contents up.
        }
    }
}

// A preview of the RegisterForm View.
struct RegisterForm_Previews: PreviewProvider {
    static var previews: some View {
        RegisterForm()
    }
}
