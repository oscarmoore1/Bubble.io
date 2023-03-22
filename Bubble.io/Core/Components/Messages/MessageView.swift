//
//  MessageView.swift
//  Bubble.io
//
//  Created by Oscar Moore on 20/03/23.
//

import SwiftUI

struct MessageView: View {
    var body: some View {
        HStack(alignment: .bottom, spacing: 15){
            Image("My-avatar")
                .resizable()
                .frame(width:40, height: 40 , alignment: .center)
                .cornerRadius(20)
            ContentMessageView(contentMessage: "hello kind sir how is it going", isCurrentUser: false)
        }
        
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
