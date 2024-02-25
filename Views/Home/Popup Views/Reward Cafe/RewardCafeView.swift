//
//  RewardCafeView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 10/2/24.
//

import Foundation
import SwiftUI

struct RewardCafeView: View {
    
    @AppStorage("hotChocolates") private var hotChocolates = 10
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .topTrailing) {
                RewardCafeHotChocolateCard(hotChocolates: hotChocolates)
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
                .padding()
            }
            VStack(alignment: .leading) {
                HStack {
                    Text("Earning")
                    HotChocolateAnimatingIconView()
                }
                .font(.title3)
                .fontWeight(.bold)
                
                VStack(alignment: .leading) {
                    HStack(spacing: -6) {
                        ForEach(ChallengeCategory.all, id: \.name) { challengeCategory in
                            ZStack {
                                if challengeCategory == .vision {
                                    Circle()
                                        .fill(challengeCategory.color)
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(.black)
                                        .font(.system(size: 12, weight: .bold))
                                } else {
                                    Circle()
                                        .fill(.black)
                                }
                                Circle()
                                    .stroke(challengeCategory.color, lineWidth: 4)
                            }
                            .frame(width: 30, height: 30)
                            .padding(2)
                        }
                    }
                    .padding(.bottom)
                    
                    Text("Win Challenges")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("Complete accessibility challenges to earn hot chocolate mugs!")
                    
                    Spacer()
                }
                .padding()
                .frame(width: 200, height: 200, alignment: .topLeading)
                .background(.thickMaterial)
                .clipShape(.rect(cornerRadius: 16))
                
                HStack {
                    Text("Spending")
                    HotChocolateAnimatingIconView()
                }
                .font(.title3)
                .fontWeight(.bold)
                
                HStack {
                    VStack(alignment: .leading) {
                        Image(systemName: "questionmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.yellow)
                            .padding(.bottom)
                        
                        Text("Get Hints")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Use mugs of hot chocolate to get hints for challenges!")
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    .padding()
                    .frame(width: 200, height: 200, alignment: .topLeading)
                    .background(.thickMaterial)
                    .clipShape(.rect(cornerRadius: 16))
                    
                    if hotChocolates > 1 {
                        Button {
                            if hotChocolates > 1 {
                                withAnimation {
                                    hotChocolates -= 1
                                }
                            }
                        } label: {
                            VStack(alignment: .leading) {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 32, height: 32)
                                    .foregroundStyle(.pink)
                                    .padding(.bottom)
                                
                                Text("Donate to me!")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                Text("No seriously, tapping this will lose 1 mug of hot chocolate.")
                                    .multilineTextAlignment(.leading)
                                
                                Spacer()
                            }
                            .padding()
                            .frame(width: 200, height: 200, alignment: .topLeading)
                            .background(.thickMaterial)
                            .clipShape(.rect(cornerRadius: 16))
                            .foregroundStyle(.white)
                        }
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
    }
}
