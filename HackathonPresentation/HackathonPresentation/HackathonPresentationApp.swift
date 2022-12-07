//
//  HackathonPresentationApp.swift
//  HackathonPresentation
//
//  Created by Eric Groom on 12/7/22.
//

import SwiftUI
import SwiftPresent

@main
struct HackathonPresentationApp: App {
    var body: some Scene {
        Presentation {
            Slides()
                .font(.system(size: 32, weight: .heavy))
        }
    }
}
