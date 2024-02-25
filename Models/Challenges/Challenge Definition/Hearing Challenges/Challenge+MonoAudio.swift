//
//  Challenge+MonoAudio.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/2/24.
//

import Foundation
import SwiftUI

extension Challenge {
    static let monoAudio = Challenge(feature: "Mono Audio",
                                     category: .hearing) {
        Conclusion("Stereo recordings usually have distinct left- and right-channel audio tracks. Mono Audio can help streamline the differences by playing both audio channels in both ears. You can adjust the balance for greater volume in either ear, so you won’t miss a single note of a concert or word of an audiobook.\n\nYou can also turn on noise cancellation even when you’re using only one of your AirPods.")
        
        Hint(one: "Left, Right.",
             two: "One.",
             three: "Never miss a beat.")
        
        Metadata(systemName: "earbuds",
                 color: .indigo.opacity(0.9))
        
        DisableInstructions(Text("Go to **Settings \(Image(systemName: "chevron.right")) Accessibility \(Image(systemName: "chevron.right")) Audio/Visual \(Image(systemName: "chevron.right")) Mono Audio** and toggle Mono Audio."))
        
        ReferenceResources([
            .web("Adjust the mono audio, balance, and phone noise cancellation settings on iPhone",
                 url: URL(string: "https://support.apple.com/guide/iphone/iph3e2e2cdc/")!),
            .web("Adjust the mono audio and balance settings on iPad",
                 url: URL(string: "https://support.apple.com/guide/ipad/ipad9a246ed2/")!),
            .web("Play the same sound in both of your AirPods",
                 url: URL(string: "https://support.apple.com/guide/airpods/dev2b840e13e/web")!)
        ])
        
        DeveloperResources([
            .header("Incorporating Mono Audio Support",
                    body: "Mono Audio consolidates stereo sound channels into a single mono channel, making it essential for users with hearing impairments in one ear to not miss out on audio content. When developing apps, it's crucial to ensure that all audio content is fully accessible and enjoyable, even when listened to in Mono Audio mode. This involves testing your app's audio output in mono settings to ensure clarity and full accessibility of all sound content, and adjusting mixing settings for audio content to maintain intelligibility and richness in mono."),
            .code("Detecting Mono Audio Setting",
                  snippet: "UIAccessibility.isMonoAudioEnabled",
                  body: "This property allows you to check if the user has Mono Audio enabled in their device settings.",
                  url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibility/1615123-ismonoaudioenabled")!,
                  relatedFrameworks: [.uiKit, .swiftUI]),
            .code("Observing Mono Audio Setting",
                  snippet: "private let publisher = NotificationCenter.default.publisher(for: UIAccessibility.monoAudioStatusDidChangeNotification)",
                  body: "This property allows you to create a publisher that receives changes based on the Mono Audio setting.",
                  url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibility/1615185-monoaudiostatusdidchangenotifica")!,
                  relatedFrameworks: [.swiftUI]),
            .code("Example",
                  snippet: """
struct MyView: View {
    private let publisher = NotificationCenter.default.publisher(for: UIAccessibility.monoAudioStatusDidChangeNotification)
    @State private var isMonoAudioEnabled = UIAccessibility.isMonoAudioEnabled

    var body: some View {
        Text(isMonoAudioEnabled ? "Enabled" : "Disabled")
            .onReceive(publisher) { _ in
                isMonoAudioEnabled = UIAccessibility.isMonoAudioEnabled
            }
    }
}
""",
                  body: "This snippet changes the text based on the Mono Audio setting, updating the view when the setting changes.",
                  relatedFrameworks: [.swiftUI]),
            .code("Observing Mono Audio Setting",
                  snippet: "UIAccessibility.monoAudioStatusDidChangeNotification",
                  body: "This property allows you to listen for any changes to the Mono Audio preference and update your interface accordingly.",
                  url: URL(string: "https://developer.apple.com/documentation/uikit/uiaccessibility/1615185-monoaudiostatusdidchangenotifica")!,
                  relatedFrameworks: [.uiKit]),
            .code("Configuring Audio Session for Mono Output",
                  snippet: """
AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
try? AVAudioSession.sharedInstance().setPreferredMonoAudioOutput(true)
""",
                  body: "This code snippet demonstrates how to configure the AVAudioSession to prefer mono audio output, ensuring that your app’s audio content is optimized for users requiring Mono Audio support. Adjusting the audio session in this way helps in testing and ensuring that your audio mixing is suitable for Mono Audio output.",
                  url: URL(string: "https://developer.apple.com/documentation/avfoundation/avaudiosession")!),
            .hig("Designing Accessible Audio Experiences",
                 body: "This guide offers insights into designing accessible audio experiences, emphasizing the importance of Mono Audio support. It covers best practices for audio design, ensuring that all users, including those who use Mono Audio, can fully experience the audio content in your app.",
                 url: URL(string: "https://developer.apple.com/design/human-interface-guidelines/playing-audio")!),
        ])

    }
}
