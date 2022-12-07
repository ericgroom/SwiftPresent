//
//  Slides.swift
//  HackathonPresentation
//
//  Created by Eric Groom on 12/7/22.
//

import SwiftUI

struct Slides: View {
    @State var slideCount = 0
    @Namespace var presentationNamespace
    @Environment(\.presentationScale) var scale
    private let left = 0.15
    private let right = 0.65
    
    var body: some View {
        ZStack {
            ZStack {
                TrollTitleSlide(namespace: presentationNamespace)
                    .background(.white)
                    .mask(
                        TrapezoidThing(leftHeightPercentage: slideCount == 0 ? 1 - right : 0.0, rightHeightPercentage: slideCount == 0 ? 1 - left : 0.0)
                            .scale(x: -1, y: -1, anchor: .center)
                            .fill(.white)
                    )
                TitleSlide(namespace: presentationNamespace)
                    .background(slideCount == 0 ? Color("GoogleSlidesBackground") : Color("PalenightBackground"))
                    .mask(
                        TrapezoidThing(leftHeightPercentage: slideCount == 0 ? left : 1.0, rightHeightPercentage: slideCount == 0 ? right : 1.0)
                .fill(.white)
                    )
                Group {
                    Button {
                        withAnimation {
                            slideCount -= 1
                        }
                    } label: {
                        EmptyView()
                    }
                    .keyboardShortcut(.leftArrow, modifiers: [])
                    Button {
                        withAnimation {
                            slideCount += 1
                        }
                    } label: {
                        EmptyView()
                    }
                    .keyboardShortcut(.rightArrow, modifiers: [])
                }.opacity(0)
            }
        }
    }
}