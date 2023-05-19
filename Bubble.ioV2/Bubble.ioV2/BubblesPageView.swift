// The BubblesPageView.swift file, part of the Bubble.io app
import SwiftUI

// Define a new SwiftUI View named BubblesPageView
struct BubblesPageView: View {
    // Define a color used in the app
    let color = Color(red: 65/255.0, green: 169/255.0, blue: 202/255.0, opacity: 1)
    // Create a @State variable to hold the array of BubbleObject objects
    @State private var bubbles: [BubbleObject] = []
    
    // Define the body property that provides the content for the view
    var body: some View {
        // Stack views vertically within a VStack
        VStack{
            // Align two text views horizontally within a HStack
            HStack(spacing: -45){
                Text("the")
                    // Configure the appearance of the text
                    .foregroundColor(Color(red: 0/255.0, green: 0/255.0, blue: 0/255.0, opacity: 1))
                    .frame(width: 122, height: 32)
                    .font(Font.custom("Inter-Bold", size: 24))
                    // Load the data from the JSON file when the text appears
                    .onAppear{
                        bubbles = loadJson(filename: "bubble_data") ?? []
                    }
                Text("Bubble")
                    // Configure the appearance of the text
                    .foregroundColor(color)
                    .font(Font.custom("Inter-Bold", size: 24))
            }
            // Offset the HStack
            .offset(x:-20, y:-250)
            
            // Add a text view with instructions for the user
            Text("Choose a bubble to join")
                // Configure the appearance of the text
                .foregroundColor(Color(red: 9/255.0, green: 10/255.0, blue: 10/255.0, opacity: 1))
                .font(Font.custom("Inter-Bold", size: 30))
                // Offset the text
                .offset(x:0, y:-200)
                
            // Align views horizontally within a HStack
            HStack(spacing: -10){
                // Create a view for each BubbleObject in the array
                ForEach(bubbles) { bubble in
                    // Create a navigation link to the Chat view
                    NavigationLink(destination: Chat()) {
                        // Create a BubbleCircle view for the bubble
                        BubbleCircle(name: bubble.name, size: 110)
                    }
                }
            }
        }
    }
}

// Define a function to calculate the scale of the bubbles based on their range
func Render(BubbleList: [BubbleObject]) -> (() -> Void)? {
    // Create an array to store the range of each bubble
    var values: [Int] = []
    // Calculate the minimum and maximum range
    let minVal = values.min() ?? 0
    let maxVal = values.max() ?? 0
    
    // Add the range of each bubble to the array
    for bubble in BubbleList{
        values.append(bubble.Range)
    }
    
    // Scale the values to a range from 0 to 1
    let scaledValues = values.map { ($0 - minVal) / (maxVal - minVal) }
    // Print the scaled values
    print(scaledValues)
    return nil
}

//Strucutre for the bubble obejcts to appear on the screen
struct BubbleCircle: View {
    @State private var isAnimating = false
    let color = Color(red: 65/255.0, green: 169/255.0, blue: 202/255.0, opacity: 1)
    let name: String
    let size: CGFloat
    
    var body: some View {
        ZStack {
            // Circle view
            Circle()
            //Create the bubbly effect
                .foregroundColor(color)
                .scaleEffect(isAnimating ? 1 : 0.9)
                .opacity(isAnimating ? 1 : 0.9)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                .onAppear() {
                    // Start animation when the view appears
                    self.isAnimating = true
                }
            
            // Text label on top of the circle
            Text(name)
                .foregroundColor(.white)
        }
        .frame(width: size, height: size)
    }
}

struct BubblesPageView_Previews: PreviewProvider {
    static var previews: some View {
        BubblesPageView()
    }
}
