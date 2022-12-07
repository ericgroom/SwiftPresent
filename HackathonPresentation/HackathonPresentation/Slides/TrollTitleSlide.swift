//
//  TrollTitleSlide.swift
//  HackathonPresentation
//
//  Created by Eric Groom on 12/7/22.
//

import SwiftUI

struct TrollTitleSlide: View {
    let namespace: Namespace.ID
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("SwiftPresent")
                        .font(.custom("Merriweather", size: Theme.headlineSize))
                        .foregroundColor(Color("GoogleSlidesForeground"))
                        .padding(.bottom, 50)
                    Text("A presentation framework for SwiftUI")
                        .font(.custom("Roboto", size: Theme.subheadlineSize))
                        .foregroundColor(Color("GoogleSlidesForegroundSecondary"))
                    Spacer()
                }
                Spacer()
            }.padding(60)
        }
    }
}

struct TrapezoidThing: Shape {
    var leftHeightPercentage: CGFloat
    var rightHeightPercentage: CGFloat
    
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { AnimatablePair(leftHeightPercentage, rightHeightPercentage)}
        set {
            self.leftHeightPercentage = newValue.first
            self.rightHeightPercentage = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let leftHeight = rect.height - leftHeightPercentage * rect.height
        let rightHeight = rect.height - rightHeightPercentage * rect.height
        path.move(to: CGPoint(x: rect.minX, y: leftHeight))
        path.addLine(to: CGPoint(x: rect.maxX, y: rightHeight))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: leftHeight))
        return path
    }
}

