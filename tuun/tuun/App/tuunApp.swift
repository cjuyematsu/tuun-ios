//
//  tuunApp.swift
//  tuun
//
//  Created on 10/18/25.
//

import SwiftUI
import CoreText

@main
struct tuunApp: App {
    @State private var selectedTab: Tab = .home
    
    init() {
        registerFonts()
    }

    var body: some Scene {
        WindowGroup {
            TabBar(selectedTab: $selectedTab)
        }
    }

    private func registerFonts() {
        let fontNames = ["Aleo-Regular", "Aleo-Bold"]
        
        for fontName in fontNames {
            guard let fontURL = Bundle.main.url(forResource: fontName, withExtension: "ttf") else {
                print("Could not find font file \(fontName).ttf in bundle.")
                continue
            }
            
            var error: Unmanaged<CFError>?
            CTFontManagerRegisterFontsForURL(fontURL as CFURL, .process, &error)
        }
    }
}
