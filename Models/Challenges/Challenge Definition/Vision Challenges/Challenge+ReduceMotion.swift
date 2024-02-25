//
//  Challenge+ReduceMotion.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/2/24.
//

import Foundation
import SwiftUI

extension Challenge {
    static let reduceMotion = Challenge(feature: "Reduce Motion",
                                        category: .vision) {
        Conclusion("When you turn on Reduce Motion, you can decrease the movement of onscreen elements. Some screen actions, such as moving between apps or launching apps, become visually simpler for motion sensitivity or to lessen strain on the eyes.")
        
        Hint(one: "There's a lot going on.",
             two: "Dizzying animations.",
             three: "There's a lot of movement, or… motion.")
        
        Metadata(systemName: "cursorarrow.motionlines",
                 color: .teal.opacity(0.8))
        
        DisableInstructions(Text("Go to **Settings \(Image(systemName: "chevron.right")) Accessibility \(Image(systemName: "chevron.right")) Motion \(Image(systemName: "chevron.right")) Reduce Motion** and toggle Reduce Motion."))
        
        ReferenceResources([
            .web("Stop or reduce motion on iPhone",
                 url: URL(string: "https://support.apple.com/guide/iphone/iph0b691d3ed/ios")!),
            .web("Stop or reduce motion on iPad",
                 url: URL(string: "https://support.apple.com/guide/ipad/ipadc509a80c/ipados")!),
            .video("How to reduce screen motion on iPhone, iPad, and iPod touch",
                   url: URL(string: "https://youtu.be/8Ddva5UUX2U")!)
        ])
        
        DeveloperResources([
            .header("Implementing Reduce Motion Support",
                    body: "The Reduce Motion feature helps users sensitive to motion and animation by minimizing the amount of movement they experience in the UI. Supporting Reduce Motion in your app not only enhances accessibility but also allows users to enjoy a more comfortable user experience according to their preferences.\n\nImplementing support for Reduce Motion involves detecting the user's settings and providing alternative, less motion-intensive interactions and animations."),
            .code("Checking for Reduce Motion Setting",
                  snippet: "UIAccessibility.isReduceMotionEnabled",
                  body: "Use this property to determine if the user has enabled Reduce Motion on their device. You can then conditionally trigger animations or offer alternative navigation and interaction methods that do not rely on motion.",
                  url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibility/1615133-isreducemotionenabled")!,
                  relatedFrameworks: [.uiKit]),
            .code("Checking for Reduce Motion Setting",
                  snippet: "@Environment(\\.accessibilityReduceMotion) var isReduceMotionEnabled",
                  body: "Use this property to determine if the user has enabled Reduce Motion on their device. You can then conditionally trigger animations or offer alternative navigation and interaction methods that do not rely on motion.",
                  url: URL(string: "https://developer.apple.com/documentation/swiftui/environmentvalues/accessibilityreducemotion")!,
                  relatedFrameworks: [.swiftUI]),
            .code("Example",
                  snippet: """
struct MyView: View {
    @Environment(\\.accessibilityReduceMotion) var isReduceMotionEnabled
    
    var body: some View {
        if isReduceMotionEnabled {
            // Provide alternative, less motion-intensive interactions and animations
        } else {
            // Use regular animations and interactions
        }
    }
}
""",
                  relatedFrameworks: [.swiftUI]),
            .hig("Designing for Motion Sensitivities",
                 body: "This provides insights on how to design your app for users with motion sensitivities. It includes principles for using motion effectively while ensuring that your app remains accessible to users who prefer reduced motion settings, including the use of fallback static interfaces and avoiding unnecessary animations.", 
                 url: URL(string: "https://developer.apple.com/design/human-interface-guidelines/motion")!),
            .video("WWDC18: Designing Fluid Interfaces",
                   body: "While this session focuses on designing fluid interfaces, it includes valuable principles that can be applied to respect Reduce Motion settings. Learn how to create engaging and accessible interfaces that cater to all users by adapting animations and transitions appropriately.", 
                   url: URL(string: "https://developer.apple.com/videos/play/wwdc2018/803/")!),
            .article("Providing Alternatives to Animations",
                     body: "Discover how to customize your app's behavior when Reduce Motion is enabled. This article walks through practical examples of providing alternatives to animations, ensuring that your app remains usable and comfortable for users with motion sensitivities.", url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibility/customizing_accessibility_for_reduced_motion")!,
                     relatedFrameworks: [.uiKit]),
            .header("Testing with Environment Overrides",
                    body: "Xcode's Environment Overrides allow you to enable various accessibility features, including Dynamic Type, on the Simulator. This is useful for quickly testing your app's accessibility features without having a physical device on you.")
        ])

    }
}
