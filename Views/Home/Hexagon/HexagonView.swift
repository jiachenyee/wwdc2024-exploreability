//
//  HexagonView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/2/24.
//

import Foundation
import SwiftUI

struct HexagonView: View {
    
    var challengeCategory: ChallengeCategory
    
    var isPresented: Bool
    
    @EnvironmentObject var viewModel: ViewModel
        
    @State private var isTextShown = false
    
    var body: some View {
        ZStack {
            HStack(spacing: 16) {
                if isPresented {
                    VStack(spacing: 21) {
                        ChallengeButtonView(challenges: challengeCategory.challenges,
                                            challengeIndex: 5)
                        ChallengeButtonView(challenges: challengeCategory.challenges,
                                            challengeIndex: 4)
                    }
                    VStack(spacing: 21) {
                        ChallengeButtonView(challenges: challengeCategory.challenges,
                                            challengeIndex: 0)
                        
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.white.opacity(0.1))
                            .overlay {
                                challengeCategory.image
                                    .font(.system(size: 25))
                                    .foregroundStyle(challengeCategory.color)
                            }
                        
                        ChallengeButtonView(challenges: challengeCategory.challenges,
                                            challengeIndex: 3)
                    }
                    VStack(spacing: 21) {
                        ChallengeButtonView(challenges: challengeCategory.challenges,
                                            challengeIndex: 1)
                        ChallengeButtonView(challenges: challengeCategory.challenges,
                                            challengeIndex: 2)
                    }
                }
            }
            .foregroundStyle(.white.opacity(0.1))
            .padding(32)
            .overlay {
                LinearGradient(colors: [challengeCategory.color, challengeCategory.color.opacity(0.5)],
                               startPoint: .topLeading, endPoint: .bottomTrailing)
                .mask {
                    Image("hex")
                        .resizable()
                        .scaledToFit()
                }
                .allowsHitTesting(false)
            }
            .padding(-32)
            .opacity(isPresented ? 1 : 0)
            
            if isPresented {
                HStack {
                    challengeCategory.image
                        .foregroundStyle(challengeCategory.color)
                    Text(challengeCategory.name)
                        .textCase(.uppercase)
                }
                .font(.system(size: 13))
                .frame(width: 100, alignment: .center)
                .rotationEffect(challengeCategory.labelAngle)
                .offset(x: challengeCategory.labelPosition.x, y: challengeCategory.labelPosition.y)
            }
        }
    }
}
