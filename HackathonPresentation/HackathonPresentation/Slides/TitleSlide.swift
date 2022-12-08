//
//  TitleSlide.swift
//  HackathonPresentation
//
//  Created by Eric Groom on 12/7/22.
//

import SwiftUI

struct TitleSlide: View {
    let namespace: Namespace.ID
    @Environment(\.presentationScale) var scale
    
    var body: some View {
        Slide {
            HStack {
                VStack(alignment: .leading) {
                    Group {
                        Text("import ").foregroundColor(Color("PalenightMagenta")) + Text("SwiftPresent")
                            .foregroundColor(Color("PalenightForeground"))
                    }
                    .font(.custom("SF Mono", size: Theme.headlineSize * scale))
                    .padding(.bottom, 84 * scale)
                    Text("A presentation framework for SwiftUI")
                        .font(.custom("Monaco", size: Theme.subheadlineSize * scale))
                        .foregroundColor(Color("PalenightForegroundSecondary"))
                    Spacer()
                }
                Spacer()
            }
        }
    }
}
