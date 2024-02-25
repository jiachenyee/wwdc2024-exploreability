//
//  ChallengeHomeButton.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 4/2/24.
//

import Foundation
import SwiftUI

struct ChallengeHomeButton: View {
    
    static let width: Double = 48
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    @EnvironmentObject var viewModel: ViewModel
    
    @AppStorage("ShowPrompt") var showPrompt = true
    
    var width = 8.0
    
    var body: some View {
        Button {
            withAnimation {
                showPrompt = false
                challengeViewModel.state = .menu
            }
        } label: {
            Circle()
                .stroke(challengeViewModel.challenge.color, lineWidth: width)
                .matchedGeometryEffect(id: challengeViewModel.challenge.feature, in: viewModel.sharedNamespace)
                .padding(8 / 2)
                .padding(width / 2)
        }
        .frame(width: Self.width, height: Self.width)
        .accessibilityLabel("Menu")
        .overlay(alignment: .bottom) {
            if showPrompt {
                ZStack {
                    VStack(spacing: -4) {
                        Text("Tap for Options")
                            .padding()
                            .background(.ultraThickMaterial)
                            .clipShape(.rect(cornerRadius: 8))
                        Image(systemName: "arrowtriangle.down.fill")
                            .font(.system(size: 24))
                            .foregroundStyle(.ultraThickMaterial)
                    }
                    .shadow(color: .white, radius: 2)
                    
                    VStack(spacing: -4) {
                        Text("Tap for Options")
                            .padding()
                            .background(.ultraThickMaterial)
                            .clipShape(.rect(cornerRadius: 8))
                        Image(systemName: "arrowtriangle.down.fill")
                            .font(.system(size: 24))
                            .foregroundStyle(.ultraThickMaterial)
                    }
                }
                .onTapGesture {
                    withAnimation {
                        showPrompt = false
                    }
                }
                .fixedSize()
                .zIndex(10)
                .offset(y: -Self.width)
            }
        }
    }
}
