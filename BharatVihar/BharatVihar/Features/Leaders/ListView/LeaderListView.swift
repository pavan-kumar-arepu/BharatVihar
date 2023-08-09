//
//  LeaderListView.swift
//  IndianLeaders
//
//  Created by Pavankumar Arepu on 21/06/23.
//

import SwiftUI

/// Responsbile to render list of Leaders
///
/// - returns: View
struct LeaderListView: View {
    
    var leaderVM = LeaderViewModel()
    
    @State private var leaders: [Leader] = []
    @State private var bgImage = UIImage(named: "DefaultBg")
    @State private var isLoading = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                IndianGradient()
                //HBackground()
                
                if isLoading {
                    ChakraImage()
                    ProgressView()
                } else {
                    VStack {
                        if let backgroundImage = bgImage {
                               Image(uiImage: backgroundImage)
                                   .resizable()
                                   .scaledToFill()
                                   .frame(height: 200) // Set the desired height for your background image
                           }
                        
                        List(leaders) { leader in
                            NavigationLink(destination: LeaderDetail(leader: leader, leaders: leaders)){
                                LeaderRow(leader: leader)
                            }
                        }
                        .navigationTitle(" Leaders")
                    }
                    
                }
            }
        }
        .onAppear {
            isLoading = true
            loadData()
        }
    }
    
    
    /// Responsbile to load the Leaders ListView once data received
    /// Show the indicator
    ///
    func loadData() {
        leaderVM.fetchData { status in
            if status {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isLoading = false
                    leaders = leaderVM.leaders
                    bgImage = leaderVM.bgImage
                    print("data downloaded completed")
                }
            }
            else {
                    print("Error retrieving data")
                }
            }
        }
    }
    
    struct LeaderListView_Previews: PreviewProvider {
        static var previews: some View {
            LeaderListView()
        }
    }
