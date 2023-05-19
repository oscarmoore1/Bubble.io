// Importing SwiftUI, which is a user interface toolkit that lets us design apps in a declarative way
import SwiftUI

// This struct represents a LandingPage view
struct LandingPage: View {
    
    // This is a color value that will be used in various UI elements
    let color = Color(red: 65/255.0, green: 169/255.0, blue: 202/255.0, opacity: 1)
    
    // Two state properties, one for controlling the navigation to the next view and one for storing the user's name
    @State var shouldShowNextView = false
    @State var name = ""

    // The body property defines the content and behavior of the view
    var body: some View {
        
        // A navigation view that provides a platform-native navigation model
        NavigationView{
            
            // A VStack for vertical alignment of views
            VStack {
                
                // A HStack (horizontal stack) for horizontal alignment of Text views
                HStack(spacing: -45){
                    // Text views for displaying "the" and "Bubble", with different color settings
                    // Both using a custom font named "Inter-Bold"
                    Text("the")
                        .foregroundColor(Color(red: 0/255.0, green: 0/255.0, blue: 0/255.0, opacity: 1))
                        .frame(width: 122, height: 32)
                        .font(Font.custom("Inter-Bold", size: 24))
                    Text("Bubble")
                        .foregroundColor(color)
                        .font(Font.custom("Inter-Bold", size: 24))
                }
                .offset(x:-20, y:-250) // offsets the HStack
                
                // A VStack with a leading alignment and 0 spacing
                VStack(alignment: .leading, spacing: 0){
                    Text("Welcome, ")
                        .foregroundColor(Color(red: 9/255.0, green: 10/255.0, blue: 10/255.0, opacity: 1))
                        .font(Font.custom("Inter-Bold", size: 30))
                    
                    HStack(spacing: -45){
                        Text("my nickname is")
                            .foregroundColor(Color(red: 0/255.0, green: 0/255.0, blue: 0/255.0, opacity: 1))
                            .font(Font.custom("Inter-Bold", size: 28))
                        
                        // A TextField view for user's input, linked to the 'name' state
                        // Upon commit, the loginSequence function is called and the user is navigated to the next page
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
                
                // A ZStack for overlaying views
                // Contains a NavigationLink for navigating to the RegisterForm view
                
                // A ZStack for overlaying views
                ZStack {
                    // A NavigationLink for navigating to the RegisterForm view
                    NavigationLink(destination: RegisterForm()){
                        // A VStack for vertically stacking a Rectangle shape and Text view
                        VStack {
                            // The Rectangle is filled with the predefined color, set with specific frame dimensions and corner radius
                            Rectangle()
                                .fill(color)
                                .frame(width: 182, height: 48)
                                .cornerRadius(48)
                            // The Text view displays "Create account" and is customized with specific color, frame dimensions, and font settings
                            Text("Create account")
                                .foregroundColor(Color(red: 255/255.0, green: 255/255.0, blue: 255/255.0, opacity: 1))
                                .frame(width: 118, height: 16)
                                .font(Font.custom("Inter-Medium", size: 16))
                        }
                    }
                }
                .offset(x:0, y:250) // offset the ZStack

                // Text view for prompting user about account creation
                Text("Create an account?")
                    .foregroundColor(Color(red: 32/255.0, green: 35/255.0, blue: 37/255.0, opacity: 1))
                    .frame(width: 186, height: 24)
                    .font(Font.custom("Inter-Regular", size: 16))
                    .offset(x:0, y:250) // offset the Text view

                // Check if we should navigate to the next page
                // If so, a NavigationLink to BubblesPageView is activated
                if shouldShowNextView{
                    NavigationLink(
                        destination: BubblesPageView(),
                        isActive: $shouldShowNextView,
                        label: {
                            EmptyView() // The link is invisible
                        })
                }
            }
            .padding() // padding for the VStack

        }
    }
}

// Function that triggers when user submits their nickname. It prints a console message
// Note that some parts of the code are commented out, which might include authentication via an external server or Firebase
private func loginSequence(var nickname: String){
    print("Logged in user")
}

// This struct is used to provide a preview of the LandingPage view in Xcode's canvas or preview provider
struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
