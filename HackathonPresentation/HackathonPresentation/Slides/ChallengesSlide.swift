//
//  ChallengesSlide.swift
//  HackathonPresentation
//
//  Created by Eric Groom on 12/8/22.
//

import SwiftUI

struct ChallengesSlide: View {
    @Environment(\.presentationScale) var scale

    var body: some View {
        Slide {
            HStack {
                VStack(alignment: .leading) {
                    Text("Challenges")
                        .font(.custom("SF Mono", size: Theme.titleHeaderSize * scale))
                        .foregroundColor(Color("PalenightCyan"))
                        .padding(.bottom, 16 * scale)
                    TextBody {
                        Group {
                            Text("• Content scaling")
                            Text("• Disassociated backgrounds/foregrounds")
                        }
                        .padding(.leading, 16)
                    }
                    .padding(.bottom, 24 * scale)
                    Text("Future Work")
                        .padding(.bottom, 16 * scale)
                        .font(.custom("SF Mono", size: Theme.titleHeaderSize * scale))
                        .foregroundColor(Color("PalenightYellow"))
                    TextBody {
                        Group {
                            Text("• Better way of keeping track of current slide")
                            Text("• Set of components that automatically scale")
                            Text("• Preview/Notes windows")
                            Text("• Embed screen grabs of other windows")
                            Text("• Execute code and display output")
                            Text("• Laser pointer")
                        }
                        .padding(.leading, 16)
                    }
                    Spacer()
                }
                Spacer()
            }
            .overlay(
                Image("Hooplah")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .position(x: 1400 * scale, y: 600 * scale)
            )
        }
    }
}
