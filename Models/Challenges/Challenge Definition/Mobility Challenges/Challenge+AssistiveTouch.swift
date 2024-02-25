//
//  Challenge+AssistiveTouch.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/2/24.
//

import Foundation
import SwiftUI

extension Challenge {
    static let assistiveTouch = Challenge(feature: "AssistiveTouch",
                                          category: .mobility) {
        Conclusion("Adapt your touchscreen to ﬁt your physical needs. If certain gestures, like pinch or tap, don’t work for you, swap them with a gesture that does or create a touch that’s all your own. You can customize the layout of the AssistiveTouch menu too, or create an alternative to pressing the Home button — a simple onscreen tap. And you can connect a Bluetooth mouse or joystick to control an onscreen pointer for navigation.\n\niPhone and iPad performs a selected action when you hold the cursor still on a screen element or an area of the screen, this is called Dwell Control and can be set up under AssistiveTouch.")
        
        Hint(one: "Gestures are a challenge.",
             two: "Buttons can be challenging too.",
             three: "Touch is hard.")
        
        Metadata(systemName: "dot.circle.and.hand.point.up.left.fill",
                 color: .cyan)
        
        DisableInstructions(Text("Go to **Settings \(Image(systemName: "chevron.right")) Accessibility \(Image(systemName: "chevron.right")) Touch \(Image(systemName: "chevron.right")) AssistiveTouch \(Image(systemName: "chevron.right")) AssistiveTouch** and toggle AssistiveTouch."))
        
        ReferenceResources([
            .web("Use AssistiveTouch on your iPhone, iPad, or iPod touch",
                 url: URL(string: "https://support.apple.com/HT202658")!),
            .web("Use AssistiveTouch on iPad",
                 url: URL(string: "https://support.apple.com/guide/ipad/ipad9a2466d3/")!),
            .web("Connect a Bluetooth mouse or trackpad to your iPad",
                 url: URL(string: "https://support.apple.com/HT211009")!),
            .video("How to use AssistiveTouch on your iPhone",
                   url: URL(string: "https://youtu.be/_j4-NTg3QsE")!),
            .video("How to customize AssistiveTouch",
                   url: URL(string: "https://youtu.be/3id4BJ4eSQg")!)
        ])
        
        DeveloperResources([
            .header("Supporting AssistiveTouch",
                    body: "AssistiveTouch helps users with physical disabilities by providing an on-screen, customizable menu that allows them to perform gestures, interact with the device, and access shortcuts with single taps. While AssistiveTouch is primarily a system-level feature, ensuring your app works seamlessly with it can greatly enhance accessibility and usability for users relying on this aid.\n\nSupporting AssistiveTouch involves ensuring that your app's interfaces are fully accessible via simple taps and that custom gestures or actions can be easily replicated through the AssistiveTouch menu. It's also important to consider how AssistiveTouch interacts with your app's unique features and to design your UI and gesture controls with this tool in mind."),
            .code("Detecting AssistiveTouch Setting",
                  snippet: "UIAccessibility.isAssistiveTouchRunning",
                  body: "This property allows you to check if the user has enabled AssistiveTouch in the device settings.",
                  url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibility/1648479-isassistivetouchrunning")!,
                  relatedFrameworks: [.uiKit, .swiftUI]),
            .code("Observing AssistiveTouch Setting",
                  snippet: "private let publisher = NotificationCenter.default.publisher(for: UIAccessibility.assistiveTouchStatusDidChangeNotification)",
                  body: "This property allows you to create a publisher that receives changes based on the AssistiveTouch setting.",
                  url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibility/1648473-assistivetouchstatusdidchangenot")!,
                  relatedFrameworks: [.swiftUI]),
            .code("Example",
                  snippet: """
struct MyView: View {
    private let publisher = NotificationCenter.default.publisher(for: UIAccessibility.assistiveTouchStatusDidChangeNotification)
    @State private var isAssistiveTouchRunning = UIAccessibility.isAssistiveTouchRunning

    var body: some View {
        Text(isAssistiveTouchRunning ? "Enabled" : "Disabled")
            .onReceive(publisher) { _ in
                isAssistiveTouchRunning = UIAccessibility.isAssistiveTouchRunning
            }
    }
}
""",
                  body: "This snippet changes the text based on the AssistiveTouch setting, updating the view when the setting changes.",
                  relatedFrameworks: [.swiftUI]),
            .code("Observing AssistiveTouch Setting",
                  snippet: "UIAccessibility.assistiveTouchStatusDidChangeNotification",
                  body: "This property allows you to listen for any changes to the AssistiveTouch preference and update your interface accordingly.",
                  url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibility/1648473-assistivetouchstatusdidchangenot")!,
                  relatedFrameworks: [.uiKit]),
            .hig("Accessibility — Interactions",
                 url: URL(string: "https://developer.apple.com/design/human-interface-guidelines/accessibility#Interactions")!,
                 relatedFrameworks: [.uiKit, .swiftUI]),
        ])

    }
}
