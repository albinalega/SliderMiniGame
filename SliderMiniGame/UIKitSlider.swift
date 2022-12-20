//
//  Slider.swift
//  SliderMiniGame
//
//  Created by Альбина Лега on 19.12.2022.
//

import SwiftUI

struct UIKitSlider: UIViewRepresentable {
    
    @Binding var currentValue: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        slider.thumbTintColor = .red
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changeValue),
            for: .allEvents
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
}

extension UIKitSlider {
    class Coordinator: NSObject {
        
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        
        @objc func changeValue(_ sender: UISlider) {
            currentValue = Double(sender.value)
        }
    }
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        UIKitSlider(currentValue: .constant(50))
    }
}
