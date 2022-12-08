//
//  SlideTracker.swift
//  HackathonPresentation
//
//  Created by Eric Groom on 12/8/22.
//

import SwiftUI

public struct SlideTracker<Content: View>: View {
    public let content: () -> Content
    public let nextSlide: () -> Void
    public let previousSlide: () -> Void
    
    public init(@ViewBuilder content: @escaping () -> Content, nextSlide: @escaping () -> Void, previousSlide: @escaping () -> Void) {
        self.content = content
        self.nextSlide = nextSlide
        self.previousSlide = previousSlide
    }

    public var body: some View {
        ZStack {
            KeyboardShortcuts(shortcuts: [
                (KeyboardShortcut(.leftArrow, modifiers: []), {
                    previousSlide()
                }),
                (KeyboardShortcut(.rightArrow, modifiers: []), {
                    nextSlide()
                }),
            ])
            content()
        }
    }
}
