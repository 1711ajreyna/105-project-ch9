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
    @State private var isFavorite = false
    
    // Tracks whether the specialist description is expanded or collapsed.
    // When false, only two lines of the description will show.
    @State private var isExpanded = false
    
    
    // MARK: - Body
    
    var body: some View {
        
        // Main horizontal container for the specialist card
        HStack(spacing: 14) {
            
            // MARK: - Specialist Profile Image
            
            Image(specialist.image)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
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
                
                
                // MARK: - Specialist Description
                
                // Shows only two lines when collapsed.
                // Shows the full description when expanded.
                Text(specialist.description)
                    .font(.subheadline.italic())
                    .foregroundStyle(.secondary)
                    .lineLimit(isExpanded ? nil : 2)
                
                
                // MARK: - Read More / Read Less Tap Gesture
                
                // Tapping this text expands or collapses the description.
                Text(isExpanded ? "Read Less" : "Read More...")
                    .font(.caption)
                    .italic()
                    .foregroundColor(.blue)
                    .onTapGesture {
                        
                        isExpanded.toggle()
                        
                    } // END - Read More / Read Less Tap Gesture
                
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
                    .scaleEffect(isFavorite ? 1.2 : 1)
                
                    // Single Tap Gesture
                    // Tapping the heart directly will
                    // favorite or unfavorite the specialist.
                    .onTapGesture {
                        
                        isFavorite.toggle()
                        
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
        .contentShape(Rectangle())
        .onTapGesture(count: 2) {
            
            isFavorite.toggle()
            
        } // END - Double Tap Gesture
        
        
        // MARK: - Accessibility
        
        .accessibilityLabel("\(specialist.name), \(specialist.specialty)")
        .accessibilityHint("Price range is \(specialist.minPrice, specifier: "%.2f") to \(specialist.maxPrice, specifier: "%.2f") dollars. Rating is \(specialist.rating, specifier: "%.1f") out of 5 stars. Tap Read More to expand the description. Book an appointment by tapping the Book button, or double tap the card to favorite this specialist.")
        
        
        // MARK: - Card Styling
        
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        
        // White card background
        .background(.white)
        
        // Rounded corners
        .clipShape(RoundedRectangle(cornerRadius: 16))
        
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
                    image: "image1",
                    description: "Fernanda specializes in clean nail designs, gel polish, acrylic nails, and simple custom nail art for clients who want a polished everyday look."
                )
            )
            
            SpecialistCardView(
                specialist: Specialist(
                    name: "Maria Johnson",
                    specialty: "Lash Technician",
                    minPrice: 80.00,
                    maxPrice: 120.00,
                    rating: 4.8,
                    image: "image2",
                    description: "Maria Johnson is a lash technician who focuses on classic sets, hybrid lashes, and volume lash extensions with a comfortable appointment experience."
                )
            )
            
            SpecialistCardView(
                specialist: Specialist(
                    name: "Sophie Lee",
                    specialty: "Hair Stylist",
                    minPrice: 50.00,
                    maxPrice: 90.00,
                    rating: 4.5,
                    image: "image3",
                    description: "Sophie Lee provides beauty services for clients looking for a fresh style, detailed care, and a relaxing booking experience."
                )
            )
            
        } // END - VStack
        
        .padding()
        .background(Color(.systemGroupedBackground))
        
    } // END - NavigationStack
    
} // END - Preview
