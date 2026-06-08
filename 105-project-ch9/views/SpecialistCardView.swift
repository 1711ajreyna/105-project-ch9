//
//  SpecialistCardView.swift
//  105-project-ch9
//
//  Created by Andrew Reyna on 6/3/26.
//

import SwiftUI

struct SpecialistCardView: View {
    
    // MARK: - Properties
    
    // Receives a Specialist object from SpecialistView
    var specialist: Specialist
    
    // MARK: - State Properties
    
    // Tracks whether this specialist is currently favorited.
    // SwiftUI automatically refreshes the UI whenever this value changes.
    @State private var isFavorite = false
    
    
    // MARK: - Functions
    
    // Called whenever the user favorites or unfavorites a specialist.
    func toggleFavorite() {
        isFavorite.toggle()
    } // END - toggleFavorite()
    
    
    // MARK: - Body
    
    var body: some View {
        
        // Main horizontal container for the specialist card
        HStack(spacing: 14) {
            
            // MARK: - Specialist Profile Image
            
            Image(systemName: specialist.image)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundStyle(Color("MainColor"))
            
            
            // MARK: - Specialist Information
            
            VStack(alignment: .leading, spacing: 4) {
                
                // Specialist Name
                Text(specialist.name)
                    .font(.headline)
                    .foregroundStyle(Color("MainColor"))
                
                // Specialist Service Type
                Text(specialist.specialty)
                    .font(.subheadline)
                
                // Price Range
                Text("$\(specialist.minPrice, specifier: "%.2f") - $\(specialist.maxPrice, specifier: "%.2f")")
                    .font(.footnote)
                    .bold()
                
            } // END - VStack (Specialist Information)
            
            
            Spacer()
            
            
            // MARK: - Favorite Heart, Rating & Book Button
            
            VStack(spacing: 8) {
                
                // MARK: - Favorite Heart
                
                // If favorited:
                // Displays a filled red heart.
                //
                // If not favorited:
                // Displays an empty gray heart.
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .font(.title3)
                    .foregroundStyle(isFavorite ? .red : .gray)
                    
                    // Single Tap Gesture
                    // Tapping the heart directly will
                    // favorite or unfavorite the specialist.
                    .onTapGesture {
                        
                        toggleFavorite()
                        
                    } // END - Heart Tap Gesture
                
                
                // MARK: - Star Rating
                
                HStack(spacing: 3) {
                    
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundStyle(.yellow)
                    
                    Text(String(format: "%.1f", specialist.rating))
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.black)
                    
                } // END - HStack (Star Rating)
                
                
                // MARK: - Book Appointment Button
                
                NavigationLink(destination: BookAppointmentView()) {
                    
                    Text("Book")
                        .font(.caption.weight(.bold))
                        .foregroundStyle(.white)
                        .padding(.vertical, 7)
                        .padding(.horizontal, 18)
                        .background(Color("MainColor"))
                        .clipShape(Capsule())
                    
                } // END - NavigationLink (Book Button)
                
            } // END - VStack (Favorite Heart, Rating & Book Button)
            
        } // END - HStack (Specialist Card Content)
        
        
        // MARK: - Double Tap Gesture
        
        // Makes the entire card respond to a double tap.
        // Similar to Instagram where users can double-tap
        // content to like or favorite it.
        .contentShape(Rectangle())
        .onTapGesture(count: 2) {
            
            toggleFavorite()
            
            print("\(specialist.name) favorited by double tap")
            
        } // END - Double Tap Gesture
        
        
        // MARK: - Card Styling
        
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        
        // White card background
        .background(.white)
        
        // Rounded corners
        .clipShape(RoundedRectangle(cornerRadius: 16))
        
        // Shadow effect adds depth
        .shadow(
            color: Color("MainColor").opacity(0.1),
            radius: 10,
            x: 0,
            y: 4
        )
        
    } // END - body
    
} // END - SpecialistCardView



// MARK: - Preview

#Preview {
    
    NavigationStack {
        
        VStack(spacing: 14) {
            
            SpecialistCardView(
                specialist: Specialist(
                    name: "Fernanda",
                    specialty: "Nails",
                    minPrice: 10.00,
                    maxPrice: 12.00,
                    rating: 4.5,
                    image: "person.crop.circle.fill"
                )
            )
            
            SpecialistCardView(
                specialist: Specialist(
                    name: "Maria Johnson",
                    specialty: "Lash Technician",
                    minPrice: 80.00,
                    maxPrice: 120.00,
                    rating: 4.8,
                    image: "person.crop.circle.fill"
                )
            )
            
            SpecialistCardView(
                specialist: Specialist(
                    name: "Sophie Lee",
                    specialty: "Nail Artist",
                    minPrice: 50.00,
                    maxPrice: 90.00,
                    rating: 4.5,
                    image: "person.crop.circle.fill"
                )
            )
            
        } // END - VStack
        
        .padding()
        .background(Color(.systemGroupedBackground))
        
    } // END - NavigationStack
    
} // END - Preview
