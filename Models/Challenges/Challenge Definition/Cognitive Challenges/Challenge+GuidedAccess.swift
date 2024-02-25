//
//  Challenge+GuidedAccess.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/2/24.
//

import Foundation
import SwiftUI

extension Challenge {
    static let guidedAccess = Challenge(feature: "Guided Access",
                                        category: .cognitive) {
        Conclusion("Guided Access helps you stay focused on the task (or app) at hand. You can limit a device to stay on one app at a time by disabling the Home button. You can even restrict access to the keyboard or touch input on certain areas of the screen so wandering taps and gestures won’t distract. Whether you’re a parent, a teacher, or just trying to help yourself focus, you have all the options you need to customize your experience on Apple products.")
        
        Hint(one: "Don't leave me.",
             two: "You're trapped here!",
             three: "Until you enter a password.")
        
        Metadata(systemName: "lock.iphone",
                 color: .pink)
        
        DisableInstructions(Text("Triple-Click the Home Button or Sleep/Wake button to disable Guided Access."))
        
        ReferenceResources([
            .web("Use Guided Access with iPhone, iPad, and iPod touch", url: URL(string: "https://support.apple.com/HT202612")!),
            .video("How to use Guided Access on iPad",
                   url: URL(string: "https://youtu.be/JkDtljBD1Fw")!)
        ])
        
        DeveloperResources([
            .header("Integrating Closed Captions and SDH",
                    body: "Guided Access helps users with attention and sensory challenges stay focused on a single app by temporarily restricting their device to that app. It also allows the disabling of areas of the screen that aren’t relevant to a task, or the limiting of physical buttons. Supporting Guided Access in your app can enhance its accessibility for users with special needs, providing a more controlled and distraction-free environment.\n\nTo ensure your app is compatible with Guided Access, test its functionality within this mode. Pay special attention to how the app behaves when certain screen areas are disabled and ensure that essential features remain accessible. Additionally, consider providing guidance within your app or its documentation on how to use it effectively with Guided Access."),
            .code("Checking if Guided Access is Enabled",
                  snippet: "UIAccessibility.isGuidedAccessEnabled",
                  body: "This property allows you to check if the user has Guided Access enabled and actively running.",
                  url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibility/1615173-isguidedaccessenabled")!,
                  relatedFrameworks: [.uiKit, .swiftUI]),
            .code("Observing Changes to Guided Access Setting",
                  snippet: "private let publisher = NotificationCenter.default.publisher(for: UIAccessibility.guidedAccessStatusDidChangeNotification)",
                  body: "This property allows you to create a publisher that receives changes based on the Guided Access state.",
                  url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibility/1615105-guidedaccessstatusdidchangenotif")!,
                  relatedFrameworks: [.swiftUI]),
            .code("Example",
                  snippet: """
struct MyView: View {
    private let publisher = NotificationCenter.default.publisher(for: UIAccessibility.guidedAccessStatusDidChangeNotification)
    @State private var isGuidedAccessEnabled = UIAccessibility.isGuidedAccessEnabled

    var body: some View {
        Text(isGuidedAccessEnabled ? "Enabled" : "Disabled")
            .onReceive(publisher) { _ in
                isGuidedAccessEnabled = UIAccessibility.isGuidedAccessEnabled
            }
    }
}
""",
                  body: "This snippet changes the text based on the Guided Access state, updating the view when the setting changes.",
                  relatedFrameworks: [.swiftUI]),
            .code("Observing Changes to Guided Access Setting",
                  snippet: "UIAccessibility.guidedAccessStatusDidChangeNotification",
                  body: "This property allows you to listen for any changes to the Guided Access state and update your interface accordingly.",
                  url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibility/1615105-guidedaccessstatusdidchangenotif")!,
                  relatedFrameworks: [.uiKit])
        ])
    }
}
