//
//  NotificationAnimation.swift
//  SwiftUIAnimations
//
//  Created by Lidiane Gomes Barbosa on 23/01/23.
//

import SwiftUI

struct NotificationAnimation: View {
    @State private var bellRotating = -45
    @State private var clapperMoving = false
    
    var body: some View {
        VStack {
            
            Text("Enable Notifications")
                .font(.title)
            
            Spacer()
            
            ZStack {
                VStack(spacing: 25) {
                    Circle()  // Hinge
                        .frame(width: 10, height: 10)
                        .foregroundColor(Color(.systemGray2))
                    
                    Circle() // Clapper
                        .frame(width: 16, height: 16, alignment: .topLeading)
                        .rotationEffect(.degrees(0), anchor: clapperMoving ? .leading : .topTrailing)
                        .offset(x: CGFloat(clapperMoving ? -10 : 25), y: CGFloat(clapperMoving ? -4 : 2))
                        .animation(.interpolatingSpring(stiffness: 170, damping: 5).repeatForever(autoreverses: false), value: clapperMoving)
                }
                .hueRotation(.degrees(200))
                
                Image("bell")
                    .shadow(radius: 4 )
                    .rotationEffect(.degrees( Double(bellRotating)), anchor: .top)
                    .hueRotation(.degrees(200))
                    .animation(.interpolatingSpring(stiffness: 170, damping: 5).repeatForever(autoreverses: false), value: bellRotating)
            }
            .scaleEffect(2)
            .onAppear() {
                bellRotating = 15
                clapperMoving.toggle()
            }
            
            Spacer()
            
        }
        
    }
}

struct NotificationAnimation_Previews: PreviewProvider {
    static var previews: some View {
        NotificationAnimation()
            .preferredColorScheme(.dark)
    }
}
