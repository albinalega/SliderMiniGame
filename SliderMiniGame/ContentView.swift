//
//  ContentView.swift
//  SliderMiniGame
//
//  Created by Альбина Лега on 19.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue = 50.0
    
    var body: some View {
        VStack {
            HStack {
                Text("Продвиньте слайдер как можно ближе к:")
                Text("50")
            }
            .padding(.bottom, 20)
            
            SliderView(value: $sliderValue)
            
            ButtonView(title: "Проверь меня!", action: {})
                .padding()
            
            ButtonView(title: "Начать заново", action: {})
            
        }
        .padding()
    }
}

struct SliderView: View {
    @Binding var value: Double
    
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $value, in: 0...100)
            Text("100")
        }
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
