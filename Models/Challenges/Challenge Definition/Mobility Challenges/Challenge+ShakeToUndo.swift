//
//  Challenge+ShakeToUndo.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/2/24.
//

import Foundation
import SwiftUI

extension Challenge {
    static let shakeToUndo = Challenge(feature: "Shake to Undo",
                                       category: .mobility) {
        Conclusion("If you have difficulties with hand tremors, dexterity, or fine motor control, you can turn off Shake to Undo if you unintentionally shake it.")
        
        Hint(one: "Shake.",
             two: "Undo Typing",
             three: "Unintentional shakes.")
        
        Metadata(systemName: "iphone.gen3.radiowaves.left.and.right",
                 color: .cyan.opacity(0.9))
        
        DisableInstructions(Text("Go to **Settings \(Image(systemName: "chevron.right")) Accessibility \(Image(systemName: "chevron.right")) Touch \(Image(systemName: "chevron.right")) Shake to Undo** and toggle Shake to Undo."))
        
        ReferenceResources([
            .web("Adjust how iPhone responds to your touch",
                 url: URL(string: "https://support.apple.com/en-sg/guide/iphone/iph77bcdd132/ios")!)
        ])
        
        DeveloperResources([
            .header("Supporting Shake to Undo Setting",
                    body: "If your app has a custom implementation of Shake to Undo, it is important to respect the user's preference for this setting. You can check if the Shake to Undo setting is enabled and conditionally apply your custom implementation."),
            .code("Detecting Shake to Undo Setting",
                  snippet: "UIAccessibility.isShakeToUndoEnabled",
                  body: "This property allows you to check if the user has disabled Shake to Undo in the device settings.",
                  url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibility/1615103-isshaketoundoenabled")!,
                  relatedFrameworks: [.uiKit, .swiftUI]),
            .code("Observing Shake to Undo Setting",
                  snippet: "private let publisher = NotificationCenter.default.publisher(for: UIAccessibility.shakeToUndoDidChangeNotification)",
                  body: "This property allows you to create a publisher that receives changes based on the Shake to Undo setting.",
                  url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibility/1615095-shaketoundodidchangenotification")!,
                  relatedFrameworks: [.swiftUI]),
            .code("Example",
                  snippet: """
struct MyView: View {
    private let publisher = NotificationCenter.default.publisher(for: UIAccessibility.shakeToUndoDidChangeNotification)
    @State private var isShakeToUndoEnabled = UIAccessibility.isShakeToUndoEnabled

    var body: some View {
        Text(isShakeToUndoEnabled ? "Enabled" : "Disabled")
            .onReceive(publisher) { _ in
                isShakeToUndoEnabled = UIAccessibility.isShakeToUndoEnabled
            }
    }
}
""",
                  body: "This snippet changes the text based on the Shake to Undo setting, updating the view when the setting changes.",
                  relatedFrameworks: [.swiftUI]),
            .code("Observing Shake to Undo Setting",
                  snippet: "UIAccessibility.shakeToUndoDidChangeNotification",
                  body: "This property allows you to listen for any changes to the Shake to Undo preference and update your interface accordingly.",
                  url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibility/1615095-shaketoundodidchangenotification")!,
                  relatedFrameworks: [.uiKit]),
            .hig("Undo and Redo",
                 url: URL(string: "https://developer.apple.com/design/human-interface-guidelines/undo-and-redo")!)
        ])
    }
}
