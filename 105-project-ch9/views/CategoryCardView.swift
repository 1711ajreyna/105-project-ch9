//
//  CategoryCardView.swift
//  105-project-ch9
//
//  Created by Andrew Reyna on 6/3/26.
//

import SwiftUI

struct CategoryCardView: View {
    
    let icon: String
    let title: String
    
    var body: some View {
        VStack{
            Image(systemName: icon)
                .resizable()
                .font(.title)
                .foregroundStyle(Color("SurfaceColor"))
                .scaledToFit()
                .frame(width: 50, height: 50)
                .background(Color("MainColor"))
                .clipShape(.circle)
                .padding()
            Text(title)
                .font(.headline)

        }
        .frame(maxWidth:100, maxHeight:100)
        .background(.white)
        .cornerRadius(8)
    }
}

#Preview {
    CategoryCardView(icon: "hand.raised", title: "Nails")
}
