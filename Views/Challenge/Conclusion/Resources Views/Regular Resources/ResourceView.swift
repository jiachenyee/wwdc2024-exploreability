//
//  ResourceView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 3/2/24.
//

import Foundation
import SwiftUI

struct ResourceView: View {
    
    var resource: ReferenceResource
    
    var body: some View {
        Link(destination: resource.url) {
            VStack(alignment: .leading) {
                Text(resource.title)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(resource.type.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}
