//
//  LeaderImageView.swift
//  IndianLeaders
//
//  Created by Pavankumar Arepu on 21/06/23.
//

import SwiftUI

/// To Load Leader Image in detail screen
/// - Parameters:
///   - size: The width of the rectangle.
///   - name: The height of the rectangle.
///   - alignment: The height of the rectangle.
/// - returns: View

struct LeaderImage: View {
    var size: CGFloat
    var name: String
    var alignment: Alignment
    
    var body: some View {
        Image(name)
            .resizable()
            .clipShape(Circle())
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size)
            .frame(maxWidth: .infinity, alignment: alignment)
            .overlay {
                Circle().stroke(.blue, lineWidth: 3)
            }
            .shadow(radius: 3)
    }
}

struct LeaderImageView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderImage(size: 200.0, name: "Atal-Bihari", alignment: .top)
    }
}

/*
 To Load Signature Image
 - parameter: name: SignatueName from servers.
 - returns: View
 */
struct Signature: View {
    var name: String
    
    var body: some View {
        Image(name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity, alignment: .top)
    }
}

struct Signature_Previews: PreviewProvider {
    static var previews: some View {
        Signature(name: "Jawahar-Sign")
    }
}
