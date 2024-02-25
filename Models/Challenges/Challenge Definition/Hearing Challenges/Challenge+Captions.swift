//
//  Challenge+Captions.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/2/24.
//

import Foundation
import SwiftUI

extension Challenge {
    static let captions = Challenge(feature: "Closed Captions + SDH",
                                    category: .hearing) {
        Conclusion("Closed captions are a text transcription of a video’s dialogue, as well as nonverbal communication. Supported in apps like the Apple TV app, closed captions are available in over 40 languages for movies, TV shows, videos, and podcasts — just look for the CC icon. You can even customize captions with different styles and fonts, including styles that are larger and outlined for better legibility.")
        
        Hint(one: "Muted voices.",
             two: "Voices but I can't hear them.",
             three: "Could I read them?")
        
        Metadata(systemName: "captions.bubble",
                 color: .indigo)
        
        DisableInstructions(Text("Go to **Settings \(Image(systemName: "chevron.right")) Accessibility \(Image(systemName: "chevron.right")) Subtitles & Captioning \(Image(systemName: "chevron.right")) Closed Captions + SDH** and toggle Closed Captions + SDH."))

        ReferenceResources([
            .web("Display subtitles and captions for videos and HomePod announcements on iPhone",
                 url: URL(string: "https://support.apple.com/guide/iphone/iph3e2e23d1/")!),
            .web("Display subtitles and captions for videos and HomePod announcements on iPad",
                 url: URL(string: "https://support.apple.com/guide/ipad/ipad9a246b38/")!),
            .web("Change the closed captions or language for movies and TV shows in the Apple TV app",
                 url: URL(string: "https://support.apple.com/HT202641")!)
        ])
        
        DeveloperResources([
            .header("Integrating Closed Captions and SDH",
                    body: "Closed Captions and Subtitles for the Deaf and Hard of Hearing (SDH) are essential for making video and multimedia content accessible to users with hearing impairments. These features provide a text display of the audio content, including spoken dialogue and non-speech information such as sound effects and music cues. Integrating Closed Captions and SDH not only complies with accessibility regulations but also enhances your app's inclusivity, allowing all users to fully experience your multimedia content.\n\nTo support Closed Captions and SDH, developers should include captions in all video content and ensure they are correctly synchronized with the audio. Captions should be easy to read and accessible through standard player controls."),
            .code("Detecting Closed Captions + SDH Setting",
                  snippet: "UIAccessibility.isClosedCaptioningEnabled",
                  body: "This property allows you to check if the user has Closed Captions + SDH enabled in their device settings.",
                  url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibility/1615112-isclosedcaptioningenabled")!,
                  relatedFrameworks: [.uiKit, .swiftUI]),
            .code("Observing Closed Captions + SDH Setting",
                  snippet: "private let publisher = NotificationCenter.default.publisher(for: UIAccessibility.closedCaptioningStatusDidChangeNotification)",
                  body: "This property allows you to create a publisher that receives changes based on the Closed Captions + SDH setting.",
                  url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibility/1615101-closedcaptioningstatusdidchangen")!,
                  relatedFrameworks: [.swiftUI]),
            .code("Example",
                  snippet: """
struct MyView: View {
    private let publisher = NotificationCenter.default.publisher(for: UIAccessibility.closedCaptioningStatusDidChangeNotification)
    @State private var isClosedCaptioningEnabled = UIAccessibility.isClosedCaptioningEnabled

    var body: some View {
        Text(isClosedCaptioningEnabled ? "Enabled" : "Disabled")
            .onReceive(publisher) { _ in
                isClosedCaptioningEnabled = UIAccessibility.isClosedCaptioningEnabled
            }
    }
}
""",
                  body: "This snippet changes the text based on the Closed Captions + SDH setting, updating the view when the setting changes.",
                  relatedFrameworks: [.swiftUI]),
            .code("Observing Closed Captions + SDH Setting",
                  snippet: "UIAccessibility.closedCaptioningStatusDidChangeNotification",
                  body: "This property allows you to listen for any changes to the Closed Captions + SDH preference and update your interface accordingly.",
                  url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibility/1615101-closedcaptioningstatusdidchangen")!,
                  relatedFrameworks: [.uiKit]),
            .code("Adding Closed Captions to Video Content",
                  snippet: """
let asset = AVAsset(url: videoURL)
let captionedAsset = asset.addingClosedCaptionsFromURL(captionURL)
""",
                  body: "This code demonstrates how to add closed captions to a video asset using AVFoundation. It involves loading the video content as an AVAsset and then adding captions from a separate file, which can be in a format such as SRT or WebVTT. Ensure the captions are properly synchronized and formatted to comply with accessibility standards.",
                  url: URL(string: "https://developer.apple.com/documentation/avfoundation/avaudiosession")!),
            .hig("Designing Accessible Video Experiences",
                 body: "Learn about the best practices for integrating Closed Captions and SDH into your app's videos. This article offers guidelines on caption formatting, ensuring captions are clear and accessible, and how to test your captions to guarantee they meet accessibility standards.",
                 url: URL(string: "https://developer.apple.com/design/human-interface-guidelines/playing-video")!),
        ])
    }
}
