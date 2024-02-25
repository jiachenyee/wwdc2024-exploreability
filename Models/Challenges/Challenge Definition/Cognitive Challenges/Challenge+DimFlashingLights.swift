//
//  Challenge+DimFlashingLights.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/2/24.
//

import Foundation
import SwiftUI

extension Challenge {
    static let dimFlashingLights = Challenge(feature: "Dim Flashing Lights",
                                             category: .cognitive) {
        Conclusion("Dim Flashing Lights setting allows you to avoid bright, frequent flashes of light in the media. The Dim Flashing Lights setting allows the system to calculate, mitigate, and inform you about flashing lights in a piece of media.")
        
        Hint(one: "Flickers.",
             two: "Flashing Lights.",
             three: "Videos.")
        
        Metadata(systemName: "sun.max.trianglebadge.exclamationmark",
                 color: .pink.opacity(0.8))
        
        DisableInstructions(Text("Go to **Settings \(Image(systemName: "chevron.right")) Accessibility \(Image(systemName: "chevron.right")) Motion \(Image(systemName: "chevron.right")) Dim Flashing Lights** and toggle Dim Flashing Lights."))
        
        ChallengeRequirement.iOS17
        
        ReferenceResources([
            .web("Vision — Apple Accessibility",
                 url: URL(string: "https://www.apple.com/sg/accessibility/vision/")!),
            .web("Stop or reduce onscreen motion on iPhone",
                 url: URL(string: "https://support.apple.com/en-sg/guide/iphone/iph0b691d3ed")!),
            .web("Stop or reduce onscreen motion on iPad",
                 url: URL(string: "https://support.apple.com/en-sg/guide/ipad/ipadc509a80c/ipados")!)
        ])
        
        DeveloperResources([
            .code("Checking if Dim Flashing Lights is Enabled",
                  snippet: "import MediaAccessibility\n\nMADimFlashingLightsEnabled()",
                  body: "This property allows you to check if the user has Dim Flashing Lights in video enabled.",
                  url: URL(string: "https://developer.apple.com/documentation/mediaaccessibility/flashing-lights")!,
                  relatedFrameworks: [.uiKit]),
            .code("Checking if Dim Flashing Lights is Enabled",
                  snippet: "@Environment(\\.accessibilityDimFlashingLights) var dimFlashingLights",
                  body: "This property allows you to check if the user has Dim Flashing Lights in video enabled.",
                  url: URL(string: "https://developer.apple.com/documentation/swiftui/environmentvalues/accessibilitydimflashinglights")!,
                  relatedFrameworks: [.swiftUI]),
            .code("Example",
                  snippet: """
struct MyView: View {
    @Environment(\\.accessibilityDimFlashingLights) var dimFlashingLights

    var body: some View {
        Text(dimFlashingLights ? "Enabled" : "Disabled")
    }
}
""",
                  body: "This snippet changes the text based on the Dim Flashing Lights state, updating the view when the setting changes.",
                  relatedFrameworks: [.swiftUI]),
            .code("Observing Changes to Dim Flashing Lights Setting",
                  snippet: "kMADimFlashingLightsChangedNotification",
                  body: "This property allows you to listen for any changes to the Dim Flashing Lights state and update your interface accordingly.",
                  url: URL(string: "https://developer.apple.com/documentation/mediaaccessibility/kmadimflashinglightschangednotification")!,
                  relatedFrameworks: [.uiKit])
        ])
    }
}
