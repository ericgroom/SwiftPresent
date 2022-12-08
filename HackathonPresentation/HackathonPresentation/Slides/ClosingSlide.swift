//
//  ClosingSlide.swift
//  HackathonPresentation
//
//  Created by Eric Groom on 12/8/22.
//

import SwiftUI

struct ClosingSlide: View {
    @Environment(\.presentationScale) var scale
    
    var body: some View {
        VStack {
            Text("Get SwiftPresent v0.1 at:")
                .font(.custom("SF Mono", size: Theme.titleHeaderSize * scale))
                .foregroundColor(Color("PalenightGreen"))
                .padding(.bottom, 16 * scale)
            Text("github.com/ericgroom/SwiftPresent")
                .font(.custom("SF Mono", size: Theme.bodySize * scale))
                .foregroundColor(Color("PalenightBlue"))
        }
    }
}
