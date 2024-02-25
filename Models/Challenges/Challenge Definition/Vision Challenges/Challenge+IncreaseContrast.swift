//
//  Challenge+IncreaseContrast.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/2/24.
//

import Foundation
import SwiftUI

extension Challenge {
    static let increaseContrast = Challenge(feature: "Increase Contrast",
                                            category: .vision) {
        Conclusion("Improves colour contrast between app foreground and background colors.")
        
        Hint(one: "What does the text say?",
             two: "Some backgrounds are challenging.",
             three: "Can we fix the colours?")
        
        Metadata(systemName: "circle.righthalf.filled",
                 color: .teal.opacity(0.7))
        
        DisableInstructions(Text("Go to **Settings \(Image(systemName: "chevron.right")) Accessibility \(Image(systemName: "chevron.right")) Display & Text Size \(Image(systemName: "chevron.right")) Increase Contrast** and toggle Increase Contrast."))
        
        ReferenceResources([
            .web("Use display and text size preferences on your iPhone, iPad, and iPod touch",
                 url: URL(string: "https://support.apple.com/HT207025")!),
            .web("Adjust the display and text size on iPhone",
                 url: URL(string: "https://support.apple.com/guide/iphone/iph3e2e1fb0/")!),
            .web("Adjust the display and text size on iPad",
                 url: URL(string: "https://support.apple.com/guide/ipad/ipad9a246013/")!)
        ])
        
        DeveloperResources([
            // Existing resources...
            
            .header("Supporting Increase Contrast",
                    body: "The Increase Contrast feature enhances the readability of text and the clarity of graphical elements for users with vision impairments. By supporting this feature, you ensure your app's interface is accessible to a broader audience, enhancing user experience for those who require higher contrast ratios to navigate and interact with your app effectively.\n\nYou can support Increase Contrast by using high contrast color schemes, ensuring text and UI elements adapt to the user's contrast settings, and testing your app with these settings enabled."),
            .code("Detecting Increase Contrast Setting",
                  snippet: "UIAccessibility.isDarkerSystemColorsEnabled",
                  body: "This property allows you to check if the user has enabled the Increase Contrast option in their device settings. You can use this to adjust your app's color scheme and graphical elements accordingly.",
                  url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibility/1615087-isdarkersystemcolorsenabled")!,
                  relatedFrameworks: [.uiKit, .swiftUI]),
            .code("Observing Increase Contrast Setting",
                  snippet: "private let publisher = NotificationCenter.default.publisher(for: UIAccessibility.darkerSystemColorsStatusDidChangeNotification)",
                  body: "This property allows you to create a publisher that receives changes based on the Increase Contrast setting. You can use this to update your interface when the user changes this setting.",
                  url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibility/1615177-darkersystemcolorsstatusdidchang")!,
                  relatedFrameworks: [.swiftUI]),
            .code("Example",
                  snippet: """
struct MyView: View {
    private let publisher = NotificationCenter.default.publisher(for: UIAccessibility.darkerSystemColorsStatusDidChangeNotification)
    @State private var isIncreaseContrastEnabled = UIAccessibility.isDarkerSystemColorsEnabled

    var body: some View {
        Text(isIncreaseContrastEnabled ? "Enabled" : "Disabled")
            .onReceive(publisher) { _ in
                isIncreaseContrastEnabled = UIAccessibility.isDarkerSystemColorsEnabled
            }
    }
}
""",
                  body: "This snippet changes the text based on the Increase Contrast setting, updating the view when the setting changes.",
                  relatedFrameworks: [.swiftUI]),
            .code("Observing Increase Contrast Setting",
                  snippet: "UIAccessibility.darkerSystemColorsStatusDidChangeNotification",
                  body: "This property allows you to listen for any changes to the Increase Contrast preference and update your interface accordingly.",
                  url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibility/1615177-darkersystemcolorsstatusdidchang")!,
                  relatedFrameworks: [.uiKit]),
            .hig("Designing for Higher Contrast",
                 body: "Learn how to design your app with higher contrast in mind, ensuring that text is readable and interfaces are clear under increased contrast settings. This guide includes best practices for color choice, text against background contrast, and graphical element clarity.",
                 url: URL(string: "https://developer.apple.com/design/human-interface-guidelines/color#Inclusive-color")!),
            .header("Testing with Environment Overrides",
                    body: "Xcode's Environment Overrides allow you to enable various accessibility features, including Differentiate Without Color, on the Simulator. This is useful for quickly testing your app's accessibility features without having a physical device on you.")
        ])

    }
}
