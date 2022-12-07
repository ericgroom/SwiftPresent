//
//  Scaling.swift
//  
//
//  Created by Eric Groom on 12/7/22.
//

import SwiftUI

public struct PresentationScaleKey: EnvironmentKey {
    public static let defaultValue: Double = 1.0
}

public extension EnvironmentValues {
    var presentationScale: Double {
        get { self[PresentationScaleKey.self] }
        set { self[PresentationScaleKey.self] = newValue }
    }
}

@MainActor
class WindowSize: NSObject, ObservableObject, NSWindowDelegate {
    @Published var width: CGFloat = 0.0
    @Published var height: CGFloat = 0.0
    
    private let baselineWidth: CGFloat = 1280
    var scale: CGFloat {
        return round(width / baselineWidth * 10) / 10.0
    }
    
    func configure() {
        guard let window = WindowContainer.shared.window else { return }
        self.width = window.frame.width
        self.height = window.frame.height
    }
    
    nonisolated func windowDidResize(_ notification: Notification) {
        DispatchQueue.main.async {
            self.configure()
        }
    }
}
