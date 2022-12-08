//
//  Slides.swift
//  HackathonPresentation
//
//  Created by Eric Groom on 12/7/22.
//

import SwiftUI
import SwiftPresent

struct Slides: View {
    @State var slideCount = 0
    @State var enableBoids = true
    @Namespace var presentationNamespace
    @Environment(\.presentationScale) var scale
    private let left = 0.15
    private let right = 0.65
    private let numberOfSlides = 3
    
    var body: some View {
        ZStack {
            KeyboardShortcuts(shortcuts: [
                (KeyboardShortcut("b", modifiers: [.command]), {
                    self.enableBoids.toggle()
                })
            ])
            SlideTracker {
                Color("PalenightBackground")
                if enableBoids {
                    BoidsCanvas(scatter: false).opacity(0.6)
                }
                switch slideCount {
                case 0, 1:
                    TrollTitleSlide(namespace: presentationNamespace)
                        .background(.white)
                        .mask(
                            TrapezoidThing(leftHeightPercentage: slideCount == 0 ? 1 - right : 0.0, rightHeightPercentage: slideCount == 0 ? 1 - left : 0.0)
                                .scale(x: -1, y: -1, anchor: .center)
                                .fill(.white)
                        )
                    TitleSlide(namespace: presentationNamespace)
                        .background(slideCount == 0 ? Color("GoogleSlidesBackground") : Color.clear)
                        .mask(
                            TrapezoidThing(leftHeightPercentage: slideCount == 0 ? left : 1.0, rightHeightPercentage: slideCount == 0 ? right : 1.0)
                                .fill(.white)
                        )
                case 2:
                    ExplanationSlide()
                        .transition(.scale)
                default:
                    EmptyView()
                }
            } nextSlide: {
                withAnimation { updateSlideCount { $0 + 1} }
            } previousSlide: {
                withAnimation { updateSlideCount { $0 - 1} }
            }
        }
    }
    
    private func updateSlideCount(_ transform: (Int) -> Int) {
        var updated = transform(slideCount)
        if updated < 0 {
            updated = 0
        } else if updated >= numberOfSlides {
            updated = numberOfSlides - 1
        }
        slideCount = updated
    }
}
