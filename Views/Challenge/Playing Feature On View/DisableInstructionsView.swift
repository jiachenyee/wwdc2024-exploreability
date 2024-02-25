//
//  DisableInstructionsView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 3/2/24.
//

import Foundation
import SwiftUI

struct DisableInstructionsView: View {
    
    var challenge: Challenge
    
    var body: some View {
        if let disableInstructions = challenge.disableInstructions {
            disableInstructions
                .multilineTextAlignment(.center)
        }
    }
}
