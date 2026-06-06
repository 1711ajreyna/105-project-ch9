//
//  CategoriesView.swift
//  105-project-ch9
//
//  Created by Andrew Reyna on 6/3/26.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "progress.indicator")
                .font(.largeTitle.bold())
            
            Text("All Categories")
                .font(.largeTitle)
            
            Text("Under Construction...")
                .foregroundStyle(.gray)
            
        }
        .navigationTitle("All Categories")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CategoriesView()
}
