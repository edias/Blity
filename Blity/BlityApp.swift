//
//  BlityApp.swift
//  Blity
//
//  Created by Eduardo Dias on 25/07/21.
//

import Combine
import SwiftUI

@main
struct BlityApp: App {
    
    private let settingsInitializer = AppSettingsInitializer()
    
    init() {
        settingsInitializer.initialize()
    }
        
    var body: some Scene {
        WindowGroup {
            SummaryView()
        }
    }
}
