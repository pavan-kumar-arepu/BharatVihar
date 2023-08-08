//
//  LeadersView.swift
//  SwiftUITableView
//
//  Created by Pavankumar Arepu on 17/06/23.
//

import Foundation
import SwiftUI

/// Responsbile to load the singleLeader i.e. LeaderRow
/// - Parameters:
///   - leader: Single Leader
/// - returns: View

struct LeaderRow: View {
    var leader: Leader
    
    var body: some View {
        HStack(spacing: 10) {
            Image(leader.logo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
            
            VStack(alignment: .leading) {
                Text("\(leader.name)")
                    .font(.headline)
                Text("\(leader.party)")
                    .font(.subheadline)
            }
        }
    }
}

struct LeaderRow_Previews: PreviewProvider {
    static var previews: some View {
        let leader: Leader = Leader(id: 1, name: "Kumar", pmNumber: "12", party: "BJP", rulingPeriod: "1947 - 2023", about: "Very Good", achievements: "Bharat Ratna", logo: "Guljari-Nanda", signatureLogo: "Jawahar-Sign")
        LeaderRow(leader: leader)
    }
}
