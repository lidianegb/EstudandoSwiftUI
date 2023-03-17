//
//  DampingFractionTypes.swift
//  SwiftUIAnimations
//
//  Created by Lidiane Gomes Barbosa on 23/01/23.
//

import SwiftUI

struct DampingFractionTypes: View {
    @State private var moving = false
    
    var body: some View {
        VStack(alignment: .leading) {
            // Ball 1, DF = Damping Fraction
            HStack {
                Text("Overdamping (Return quickly) : DF > 1 ")
                Image("ball")
                    .offset(x: moving ? 0 : 100)
                // Ball 1: Overdamping: Damping fraction = 2.0
                    .animation(.spring(response: 0.55, dampingFraction: 2.0, blendDuration: 0.0).repeatForever(autoreverses: false), value: moving)
            }
            
            // Ball 2
            HStack {
                Text("Critical damping (Return shortly): DF = 1")
                Image("ball")
                    .offset(x: moving ? 0 : 100)
                // Ball 2. Critical damping: Damping fraction = 1
                    .animation(.spring(response: 0.55, dampingFraction: 1, blendDuration: 0.0).repeatForever(autoreverses: false), value: moving)
            }
            
            // Ball 3
            HStack {
                Text("Underdamping (Overshoot): DF < 1")
                Image("ball")
                    .offset(x: moving ? 0 : 100)
                // Underdamping: Damping fraction < 1
                    .animation(.spring(response: 0.55, dampingFraction: 0.5, blendDuration: 0.0).repeatForever(autoreverses: false), value: moving)
            }
            
            // Ball 4
            HStack {
                Text("Undamped (oscillate forever): DF = 0")
                Image("ball")
                    .offset(x: moving ? 0 : 100)
                // Undamped: Damping fraction = 0.0
                    .animation(.spring(response: 0.55, dampingFraction: 0.0, blendDuration: 0.0).repeatForever(autoreverses: false), value: moving)
            }
        } // All balls
        .onAppear{
            moving.toggle()
        }
    }
}

struct DampingFractionTypes_Previews: PreviewProvider {
    static var previews: some View {
        DampingFractionTypes()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
