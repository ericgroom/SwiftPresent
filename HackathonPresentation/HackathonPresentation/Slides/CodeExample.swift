//
//  CodeExample.swift
//  HackathonPresentation
//
//  Created by Eric Groom on 12/8/22.
//

import SwiftUI
import Splash

struct CodeExample: View {
    @Environment(\.presentationScale) var scale
    @State private var showBlobs = false
    
    var body: some View {
        TitledSlide {
            Text("Code!?")
                .font(.custom("SF Mono", size: Theme.titleHeaderSize * scale))
                .foregroundColor(Color("PalenightYellow"))
        } content: {
            ZStack {
                if showBlobs {
                    codeBlob(helloWorld)
                        .offset(x: -450 * scale, y: -200 * scale)
                        .transition(transition(delay: 0))
                    codeBlob(functors)
                        .offset(x: -450 * scale, y: 75 * scale)
                        .transition(transition(delay: 0.1))
                    codeBlob(aocDay1)
                        .offset(x: 0 * scale, y: 200 * scale)
                        .transition(transition(delay: 0.2))
                    codeBlob(swiftUI)
                        .offset(x: 200 * scale, y: -150 * scale)
                        .transition(transition(delay: 0.3))
                    HStack {
                        Spacer()
                        VStack {
                            Spacer()
                            Text("Syntax Highlighting with Splash by John Sundell :)")
                                .font(.custom("SF Mono", size: 12))
                                .foregroundColor(Color("PalenightForeground"))
                                .offset(x: 30 * scale, y: 65 * scale)
                        }
                    }
                }
            }
            .onAppear {
                withAnimation(.spring()) {
                    showBlobs = true
                }
            }
        }
    }
    
    func codeBlob(_ str: String) -> some View {
        TextBody {
            code(str)
                .minimumScaleFactor(0.5)
        }
        .padding(16)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("PalenightBackground"))
                .shadow(radius: 20)
        }
    }
    
    func code(_ str: String) -> Text {
        return Text(AttributedString(highlighter.highlight(str)))
    }
    
    func transition(delay: Double) -> AnyTransition {
        AnyTransition.identity
            .combined(with: .scale)
            .animation(.default.delay(delay))
    }
    
    var helloWorld: String {
        #"""
        /*
         This is a comment
        */
        print("Hello, world!")
        """#
    }
    
    var functors: String {
        #"""
        // ❤️ functors
        let timesTwo = { $0 * 2 }
        [1, 2, 3].map(timesTwo)
        Optional(3).map(timesTwo)
        """#
    }
    
    var aocDay1: String {
        #"""
        let lembas = input.components(separatedBy: "\n\n")
            .map { $0.components(separatedBy: .newlines).compactMap { Int($0, radix: 10) }.reduce(0, +) }
            .sorted(by: >)
            .prefix(3)
        """#
    }
    
    var swiftUI: String {
        #"""
        import SwiftUI
        import SwiftPresent
        
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
        """#
    }
    
    var highlighter: Splash.SyntaxHighlighter<AttributedStringOutputFormat> {
        return SyntaxHighlighter(format: AttributedStringOutputFormat(theme: theme))
    }
    
    var theme: Splash.Theme {
        Splash.Theme(font: .init(size: Theme.bodySize * scale), plainTextColor: .init(Color("PalenightForeground")), tokenColors: [
            .call: .init(Color("PalenightGreen")),
            .string: .init(Color("PalenightMagenta")),
            .comment: .init(Color(red: 67.0 / 255.0, green: 71.0 / 255.0, blue: 88.0 / 255.0)),
            .number: .init(Color("PalenightBlue")),
            .type: .init(Color("PalenightGreen")),
            .keyword: .init(Color("PalenightMagenta")),
            .dotAccess: .init(Color("PalenightForeground")),
            .property: .init(Color("PalenightForeground")),
        ])
    }
}
