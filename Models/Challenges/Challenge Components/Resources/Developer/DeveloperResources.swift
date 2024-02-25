//
//  DeveloperResources.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 8/2/24.
//

import Foundation

struct DeveloperResources: ChallengeComponent {
    var resources: [DeveloperResource]
    
    init(_ resources: [DeveloperResource]) {
        self.resources = resources
    }
}
