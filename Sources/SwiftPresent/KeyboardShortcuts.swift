//
//  KeyboardShortcuts.swift
//  HackathonPresentation
//
//  Created by Eric Groom on 12/8/22.
//

import SwiftUI

public struct KeyboardShortcuts: View {
    public let shortcuts: [(KeyboardShortcut, () -> Void)]
    
    public init(shortcuts: [(KeyboardShortcut, () -> Void)]) {
        self.shortcuts = shortcuts
    }
    
    public var body: some View {
        Group {
            ForEach(shortcuts, id: \.0) { shortcut in
                Button(action: shortcut.1, label: { EmptyView() })
                    .keyboardShortcut(shortcut.0)
            }
        }.opacity(0)
    }
}
