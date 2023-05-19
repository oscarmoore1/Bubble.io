//
//  Chat.swift
//  BubbleV3
//
//  Created by Oscar Moore on 19/05/23.
//

import SwiftUI

struct ChatMessage: Identifiable {
    var id = UUID()
    var username: String
    var message: String
    var isCurrentUser: Bool
}

struct ChatBubble: Shape {
    var isFromCurrentUser: Bool
    func path(in rect: CGRect) -> Path {
        var path = Path()

        if isFromCurrentUser {
            path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX - 20, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY + 10))
        } else {
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + 20, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY + 10))
        }

        return path
    }
}

struct Chat: View {
    @State private var newMessage = ""
    let messages: [ChatMessage] = [
        ChatMessage(username: "Oscar", message: "Hello!", isCurrentUser: false),
        ChatMessage(username: "Aashika", message: "Hi Oscar!", isCurrentUser: true),
        ChatMessage(username: "David Lowe", message: "How's the project going?", isCurrentUser: false),
        ChatMessage(username: "Oscar", message: "Going great, thanks!", isCurrentUser: true),
        // Add more messages here...
    ]

    var body: some View {
        VStack {
            List(messages) { msg in
                HStack {
                    if msg.isCurrentUser {
                        Spacer()
                        Text(msg.message)
                            .padding()
                            .background(Color.blue.opacity(0.6))
                            .clipShape(ChatBubble(isFromCurrentUser: msg.isCurrentUser))
                            .foregroundColor(.white)
                    } else {
                        Text(msg.message)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .clipShape(ChatBubble(isFromCurrentUser: msg.isCurrentUser))
                        Spacer()
                    }
                }
            }

            HStack {
                TextField("New Message", text: $newMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    // Implement your sending message logic here
                }) {
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
            .padding()
        }
    }
}




struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        Chat()
    }
}
