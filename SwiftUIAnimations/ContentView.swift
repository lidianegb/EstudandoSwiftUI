//
//  ContentView.swift
//  SwiftUIAnimations
//
//  Created by Lidiane Gomes Barbosa on 23/01/23.
//

import SwiftUI

struct ContentView: View {
    private let colors: [Color] = [.green, .red, .blue, .pink, .yellow, .indigo]
    private let offsets: [CGPoint] = [
        CGPoint(x: 0, y: 0),
        CGPoint(x: 100, y: 0),
        CGPoint(x: 100, y: -100),
        CGPoint(x: -100, y: -100),
        CGPoint(x: -100, y: 0),
        CGPoint(x: 0, y: 0)
    ]
    @State private var currentOffset = 0
    var body: some View {
        ZStack {
            Circle()
                .scaleEffect(0.5)
                .foregroundColor(colors[currentOffset])
        }
        .onAppear {
            for index in 1..<colors.count {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index)) {
                    currentOffset = index
                }
               
            }
        }
        .animation(.default, value: currentOffset)
        .offset(x: offsets[currentOffset].x, y: offsets[currentOffset].y)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
