//
//  MotivationSlide.swift
//  HackathonPresentation
//
//  Created by Eric Groom on 12/8/22.
//

import SwiftUI

struct MotivationSlide: View {
    @Environment(\.presentationScale) var scale

    var body: some View {
        TitledSlide {
            Text("Why is SwiftPresent?")
                .font(.custom("SF Mono", size: Theme.titleHeaderSize * scale))
                .foregroundColor(Color("PalenightRed"))
        } content: {
            TextBody {
                Text("A simple way to create complex, dynamic presentations")
                    .padding(.bottom, 16 * scale)
                Group {
                    Text("• I already know SwiftUI")
                    Text("• Possibilities are limitless")
                    Text("• Wanted to practice animations and layouts")
                    Text("• With the right framework it could be as fast as dedicated tool")
                }
                .padding(.leading, 16)
            }
        }
    }
}
