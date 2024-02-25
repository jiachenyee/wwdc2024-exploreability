//
//  Challenge+DifferentiateWithoutColour.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/2/24.
//

import Foundation
import SwiftUI

extension Challenge {
    static let differentiateWithoutColour = Challenge(feature: "Differentiate Without Colour",
                                                      category: .vision) {
        Conclusion("This setting replaces user interface items that rely on color to convey information with alternatives. For example: Status icons with a green circle and a red circle would appear as a green circle 🟢  and red square 🟥 with Differentiate Without Colour enabled.")
        
        Hint(one: "Every colour looks the same.",
             two: "Not everyone can see colour.",
             three: "Shapes.")
        
        Metadata(systemName: "swatchpalette",
                 color: .teal.opacity(0.6))
        
        DisableInstructions(Text("Go to **Settings \(Image(systemName: "chevron.right")) Accessibility \(Image(systemName: "chevron.right")) Display & Text Size \(Image(systemName: "chevron.right")) Differentiate Without Colour** and toggle Differentiate Without Colour."))
        
        ReferenceResources([
            .web("Use display and text size preferences on your iPhone, iPad, and iPod touch",
                 url: URL(string: "https://support.apple.com/HT207025")!),
            .web("Adjust the display and text size on iPhone",
                 url: URL(string: "https://support.apple.com/guide/iphone/iph3e2e1fb0/")!),
            .web("Adjust the display and text size on iPad",
                 url: URL(string: "https://support.apple.com/guide/ipad/ipad9a246013/")!)
        ])
        
        DeveloperResources([
            .header("Implementing Differentiate Without Color",
                    body: "Differentiate Without Color is an accessibility setting that users can enable in their device settings. When activated, it prompts developers and designers to use shapes, patterns, or text labels in addition to color to indicate status, alerts, and other key interface elements."),
            .code("Checking for Differentiate Without Color",
                  snippet: """
if UIAccessibility.shouldDifferentiateWithoutColor {
    // Adjust your UI to not rely solely on color
}
""",
                  body: "To respect this setting in your app, you should first check if it has been enabled by the user. This API call lets you conditionally apply alternative designs or augmentations to your UI, ensuring it remains usable regardless of the user's color vision.",
                  url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibility/3043553-shoulddifferentiatewithoutcolor")!,
                  relatedFrameworks: [.uiKit]),
            .code("Adapting Your Interface",
                  snippet: """
if UIAccessibility.shouldDifferentiateWithoutColor {
    // Use an icon or label for the status indicator
    statusIndicator.image = UIImage(named: "ErrorIcon")
} else {
    // Use color to indicate status
    statusIndicator.backgroundColor = .red
}
""",
                  body: "Without relying on color, you can differentiate a status indicator by adding an icon or label.",
                  relatedFrameworks: [.uiKit]),
            .code("Retrieving Differentiate Without Color Preference",
                  snippet: "@Environment(\\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor",
                  body: "The accessibilityDifferentiateWithoutColor environment value in SwiftUI allows you to check if the user has enabled the Differentiate Without Color setting. This property can be used within your view's body to conditionally modify the UI.",
                  url: URL(string: "https://developer.apple.com/documentation/swiftui/environmentvalues/accessibilitydifferentiatewithoutcolor")!,
                  relatedFrameworks: [.swiftUI]),
            .code("Adapting Your Interface",
                  snippet: """
struct ErrorStatusIndicator: View {
    @Environment(\\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor

    var body: some View {
        if differentiateWithoutColor {
            Circle()
                .fill(.red)
                .overlay {
                    Text("!")
                }
        } else {
            Circle()
                .fill(.red)
        }
    }
}
""",
                  body: "This example shows how to use the Environment variable to display an icon along with the status indicator when Differentiate Without Color is enabled, instead of using color alone to signify its importance.",
                  relatedFrameworks: [.swiftUI]),
            .header("Testing with Environment Overrides",
                    body: "Xcode's Environment Overrides allow you to enable various accessibility features, including Differentiate Without Color, on the Simulator. This is useful for quickly testing your app's accessibility features without having a physical device on you."),
            .hig("Inclusive Color",
                 url: URL(string: "https://developer.apple.com/design/human-interface-guidelines/color#Inclusive-color")!),
            .hig("Designing Accessible Buttons and Controls", url: URL(string: "https://developer.apple.com/design/human-interface-guidelines/accessibility#Buttons-and-controls")),
            .hig("Accessible Color and Effects",
                 url: URL(string: "https://developer.apple.com/design/human-interface-guidelines/accessibility#Color-and-effects")!),
            .video("WWDC19: Visual Design and Accessibility",
                   url: URL(string: "https://developer.apple.com/wwdc19/244")!)
        ])
    }
}
