//
//  Presentation.swift
//  
//
//  Created by Eric Groom on 12/7/22.
//

import SwiftUI

@MainActor
class WindowContainer {
    static let shared = WindowContainer()
    var window: NSWindow?
}

public struct Presentation<Content: View>: Scene {
    let content: () -> Content
    @StateObject private var windowSize = WindowSize()
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    public var body: some Scene {
        WindowGroup {
            content()
                .environment(\.presentationScale, windowSize.scale)
                .edgesIgnoringSafeArea(.top)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
                        if let window = NSApplication.shared.windows.last {
                            WindowContainer.shared.window = window
                            window.contentAspectRatio = NSSize(width: 16.0, height: 9.0)
                            window.delegate = windowSize
                            windowSize.configure()
                        }
                    }
                    NSEvent.addLocalMonitorForEvents(matching: [.mouseMoved]) { event in
                        guard
                            let window = event.window,
                            window == WindowContainer.shared.window,
                            let toolbarView = window.toolbarView
                        else { return event }
                        let height = window.frame.height
                        if abs(event.locationInWindow.y - height) <= toolbarView.frame.height {
                            toolbarView.alphaValue = 1.0
                        } else {
                            toolbarView.alphaValue = 0.0
                        }
                        return event
                    }
                }
        }
        .commands {
            CommandGroup(after: .windowSize) {
                Toggle("Content Scaling", isOn: $windowSize.scalingEnabled)
            }
        }
    }
}

extension NSWindow {
    var toolbarView: NSView? {
        standardWindowButton(.closeButton)?.superview?.superview
    }
}
