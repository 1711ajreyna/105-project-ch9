//
//  GesturesView.swift
//  105-project-ch9
//
//  Created by Andrew Reyna on 6/10/26.
//

import SwiftUI

struct GesturesView: View {
    
    var paragraph: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis ante ac dui laoreet tempus. Donec nec consectetur nisl. Duis porta scelerisque eros ut egestas. Duis suscipit dignissim risus, eu cursus dolor vulputate nec. Mauris vel aliquet purus."
    
    @State private var expanded: Bool = true
    
    @State private var isLiked: Bool = false
    
    func toggleLiked() {
        isLiked.toggle()
    }
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            // MARK: - Exercise 1 - Tap
            Text("Tap Me")
                .font(.title)
                .onTapGesture {
                    print("Tapped")
                }
            
            // MARK: - Exercise 2 - Expand Text with a Tap
            VStack(alignment: .leading, spacing: 10) {
                
                Text(paragraph)
                    .lineLimit(expanded ? nil : 2)
                
                Text(expanded ? "Show less" : "Show more...")
                    .italic()
                    .foregroundStyle(.blue)
                    .onTapGesture {
                        expanded.toggle()
                    }
            }
            .padding(35)
            
            // MARK: - Exercise 3 - Double Tap
            Text("Double Tap Me")
                .font(.title)
                .onTapGesture(count: 2) {
                    print("Double Tapped")
                }
            
            // MARK: - Exercise 4 - Double Tap - Like/Fav Feature
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .font(.title2)
                .foregroundStyle(isLiked ? .red : .gray)
            
                .onTapGesture {
                    isLiked.toggle()
                }
            
            ZStack{
                // My Design
                HStack{
                    Image("image1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(.circle)
                    
                    VStack(alignment: .leading){
                        Text("Name")
                            .font(.title2)
                        
                        Text("Description")
                            .font(.subheadline.italic())
                        
                    }
                    
                    Spacer()
                    
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .font(.title2)
                        .foregroundStyle(isLiked ? .red : .gray)
                        .scaleEffect(isLiked ? 1.2 : 1)
                }
                .padding(.vertical, 40)
                .padding(.horizontal, 20)
                .background(Color("SurfaceColor"))
            }
            .onTapGesture(count: 2){
                withAnimation(.spring){
                    isLiked.toggle()
                }
            }
            
            // MARK: - Exercise 5 - Long Press
            Text("Long Press Me")
                .onLongPressGesture {
                print("Long Pressed")
            }
            
            Image("image1")
                .resizable()
                .scaledToFill()
                .frame(width: 100)
                .contextMenu{
                    Button("Action 1"){}
                    Button("Action 1"){}
                }
        }
        .padding()
    }
}

#Preview {
    GesturesView()
}
