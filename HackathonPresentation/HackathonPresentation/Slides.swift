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
    
    var body: some View {
        ZStack {
            Color.white
            TrapezoidThing(leftHeightPercentage: slideCount == 0 ? 0.15 : 1.0, rightHeightPercentage: slideCount == 0 ? 0.65 : 1.0)
                .fill(slideCount == 0 ? Color("GoogleSlidesBackground") : Color("PalenightBackground"))
            ZStack {
                if slideCount == 0 {
                    TrollTitleSlide(namespace: presentationNamespace)
                } else {
                    TitleSlide(namespace: presentationNamespace)
                }
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
