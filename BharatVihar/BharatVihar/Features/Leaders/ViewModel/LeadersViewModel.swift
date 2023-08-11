//
//  LeadersViewModel.swift
//  IndianLeaders
//
//  Created by Pavankumar Arepu on 19/06/23.
//

import Foundation
import UIKit

/*
/// This is a responsbile to get Leaders Array from DataService
///
/// This class is used by View i.e. LeadersListView

class LeaderViewModel: ObservableObject {
    
    ///   The @Published property wrapper is used in SwiftUI to automatically generate and manage the necessary code for publishing changes to properties.
    ///   When a property is marked with @Published, it becomes an observable object that can be observed by SwiftUI views, in our case, its 'LeaderListView'
    ///
    @Published var leaders: [Leader] = []
    @Published var bgImage: UIImage?
    
    private let dataService: DataService
    
    init(dataService: DataService = DataService.shared) {
        self.dataService = dataService
    }
    
    /// Responsbile to fetch data from DataService and send status to view via completionHandler
    /// Store received leaders VM's leaders var
    ///
    /// - Parameters:
    ///   - completion: Send status data back to View
    /// - Discussion: Once data received from DataService, then store leadersArray to 'leaders' published which is being observed by View(LeadersListView)
    
    //    func fetchData(completion: @escaping (Bool) -> Void) {
    //         dataService.getLeaders { leaders in
    //             if let leadersArray = leaders {
    //                 self.leaders = leadersArray
    //                 completion(true)
    //             } else {
    //                 completion(false)
    //             }
    //         }
    //     }

    func fetchData(completion: @escaping (Bool) -> Void) {
        dataService.getLeaderAndBgImage{ [weak self] leaders, backgroundImage in
            if let leadersArray = leaders {
                self?.leaders = leadersArray
                self?.bgImage = backgroundImage ?? UIImage(named: "DefaultBg")! // Set the background image in ViewModel
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}

*/
