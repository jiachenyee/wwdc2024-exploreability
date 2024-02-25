//
//  Challenge+AnimatedImages.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/2/24.
//

import Foundation
import SwiftUI

extension Challenge {
    static let animatedImages = Challenge(feature: "Animated Images",
                                          category: .cognitive) {
        Conclusion("The Animated Images setting allows you to control whether to play animated images like GIFs on the web and in apps. By default, the setting is on, which allows animated images to play automatically. Turn off the setting to indicate that you want to pause animated images on your device.")
        
        Hint(one: "There's a lot going on.",
             two: "Can we stop some of this animation?",
             three: "It's pronounced GIF not GIF.")
        
        Metadata(systemName: "photo.on.rectangle.angled",
                 color: .pink.opacity(0.9))
        
        DisableInstructions(Text("Go to **Settings \(Image(systemName: "chevron.right")) Accessibility \(Image(systemName: "chevron.right")) Motion \(Image(systemName: "chevron.right")) Auto-Play Animated Images** and toggle Auto-Play Animated Images."))
        
        ChallengeRequirement.iOS17
        
        ReferenceResources([
            .web("Cognitive — Apple Accessibility",
                 url: URL(string: "https://www.apple.com/sg/accessibility/cognitive/")!),
            .web("Stop or reduce onscreen motion on iPhone",
                 url: URL(string: "https://support.apple.com/en-sg/guide/iphone/iph0b691d3ed")!),
            .web("Stop or reduce onscreen motion on iPad",
                 url: URL(string: "https://support.apple.com/en-sg/guide/ipad/ipadc509a80c/ipados")!)
        ])
        
        DeveloperResources([
            .code("Checking if Animated Images is Disabled",
                  snippet: "import Accessibility\n\nAXAnimatedImagesEnabled()",
                  body: "This property allows you to check if the user has play animated images enabled or disabled",
                  url: URL(string: "https://developer.apple.com/documentation/accessibility/axanimatedimagesenabled()")!,
                  relatedFrameworks: [.uiKit]),
            .code("Checking if Animated Images is Disabled",
                  snippet: "@Environment(\\.accessibilityPlayAnimatedImages) var playAnimatedImages",
                  body: "This property allows you to check if the user has play animated images enabled or disabled.",
                  url: URL(string: "https://developer.apple.com/documentation/swiftui/environmentvalues/accessibilityplayanimatedimages")!,
                  relatedFrameworks: [.swiftUI]),
            .code("Example",
                  snippet: """
struct MyImageView: View {
    @Environment(\\.accessibilityPlayAnimatedImages) var playAnimatedImages

    var body: some View {
        if playAnimatedImages {
            AnimatedGIF()
        } else {
            Image("StaticImage")
        }
    }
}
""",
                  body: "This snippet changes the image based on the Play Animated Images state, updating the view when the setting changes.",
                  relatedFrameworks: [.swiftUI]),
            .code("Observing Changes to Play Animated Images Setting",
                  snippet: "AXAnimatedImagesEnabledDidChange",
                  body: "This property allows you to listen for any changes to the Play Animated Images state and update your interface accordingly.",
                  url: URL(string: "https://developer.apple.com/documentation/foundation/nsnotification/name/4114112-axanimatedimagesenableddidchange")!,
                  relatedFrameworks: [.uiKit])
        ])
    }
}
