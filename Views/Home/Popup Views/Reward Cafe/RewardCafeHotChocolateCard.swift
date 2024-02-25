//
//  RewardCafeHotChocolateCard.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 10/2/24.
//

import Foundation
import SwiftUI

struct RewardCafeHotChocolateCard: View {
    
    var hotChocolates: Int
    
    @State private var localHotChocolateCount = 0
    
    @State private var waveOffset = Angle(degrees: 0)
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.brown)
                .opacity(0.3)
            
            Group {
                WaveView(offset: waveOffset, percent: 0.5)
                    .fill(.brown.opacity(0.5))
                
                WaveView(offset: .degrees(45) - waveOffset, percent: 0.5)
                    .fill(.brown.opacity(0.5))
                
                WaveView(offset: .degrees(90) - waveOffset, percent: 0.5)
                    .fill(.brown.opacity(0.5))
            }
            .padding(.trailing, -32)
            
            VStack {
                Spacer()
                HStack {
                    Text("\(localHotChocolateCount)")
                        .contentTransition(.numericText())
                        .monospacedDigit()
                    Image(systemName: "mug.fill")
                        .imageScale(.small)
                }
                .font(.system(size: 64, weight: .bold))
                
                Spacer()
            }
            .padding()
        }
        .clipped()
        .clipShape(UnevenRoundedRectangle(bottomLeadingRadius: 8, bottomTrailingRadius: 8))
        .frame(height: 200)
        .onAppear {
            localHotChocolateCount = hotChocolates
            withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                self.waveOffset = Angle(degrees: 360)
            }
        }
        .onChange(of: hotChocolates) { newValue in
            withAnimation {
                localHotChocolateCount = newValue
            }
        }
    }
}
