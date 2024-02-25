//
//  Challenge+ReduceTransparency.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/2/24.
//

import Foundation
import SwiftUI

extension Challenge {
    static let reduceTransparency = Challenge(feature: "Reduce Transparency",
                                              category: .vision) {
        Conclusion("Improves contrast by reducing transparency and blurs on some backgrounds.")
        
        Hint(one: "That's really distracting.",
             two: "I can't see clearly with that background.",
             three: "I hate blurs and transparencies.")
        
        Metadata(systemName: "square.on.square.intersection.dashed",
                 color: .teal.opacity(0.5))
        
        DisableInstructions(Text("Go to **Settings \(Image(systemName: "chevron.right")) Accessibility \(Image(systemName: "chevron.right")) Display & Text Size \(Image(systemName: "chevron.right")) Reduce Transparency** and toggle Reduce Transparency."))
        
        ReferenceResources([
            .web("Use display and text size preferences on your iPhone, iPad, and iPod touch",
                 url: URL(string: "https://support.apple.com/HT207025")!),
            .web("Adjust the display and text size on iPhone",
                 url: URL(string: "https://support.apple.com/guide/iphone/iph3e2e1fb0/")!),
            .web("Adjust the display and text size on iPad",
                 url: URL(string: "https://support.apple.com/guide/ipad/ipad9a246013/")!)
        ])
        
        DeveloperResources([
            .header("Adapting to Reduce Transparency",
                    body: "The Reduce Transparency feature increases the readability of text and the visibility of interface elements by reducing the transparency and blurring effects across the OS. This feature is particularly beneficial for users with visual impairments or those who prefer simpler visual designs. By supporting Reduce Transparency, developers can ensure their apps are accessible to a wider range of users, enhancing their overall experience.\n\nImplementing support involves detecting the user's preference and applying solid color backgrounds or disabling transparency effects in your app's UI."),
            .code("Detecting Reduce Transparency Setting",
                  snippet: "UIAccessibility.isReduceTransparencyEnabled",
                  body: "This API allows you to check if the user has enabled the Reduce Transparency accessibility setting. Based on this, you can adjust your app’s UI to increase legibility and reduce distractions by minimizing or eliminating transparency and blur effects.",
                  url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibility/1615074-isreducetransparencyenabled/")!,
                  relatedFrameworks: [.uiKit]),
            .code("Detecting Reduce Transparency Setting",
                  snippet: "@Environment(\\.accessibilityReduceTransparency) var isReduceTransparencyEnabled",
                  body: "This allows you to check if the user has enabled the Reduce Transparency accessibility setting. Based on this, you can adjust your app’s UI to increase legibility and reduce distractions by minimizing or eliminating transparency and blur effects.",
                  url: URL(string: "https://developer.apple.com/documentation/swiftui/environmentvalues/accessibilityreducetransparency")!,
                  relatedFrameworks: [.swiftUI]),
            .code("Example",
                  snippet: """
struct MyView: View {
    @Environment(\\.accessibilityReduceTransparency) var isReduceTransparencyEnabled

    var body: some View {
        Text("Hello, World")
            .opacity(isReduceTransparencyEnabled ? 1 : 0)
    }
}
""",
                  body: "This snippet shows how you can conditionally set the opacity of a Text to improve legibility if the Reduce Transparency setting is enabled.",
                  relatedFrameworks: [.swiftUI]),
            .hig("Designing with Accessibility in Mind: Materials",
                 body: "Explore how to design your app's interface to accommodate users who need or prefer less visual complexity. This guide covers strategies for using colors and backgrounds that support Reduce Transparency, ensuring that your app is accessible and easy to use for everyone.",
                 url: URL(string: "https://developer.apple.com/design/human-interface-guidelines/materials")!),
            .hig("Accessible Color and Effects",
                 url: URL(string: "https://developer.apple.com/design/human-interface-guidelines/accessibility#Color-and-effects")!),
            .video("WWDC17: Essential Design Principles for Developers",
                   body: "This session covers fundamental design principles, including how to design for accessibility. It provides insights into accommodating users' needs, such as those who benefit from the Reduce Transparency setting, by simplifying UI elements and focusing on essential content.", 
                   url: URL(string: "https://developer.apple.com/videos/play/wwdc2017/802/")!),
            .article("Improving UI Accessibility with Reduce Transparency",
                     body: "Learn practical tips for improving the accessibility of your UI by supporting Reduce Transparency. This article offers examples of how to modify your app’s visual elements to ensure they remain clear and easy to navigate without relying on transparency effects.", 
                     url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibility/making_your_ui_more_accessible")!,
                     relatedFrameworks: [.uiKit]),
            .header("Testing with Environment Overrides",
                    body: "Xcode's Environment Overrides allow you to enable various accessibility features, including Dynamic Type, on the Simulator. This is useful for quickly testing your app's accessibility features without having a physical device on you.")
        ])

    }
}
