//
//  PageControlView.swift
//  BharatVihar
//
//  Created by Pavankumar Arepu on 13/08/23.
//

import Foundation
import SwiftUI

struct PageControlView: View {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    var body: some View {
        HStack {
            PageControl(numberOfPages: numberOfPages, currentPage: $currentPage)
        }
    }
}


struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.pageIndicatorTintColor = .gray
        return pageControl
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
}
