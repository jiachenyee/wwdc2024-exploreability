//
//  ReferenceResources.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 8/2/24.
//

import Foundation

struct ReferenceResources: ChallengeComponent {
    var resources: [ReferenceResource]
    
    init(_ resources: [ReferenceResource]) {
        self.resources = resources
    }
}
