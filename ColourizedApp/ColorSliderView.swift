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
    
    var body: some View {
        VStack(spacing: 30) {
            ColorConfigurationView(value: $redValue, color: .red)
            ColorConfigurationView(value: $greenValue, color: .green)
            ColorConfigurationView(value: $blueValue, color: .blue)
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                }
            }
        }
    }
}
//struct ColorSettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorSettingsView(redValue: red, greenValue: 250, blueValue: 250)
//   }
//}

struct TextFieldView: View {
    @Binding var enteredValue: String
    @Binding var value: Double
    @FocusState var isInputActive: Bool
    
    var body: some View {
        TextField(
                "\(lround(value))",
                text: $enteredValue,
                onEditingChanged: { _ in
                    value = Double(enteredValue) ?? value
                }
        )
            .textFieldStyle(.roundedBorder)
            .keyboardType(.decimalPad)
            .focused($isInputActive)
            .padding(EdgeInsets(top: 2, leading: 3, bottom: 2, trailing: 3))
            .frame(width: 70, height: 30)
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
    
            
            ColorSliderView(value: $value, enteredValue: enteredValue, color: color)
            
            TextFieldView(enteredValue: $enteredValue, value: $value, isInputActive: _isInputActive)
            
        }
    }
}


struct ColorSliderView: View {
    @Binding var value: Double
    @State var enteredValue: String
    
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
