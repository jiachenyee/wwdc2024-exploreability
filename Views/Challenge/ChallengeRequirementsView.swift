//
//  ChallengeRequirementsView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 13/2/24.
//

import Foundation
import SwiftUI

struct ChallengeRequirementsView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "pc")
                    .symbolRenderingMode(.multicolor)
                    .imageScale(.large)
                Text("Challenge Unavailable")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            if let requirement = challengeViewModel.challenge.requirements {
                Text("This challenge involves features only available in **\(requirement.osVersion())** or later.\n\nUpdate your device's operating system to the latest version and try again.\n\nHead to **Settings \(Image(systemName: "chevron.right")) General \(Image(systemName: "chevron.right")) Software Update**, and install the latest version of iPadOS.")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Divider()
            
            Spacer()
            
            Link(destination: URL(string: "https://support.apple.com/en-sg/guide/ipad/ipad9a74c576/ipados")!) {
                Text("Update iPadOS on iPad: Apple Support")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                withAnimation {
                    viewModel.gameState = .home
                }
            } label: {
                Text("Exit")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
        }
        .padding()
        .frame(maxWidth: 800)
    }
}
