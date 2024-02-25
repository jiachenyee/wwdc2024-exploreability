//
//  Challenge+VoiceOver.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/2/24.
//

import Foundation
import SwiftUI

extension Challenge {
    static let voiceOver = Challenge(feature: "VoiceOver", category: .vision) {
        Conclusion("VoiceOver is an industry‑leading screen reader that describes exactly what’s happening on your device. Auditory descriptions of onscreen elements help you easily navigate your screen through a Bluetooth keyboard or simple gestures on a touchscreen. And with unique rotor gestures that function like a dial, you can make content such as websites a breeze to browse.\n\nWith on‑device intelligence in iOS, VoiceOver can describe images in full sentences and read aloud text in an image. You can use the Camera and Photos apps with VoiceOver, even if you can’t see the screen. VoiceOver can provide image descriptions, and you can even add your own descriptions using Markup.")
        
        Metadata(systemName: "rectangle.3.group.bubble.left",
                 color: .teal)
        
        Hint(one: "Tap, Swipe, Swipe, Double-Tap.",
             two: "Listen carefully.",
             three: "A helpful voice.")
        
        DisableInstructions(Text("1. If you used Accessibility Shortcut, triple-click your Home or Sleep/Wake Button to disable.\n2. Alternatively, ask Siri to disable VoiceOver.\n3. Otherwise, go to **Settings \(Image(systemName: "chevron.right")) Accessibility \(Image(systemName: "chevron.right")) VoiceOver \(Image(systemName: "chevron.right")) VoiceOver** and toggle VoiceOver."))
        
        ReferenceResources([
            .web("Turn on and practice VoiceOver on iPhone",
                 url: URL(string: "https://support.apple.com/guide/iphone/iph3e2e415f/ios")!),
            .web("Turn on and practice VoiceOver on iPad",
                 url: URL(string: "https://support.apple.com/guide/ipad/ipad9a246898/ipados")!),
            .web("About the VoiceOver rotor on iPhone, iPad, and iPod touch",
                 url: URL(string: "https://support.apple.com/HT204783")!),
            .web("Use VoiceOver for images and videos on iPhone",
                 url: URL(string: "https://support.apple.com/guide/iphone/iph37e6b3844/ios")!),
            .video("How to navigate with VoiceOver",
                   url: URL(string: "https://youtu.be/qDm7GiKra28")!),
            .video("How to use Screen Curtain with VoiceOver",
                   url: URL(string: "https://youtu.be/lCHdVdocouw")!),
            .video("How to drag a slider with VoiceOver",
                   url: URL(string: "https://youtu.be/OvmkFfEbewg")!),
            .video("How to organize apps with the VoiceOver rotor",
                   url: URL(string: "https://youtu.be/w2Ds-I2L6PI")!),
            .video("How to choose a new voice for VoiceOver on iPhone and iPad",
                   url: URL(string: "https://youtu.be/T6ols9d9urQ")!),
            .video("How to hear image descriptions in the Camera app on iPhone, iPad, and iPod touch",
                   url: URL(string: "https://youtu.be/UnoeaUpHKxY")!)
        ])
        
        DeveloperResources([
            .header("Integrating VoiceOver Support",
                    body: "VoiceOver is a screen reading feature that helps users with visual impairments navigate and interact with your app using auditory descriptions. Integrating VoiceOver support involves ensuring all UI elements are properly labeled, actionable items are announced correctly, and custom actions are accessible. By making your app VoiceOver-compatible, you significantly enhance its usability and accessibility, providing a seamless experience for visually impaired users.\n\nEffective VoiceOver integration requires thorough testing with the VoiceOver utility, use of semantic labels for UI elements, and ensuring that all interactive elements are fully accessible."),
            .code("Enabling VoiceOver Accessibility Labels",
                  snippet: ".accessibilityLabel(\"Check Out\")",
                  body: "Use accessibility labels to provide spoken descriptions of UI elements for VoiceOver users. These labels should succinctly describe the element’s purpose. For interactive elements, ensure the description includes the type of action that will occur when activated.",
                  url: URL(string: "https://developer.apple.com/documentation/swiftui/view/accessibilitylabel(_:)-1d7jv")!,
                  relatedFrameworks: [.swiftUI]),
            .code("Checking if VoiceOver is Running",
                  snippet: "@Environment(\\.accessibilityVoiceOverEnabled) var isVoiceOverRunning",
                  url: URL(string: "https://developer.apple.com/documentation/swiftui/environmentvalues/accessibilityvoiceoverenabled")!,
                  relatedFrameworks: [.swiftUI]),
            .code("Enabling VoiceOver Accessibility Labels",
                  snippet: "myButton.accessibilityLabel = \"Check Out\"",
                  body: "Use accessibility labels to provide spoken descriptions of UI elements for VoiceOver users. These labels should succinctly describe the element’s purpose. For interactive elements, ensure the description includes the type of action that will occur when activated.",
                  url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibilityelement/1619577-accessibilitylabel")!,
                  relatedFrameworks: [.uiKit]),
            .article("Making Your iOS App Accessible with VoiceOver",
                   body: "This comprehensive guide walks through the process of making your app accessible with VoiceOver. It covers best practices for labeling elements, testing your app with VoiceOver, and customizing the VoiceOver experience to fit the needs of your users.",
                     url: URL(string: "https://developer.apple.com/documentation/uikit/accessibility_for_uikit/supporting_voiceover_in_your_app")!,
                   relatedFrameworks: [.uiKit]),
            .article("SwiftUI Accessibility Fundamentals",
                     url: URL(string: "https://developer.apple.com/documentation/swiftui/accessibility-fundamentals")!,
                     relatedFrameworks: [.swiftUI]),
            .article("WWDC21 Challenge: VoiceOver Maze",
                     body: "Escape from Castle Park entirely with VoiceOver! Challenge yourself and learn about how VoiceOver works.",
                     url: URL(string: "https://developer.apple.com/news/?id=s0tca9uk")),
            .video("WWDC21: SwiftUI Accessibility: Beyond the basics",
                   body: "Explore the latest features and improvements in VoiceOver introduced at WWDC21. This session provides insights into new tools and capabilities available to developers, helping you make your app more accessible and intuitive for VoiceOver users.",
                   url: URL(string: "https://developer.apple.com/videos/play/wwdc2021/10119/")!),
            .video("WWDC20: VoiceOver efficiency with custom rotors",
                   url: URL(string: "https://developer.apple.com/videos/play/wwdc2020/10116")!,
                   relatedFrameworks: [.uiKit]),
            .article("VoiceOver: Ensuring Your App Is Accessible to Visually Impaired Users",
                     body: "Discover strategies for ensuring your app is fully accessible to VoiceOver users. This article discusses common pitfalls in accessibility and how to address them, including the importance of testing your app with VoiceOver to identify and correct issues.",
                     url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibility/identifying_and_correcting_accessibility_issues_with_voiceover")!,
                     relatedFrameworks: [.uiKit, .swiftUI]),
            .video("WWDC19: Accessibility Inspector",
                   body: "The Accessibility Inspector tool in Xcode allows developers to simulate VoiceOver interactions and audit their app’s accessibility. This tool is invaluable for identifying areas where your app may not fully meet the needs of users relying on VoiceOver.",
                   url: URL(string: "https://developer.apple.com/videos/play/wwdc2019/257/")!),
            .article("Accessibility Inspector",
                     url: URL(string: "https://developer.apple.com/documentation/accessibility/accessibility-inspector/")!),
        ])

    }
}
