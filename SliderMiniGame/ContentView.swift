//
//  ContentView.swift
//  SliderMiniGame
//
//  Created by Альбина Лега on 19.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentValue = 50.0
    @State private var targetValue = Int.random(in: 1...100)
    @State private var alertPresented = false
    
    var body: some View {
        VStack {
            Text("Продвиньте слайдер как можно ближе к: \(targetValue)")
                .padding(.bottom, 20)
            
            HStack {
                Text("0")
                UIKitSlider(value: $currentValue, alpha: computeScore())
                Text("100")
            }
            
            Button("Проверь меня!") {
                alertPresented.toggle()
            }
            .alert("Your Score", isPresented: $alertPresented, actions: {}) {
                Text(computeScore().formatted())
            }
            .padding(10)
            
            Button("Начать заново") {
                targetValue = Int.random(in: 1...100)
                currentValue = 50
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
