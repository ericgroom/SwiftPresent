//
//  TitledSlide.swift
//  HackathonPresentation
//
//  Created by Eric Groom on 12/8/22.
//

import SwiftUI

struct TitledSlide<Title: View, Content: View>: View {
    @ViewBuilder let title: () -> Title
    @ViewBuilder let content: () -> Content
    @Environment(\.presentationScale) var scale

    var body: some View {
        Slide {
            HStack {
                VStack(alignment: .leading) {
                    title()
                        .padding(.bottom, 84 * scale)
                    content()
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

