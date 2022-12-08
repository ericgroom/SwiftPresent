//
//  Slide.swift
//  HackathonPresentation
//
//  Created by Eric Groom on 12/7/22.
//

import SwiftUI

struct Slide<Content: View>: View {
    @ViewBuilder let content: () -> Content
    @Environment(\.presentationScale) var scale
    
    var body: some View {
        ZStack {
            content()
        }
        .padding(.horizontal, 56 * scale)
        .padding(.vertical, 80 * scale)
    }
}
