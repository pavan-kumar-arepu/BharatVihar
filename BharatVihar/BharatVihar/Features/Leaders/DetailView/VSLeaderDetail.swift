//
//  VerticalScrollLeaderDetail.swift
//  IndianLeaders
//
//  Created by Pavankumar Arepu on 21/06/23.
//

import SwiftUI

/*
/// This class is part of "LeaderDetails"
/// Responsbile to render top part of this screen(DetailsScreen) based on the selection from ListView
/// - returns: Top part of LeaderDetails View

struct VSLeaderDetail: View {
    var leader: Leader
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Spacer()

                LeaderImage(size: 200.0, name: leader.logo, alignment: .top)
                
                Spacer()
                
                HStack(alignment: .center) {
                    Text("\(leader.rulingPeriod) \n\(leader.party)")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)

                }
                
                Spacer()
                
                if let aboutLeader = leader.about {
                    HStack {
                        Text("About:").bold().font(.title3) +
                        Text("\n") +
                        Text(aboutLeader).font(.subheadline)
                    }
                }
                
                Spacer()
                
                if let leaderAchiv = leader.achievements {
                    HStack {
                        Text("Achievements:").bold().font(.title3) +
                        Text("\n") +
                        Text(leaderAchiv).font(.subheadline)
                    }
                }
                
                if leader.signatureLogo.count > 0 {
                    HStack {
                        Text("Signature:").bold().font(.title3)
                        Signature(name: leader.signatureLogo).font(.subheadline)
                    }
                }
                Spacer()
            }
        }
        .padding()
    }
}

struct VSLeaderDetail_Previews: PreviewProvider {
    static var previews: some View {
        let leader: Leader = Leader(id: 1, name: "Kumar", pmNumber: "12", party: "BJP", rulingPeriod: "1947 - 2023", about: "IndianLeaders[49277:999645] [connection] nw_connection_copy_protocol_metadata_internal_block_invoke [C2] Client called nw_connection_copy_protocol_metadata_internal on unconnected nw_connection", achievements: "Bharat RatnaBharat RatnaBharat Ratna", logo: "Guljari-Nanda", signatureLogo: "Jawahar-Sign")
        VSLeaderDetail(leader: leader)
    }
}

*/
