//
//  TitleSlide.swift
//  HackathonPresentation
//
//  Created by Eric Groom on 12/7/22.
//

import SwiftUI

struct TitleSlide: View {
    let namespace: Namespace.ID
    @State var blockAbove = false
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    Group {
                        Text("import ").foregroundColor(Color("PalenightMagenta")) + Text("SwiftPresent")
                            .foregroundColor(Color("PalenightForeground"))
                    }
                    .font(.custom("Monaco", size: Theme.headlineSize))
                    .padding(.bottom, 50)
                    Text("A presentation framework for SwiftUI")
                        .font(.custom("SF Mono", size: Theme.subheadlineSize))
                        .foregroundColor(Color("PalenightForegroundSecondary"))
                    Spacer()
                }
                Spacer()
            }.padding(60)
        }
    }
}
