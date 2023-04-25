//
//  ColorSliderView.swift
//  ColourizedApp
//
//  Created by Elizabeth on 25/04/2023.
//

import SwiftUI

struct ColorSettingsView: View {
    @Binding var redValue: Double
    @Binding var greenValue: Double
    @Binding var blueValue: Double
    
    @FocusState var isInputActive: Bool
    
    var body: some View {
        VStack(spacing: 30) {
            ColorConfigurationView(value: $redValue, isInputActive: _isInputActive, color: .red)
            ColorConfigurationView(value: $greenValue, isInputActive: _isInputActive,  color: .green)
            ColorConfigurationView(value: $blueValue, isInputActive: _isInputActive, color: .blue)
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    isInputActive = false
                }
            }
        }
        
    }
}

struct TextFieldView: View {
    @Binding var enteredValue: String
    @Binding var value: Double
    @FocusState var isInputActive: Bool
    
    var body: some View {
        TextField(
                "\(lround(value))",
                text: $enteredValue,
                onEditingChanged: { _ in
                    checkValue()
                }
        )
            .textFieldStyle(.roundedBorder)
            .keyboardType(.decimalPad)
            .focused($isInputActive)
            .padding(EdgeInsets(top: 2, leading: 3, bottom: 2, trailing: 3))
            .frame(width: 70, height: 30)
    }
    
    private func checkValue() {
        let enteredNumber = Double(enteredValue) ?? 0
        if enteredNumber >= 1 && enteredNumber <= 255 {
            value = Double(enteredValue) ?? value
        } else {
            enteredValue = "255"
        }
    }
        
}

struct ColorConfigurationView: View {
    @State var enteredValue = ""
    @Binding var value: Double
    
    @FocusState var isInputActive: Bool
    
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .foregroundColor(.white)
    
            ColorSliderView(value: $value, enteredValue: $enteredValue, color: color)
            
            TextFieldView(enteredValue: $enteredValue, value: $value, isInputActive: _isInputActive)
            
        }
    }
}


struct ColorSliderView: View {
    @Binding var value: Double
    @Binding var enteredValue: String
    
    let color: Color
    
    var body: some View {
        Slider(
            value: $value,
            in: 0...250,
            step: 1,
            onEditingChanged: { _ in
                enteredValue = "\(Int(value))"
            }
        )
        .tint(color)
    }
}



