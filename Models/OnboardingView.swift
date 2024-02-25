//
//  OnboardingView.swift
//
//
//  Created by Jia Chen Yee on 25/2/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    OnboardingTitleCard()
                    OnboardingStatisticsCards()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("“Accessibility feels like creative problem solving”")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("""
In 2020, I was part of the organizing team for the _Swift Innovators’ Summit_ in Singapore, an event designed for students, by students. One of our guest speakers was blind and demonstrated how he navigated his iPhone using VoiceOver. I was astounded by his proficiency; he could not only use his phone as effectively as anyone else but also type faster than most of us by utilizing the built-in braille keyboard. Following this event, I had the opportunity to attend others, including one featuring Christopher Hills from HandsOptional. He showed us how he could use his iPad and Mac entirely with Switch Control, without using his hands at all.

These experiences opened my eyes to the vital role and power of accessibility features for individuals who rely on them to use their devices. Driven by curiosity, I dug deeper into these features on my own devices. Through watching videos, reading articles, and experimenting with these features firsthand, I gained a deeper appreciation for the ingenious design behind each one of them.

This journey inspired me to create ExploreAbility, a fun little puzzle game to share what I learnt about accessibility with others.
""")
                        
                        Text("Turn it on, then back off")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top)
                        
                        Text("Inspired by the Apple Design Award winning game _Blackbox_, ExploreAbility is a puzzle game that challenges you to explore various accessibility features on your iPad.")
                        
                        Text("""
To solve a challenge,
\t1.\tFind out what the accessibility feature is
\t2.\tHead over to Settings
\t3.\tToggle the accessibility feature
\t4.\tReturn to the app to confirm it's on
\t5.\tHead back to Settings to toggle it back.
\t6.\tThen return to the app to check how you did!

It's that simple!
""")
                        
                        Text("From the Academy")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top)
                        
                        Text("I first designed this app in the Apple Developer Academy as a unique way to learn about Accessibility.")
                        
                        Image("ada")
                            .resizable()
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 16))
                        
                        Text("Learners in the Apple Developer Academy @ Infinite Learning trying out an initial version of the app.")
                            .foregroundStyle(.secondary)
                        
                        Text("While everyone had fun and learnt a lot, the app used for the activity was admittedly buggy and had several glaring issues.\n\nThis app is a complete rewrite of it, intended to be a significantly more polished version that is ready for the App Store. The original version had just 5 challenges, namely, VoiceOver, Dynamic Type, Guided Access, Closed Captions, and Reduce Motion.")
                        
                        Text("Designed for Everyone, including Developers and Designers")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top)
                        Text("Each challenge comes with extensive documentation meant for anyone to understand the accessibility feature. With detailed descriptions, Apple Support articles and videos to give you a better understanding of the accessibility feature and its uses.\n\nFor developers and designers, the app features comprehensive documentation with compiled lists of Apple Developer Documentation, WWDC videos, Human Interface Guidelines articles, and code snippets.")
                    }
                    .padding()
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Let’s get started!")
                            .padding(8)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
