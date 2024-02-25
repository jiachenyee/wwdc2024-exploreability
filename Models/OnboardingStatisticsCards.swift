//
//  OnboardingStatisticsCards.swift
//
//
//  Created by Jia Chen Yee on 25/2/24.
//

import SwiftUI

struct OnboardingStatisticsCards: View {
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(.thickMaterial)
                VStack {
                    Text("13")
                        .font(.system(size: 64, weight: .bold))
                        .monospacedDigit()
                        .foregroundStyle(.yellow)
                        .shadow(color: .yellow, radius: 21, x: 0, y: 0)
                    Text("Challenges")
                        .font(.title3)
                        .foregroundStyle(.yellow)
                        .fontWeight(.medium)
                    
                    Text("to explore various accessibility features")
                        .foregroundStyle(.secondary)
                }
            }
            .frame(maxWidth: .infinity)
            .aspectRatio(1, contentMode: .fill)
            .clipShape(.rect(cornerRadius: 8))
            
            ZStack {
                Rectangle()
                    .fill(.thickMaterial)
                VStack {
                    Text("4")
                        .font(.system(size: 64, weight: .bold))
                        .monospacedDigit()
                        .foregroundStyle(.cyan)
                        .shadow(color: .cyan, radius: 21, x: 0, y: 0)
                    Text("Pillars of Accessibility")
                        .font(.title3)
                        .foregroundStyle(.cyan)
                        .fontWeight(.medium)
                    
                    Text("Vision, Hearing, Mobility & Cognitive")
                        .foregroundStyle(.secondary)
                }
            }
            .frame(maxWidth: .infinity)
            .aspectRatio(1, contentMode: .fill)
            .clipShape(.rect(cornerRadius: 8))
            
            ZStack {
                Rectangle()
                    .fill(.thickMaterial)
                VStack {
                    Text("53")
                        .font(.system(size: 64, weight: .bold))
                        .monospacedDigit()
                        .foregroundStyle(.pink)
                        .shadow(color: .pink, radius: 21, x: 0, y: 0)
                    Text("Code Snippets")
                        .font(.title3)
                        .foregroundStyle(.pink)
                        .fontWeight(.medium)
                    
                    Text("to provide developeres with resources")
                        .foregroundStyle(.secondary)
                }
            }
            .frame(maxWidth: .infinity)
            .aspectRatio(1, contentMode: .fill)
            .clipShape(.rect(cornerRadius: 8))
        }
        .padding(.horizontal)
        .multilineTextAlignment(.center)
    }
}

#Preview {
    OnboardingStatisticsCards()
}
