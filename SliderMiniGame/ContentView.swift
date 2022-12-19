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
    @State private var score = 0
    
    var body: some View {
        VStack {
            
            Text("Продвиньте слайдер как можно ближе к: \(targetValue)")
                .padding(.bottom, 20)
            
            HStack {
                Text("0")
                UIKitSlider(currentValue: $currentValue)
                Text("100")
            }
            
            Button("Проверь меня!") {
                score = computeScore()
                alertPresented = true
            }
            .alert(isPresented: $alertPresented) {
                Alert(
                    title: Text("Ваш счет"),
                    message: Text(score.formatted()),
                    dismissButton: .default(Text("OK")) {
                        targetValue = Int.random(in: 1...100)
                        currentValue = 50
                    }
                )
            }
            .padding(10)
            
            ButtonView(title: "Начать заново", action: startAgain)
            
        }
        .padding()
    }
    
    private func startAgain() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ButtonView: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
