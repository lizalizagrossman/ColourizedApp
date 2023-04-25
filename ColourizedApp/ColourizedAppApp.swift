//
//  ColourizedAppApp.swift
//  ColourizedApp
//
//  Created by Elizabeth on 25/04/2023.
//

import SwiftUI

@main
struct ColourizedAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(redSliderValue: 200, greenSliderValue: 200, blueSliderValue: 100)
        }
    }
}
