//
//  ExplanationSlide.swift
//  HackathonPresentation
//
//  Created by Eric Groom on 12/7/22.
//

import SwiftUI

struct ExplanationSlide: View {
    @Environment(\.presentationScale) var scale

    var body: some View {
        TitledSlide {
            Text("What is SwiftPresent?")
                .font(.custom("SF Mono", size: Theme.titleHeaderSize * scale))
                .foregroundColor(Color("PalenightGreen"))
        } content: {
            TextBody {
                Text("An alternative to PowerPoint, Google Sheets, Keynote, etc.")
                    .padding(.bottom, 16 * scale)
                Text("A library to help build presenations in SwiftUI:")
                Group {
                    Text("• Provides a MacOS window at the correct aspect ratio")
                    Text("• Scales content as the window resizes")
                    Text("• Layout utilities for common use cases")
                }
                .padding(.leading, 16)
            }
        }
    }
}

struct ExplanationSlide_Previews: PreviewProvider {
    static var previews: some View {
        ExplanationSlide()
    }
}
