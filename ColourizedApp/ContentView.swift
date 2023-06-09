//
//  ContentView.swift
//  ColourizedApp
//
//  Created by Elizabeth on 24/04/2023.
//

import SwiftUI


struct ContentView: View {
    @State var redSliderValue = 0.0
    @State var greenSliderValue = 0.0
    @State var blueSliderValue = 0.0
    
    
    var body: some View {
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            VStack(spacing: 30) {
                ColorView(redValue: redSliderValue, greenValue: greenSliderValue, blueValue: blueSliderValue)
                ColorSettingsView(redValue: $redSliderValue, greenValue: $greenSliderValue, blueValue: $blueSliderValue)
                
                Spacer()
            }
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
        }
        .onTapGesture {
                    self.endEditing()
                }
    }
    private func endEditing() {
            UIApplication.shared.endEditing()
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(redSliderValue: 200, greenSliderValue: 100, blueSliderValue: 100)
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

    



