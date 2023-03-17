//
//  ChainedSpring.swift
//  SwiftUIAnimations
//
//  Created by Lidiane Gomes Barbosa on 23/01/23.
//

import SwiftUI

struct ChainedSpring: View {
    @State private var moving: Bool = false
    var body: some View {
        ZStack {
            CustomCircle(ratio: 20, delay: 0, moving: $moving)
            CustomCircle(ratio: 50, delay: 0.05, moving: $moving)
            CustomCircle(ratio: 80, delay: 0.1, moving: $moving)
            CustomCircle(ratio: 110, delay: 0.15, moving: $moving)
            CustomCircle(ratio: 140, delay: 0.2, moving: $moving)
            CustomCircle(ratio: 170, delay: 0.25, moving: $moving)
            CustomCircle(ratio: 200, delay: 0.3, moving: $moving)
            CustomCircle(ratio: 230, delay: 0.35, moving: $moving)
        }.onAppear {
            moving.toggle()
        }
    }
}

struct CustomCircle: View {
    var ratio: CGFloat
    var delay: Double
    @Binding var moving: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .frame(width: ratio, height: ratio)
            .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
            .offset(y: moving ? 150 : -180)
            .animation(.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses: true).delay(delay), value: moving)
    }
}

struct ChainedSpring_Previews: PreviewProvider {
    static var previews: some View {
        ChainedSpring()
    }
}
