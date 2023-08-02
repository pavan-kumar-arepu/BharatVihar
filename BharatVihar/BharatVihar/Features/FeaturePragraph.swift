//
//  FeaturePragraph.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 02/08/23.
//

import Foundation
import SwiftUI
import UIKit


import SwiftUI
import UIKit

struct HighlightedTextView: UIViewRepresentable {
    var paragraph: String
    var highlightedWords: [String]
    var onTappedWord: ((String) -> Void)?
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true
        
        let attributedString = NSMutableAttributedString(string: paragraph)
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.green]
        
        for word in highlightedWords {
            let range = (paragraph as NSString).range(of: word)
            attributedString.addAttributes(attributes, range: range)
        }
        
        textView.attributedText = attributedString
        
        // Add tap gesture recognizer
        let tapGestureRecognizer = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(_:)))
        textView.addGestureRecognizer(tapGestureRecognizer)
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        // Update UI if needed
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: HighlightedTextView
        
        init(_ parent: HighlightedTextView) {
            self.parent = parent
        }
        
        @objc func handleTap(_ sender: UITapGestureRecognizer) {
            let textView = sender.view as! UITextView
            let layoutManager = textView.layoutManager
            
            var location = sender.location(in: textView)
            location.x -= textView.textContainerInset.left
            location.y -= textView.textContainerInset.top
            
            let characterIndex = layoutManager.characterIndex(for: location, in: textView.textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
            
            for word in parent.highlightedWords {
                if parent.paragraph.contains(word) {
                    let range = (parent.paragraph as NSString).range(of: word)
                    if NSLocationInRange(characterIndex, range) {
                        parent.onTappedWord?(word)
                        break
                    }
                }
            }
        }
    }
}



struct FeatureParagraphView: View {
    @State private var tappedWord: String?
    
    var body: some View {
        VStack {
            HighlightedTextView(paragraph: """
            Explore the vibrant tapestry of India, a land that celebrates its rich heritage through captivating features. Immerse yourself in our Photogallery where stunning images vividly depict the nation's grandeur. Discover the enchantment of diverse Festivals in India that pulse with color and tradition. Embark on virtual journeys to India's top Tourist Attractions, offering immersive live street views.
            """, highlightedWords: ["Photogallery", "tradition", "Attractions"], onTappedWord: { word in
                self.tappedWord = word
            })
                .frame(height: 300)
            
            if let tappedWord = tappedWord {
                Text("Tapped word: \(tappedWord)")
                    .padding()
            }
        }
    }
}


struct FeatureParagraphView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureParagraphView() // Provide a binding here
    }
}
