//
//  ReactionsView.swift
//  SwiftUIAnimations
//
//  Created by Lidiane Gomes Barbosa on 23/01/23.
//

import SwiftUI

struct ReactionsView: View {
    @State private var showReaction = false
    
    let inboundBubbleColor = Color(#colorLiteral(red: 0.07058823529, green: 0.07843137255, blue: 0.0862745098, alpha: 1))
    let reactionsBGColor = Color(#colorLiteral(red: 0.05490196078, green: 0.09019607843, blue: 0.137254902, alpha: 1))
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 28)
                .frame(width: 216, height: 40)
                .foregroundColor(Color(.systemGray6))
            
                .scaleEffect(CGFloat(showReaction ? 1 : 0), anchor: .topTrailing)
            
                .animation(.interpolatingSpring(stiffness: 170, damping: 15).delay(0.05), value: showReaction)
            
            HStack(spacing: 20) {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                    .offset(x: showReaction ? 0 : -15)
                    .scaleEffect(showReaction ? 1 : 0, anchor: .bottomLeading)
                    .animation(.interpolatingSpring(stiffness: 170, damping: 8).delay(0.1), value: showReaction)
                
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundColor(.yellow)
                    .offset(x: showReaction ? 0 : -15)
                    .scaleEffect(showReaction ? 1 : 0, anchor: .bottom)
                    .rotationEffect(.degrees(showReaction ? 0 : -45))
                    .animation(.interpolatingSpring(stiffness: 170, damping: 8).delay(0.2), value: showReaction)
                
                Image(systemName: "hand.thumbsdown.fill")
                    .foregroundColor(.yellow)
                    .scaleEffect(showReaction ? 1 : 0, anchor: .topTrailing)
                    .rotationEffect(.degrees(showReaction ? 0 : 45))
                    .animation(.interpolatingSpring(stiffness: 170, damping: 8).delay(0.3), value: showReaction)
                
                Text("😆")
                    .scaleEffect(showReaction ? 1 : 0, anchor: .bottom)
                    .animation(.interpolatingSpring(stiffness: 170, damping: 8).delay(0.4), value: showReaction)
                
                Text("😠")
                    .offset(x: showReaction ? 0 : 15)
                    .scaleEffect(showReaction ? 1 : 0, anchor: .bottomTrailing)
                    .animation(.interpolatingSpring(stiffness: 170, damping: 8).delay(0.5), value: showReaction)
                
            }
            
        }
        .onAppear{
            showReaction.toggle()
        }
    }
}

struct ReactionsView_Previews: PreviewProvider {
    static var previews: some View {
        ReactionsView()
            .preferredColorScheme(.dark)
    }
}
