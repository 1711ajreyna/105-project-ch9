//
//  CategoriesView.swift
//  105-project-ch9
//
//  Created by Andrew Reyna on 6/3/26.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        
        ZStack {
            // Background
            Color("MainColor")
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                
                Image(systemName: "progress.indicator")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)        // white icon
                
                Text("All Categories")
                    .font(.largeTitle)
                    .foregroundStyle(.white)        // white title
                
                Text("Under Construction...")
                    .foregroundStyle(.white.opacity(0.7))  // soft white subtitle
            }
        }
        .navigationTitle("All Categories")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        CategoriesView()
    }
}
