//
//  LeaderDetailView.swift
//  SwiftUITableView
//
//  Created by Pavankumar Arepu on 17/06/23.
//

import Foundation
import SwiftUI

/// Responsbile to render Leader Details based on teh selection from ListView aswell as Bottom Leaders
/// - Parameters:
///   - size: The width of the rectangle.
///   - name: The height of the rectangle.
///   - alignment: The height of the rectangle.
/// - returns: DetailsView of Leader

struct LeaderDetail: View {
    
    var leader: Leader
    var leaders: [Leader]
    
    @State private var selectedButtonLeader: Leader?
        
    var selectedLeaderDetails: Leader {
        selectedButtonLeader ?? leader
    }
        
    var body: some View {
        ZStack {
            
            IndianGradient()
            
            VStack {
                // Display detail Leaders from top
                
                VSLeaderDetail(leader: selectedLeaderDetails)
                
                // Display grid of Leaders icons at the bottom in a single row
                HStack(spacing: 0) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 16) {
                            ForEach(leaders) { leader in
                                Button(action: {
                                    selectedButtonLeader = leader
                                }) {
                                    Image(leader.logo).resizable().frame(width: 50, height: 50)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .frame(height: 50)
                .padding()
            }
        }
        .navigationBarTitle(selectedButtonLeader?.name ?? leader.name)
    }
}

struct LeaderDetail_Previews: PreviewProvider {
    static var previews: some View {
        let leader: Leader = Leader(id: 1, name: "Kumar", pmNumber: "12", party: "BJP", rulingPeriod: "1947 - 2023", about: "Very Good", achievements: "Bharat Ratna", logo: "Guljari-Nanda", signatureLogo: "Jawahar-Sign")
        LeaderDetail(leader: leader, leaders: [])
    }
}



