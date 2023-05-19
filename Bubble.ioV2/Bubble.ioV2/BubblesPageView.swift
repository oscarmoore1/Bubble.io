//
//  BubblesPageView.swift
//  Bubble.io
//
//  Created by Oscar Moore on 28/02/23.
//

import SwiftUI


struct BubblesPageView: View {
    let color = Color(red: 65/255.0, green: 169/255.0, blue: 202/255.0, opacity: 1)
    @State private var bubbles: [BubbleObject] = []
    
    var body: some View {
        VStack{
            //MUST DOWNLOAD FONT ASSETS
            HStack(spacing: -45){
                Text("the")
                    .foregroundColor(Color(red: 0/255.0, green: 0/255.0, blue: 0/255.0, opacity: 1))
                    .frame(width: 122, height: 32)
                    .font(Font.custom("Inter-Bold", size: 24))
                    .onAppear{
                        bubbles = loadJson(filename: "bubble_data") ?? []
                        
                    }
                Text("Bubble")
                    .foregroundColor(color)
                    .font(Font.custom("Inter-Bold", size: 24))
            }
            .offset(x:-20, y:-250)
            
            Text("Choose a bubble to join")
                .foregroundColor(Color(red: 9/255.0, green: 10/255.0, blue: 10/255.0, opacity: 1))
                .font(Font.custom("Inter-Bold", size: 30))
                .offset(x:0, y:-200)
//                .onAppear{
//                    Render(BubbleList: bubbles)
//                }
            HStack(spacing: -10){
//                let render = Render(NumberOfCircles: CGFloat(bubbles.count))
                ForEach(bubbles) { bubble in
                    NavigationLink(destination: Chat()) {
                        BubbleCircle(name: bubble.name, size: 110)
                    }
                }
            }
            
        }
    }
}
//Renders the size of the bubbles based on:
    //Number of bubbles
    //The difference in highest range vs lowest range

func Render(BubbleList: [BubbleObject]) -> (() -> Void)? {
    var values: [Int] = []
    let minVal = values.min() ?? 0
    let maxVal = values.max() ?? 0
    
    for bubble in BubbleList{
        values.append(bubble.Range)
    }
    
    let scaledValues = values.map { ($0 - minVal) / (maxVal - minVal) }
    print(scaledValues)
    return nil
}

struct BubbleCircle: View {
    @State private var isAnimating = false
    let color = Color(red: 65/255.0, green: 169/255.0, blue: 202/255.0, opacity: 1)
    let name: String
    let size: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(color)
                .scaleEffect(isAnimating ? 1 : 0.9)
                .opacity(isAnimating ? 1 : 0.9)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                .onAppear() {
                    self.isAnimating = true
                }
            
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


