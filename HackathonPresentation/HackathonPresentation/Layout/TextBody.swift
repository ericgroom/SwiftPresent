//
//  TextBody.swift
//  HackathonPresentation
//
//  Created by Eric Groom on 12/8/22.
//

import SwiftUI

struct TextBody<Content: View>: View {
    @ViewBuilder let content: () -> Content
    @Environment(\.presentationScale) var scale
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16 * scale) {
            content()
        }
        .font(.custom("Monaco", size: Theme.bodySize * scale))
    }
}
