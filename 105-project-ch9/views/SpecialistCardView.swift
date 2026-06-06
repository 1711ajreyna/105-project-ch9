//
//  SpecialistCardView.swift
//  105-project-ch9
//
//  Created by Andrew Reyna on 6/3/26.
//

import SwiftUI

struct SpecialistCardView: View {
    
    // MARK: - Property
    var specialist: Specialist
    
    var body: some View {
        HStack(spacing: 14) {
            
            // MARK: - Specialist Icon
            Image(systemName: specialist.image)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .foregroundStyle(Color("MainColor"))
            
            // MARK: - Specialist Information
            VStack(alignment: .leading, spacing: 4) {
                
                // Specialist Name
                Text(specialist.name)
                    .font(.headline)
                    .foregroundStyle(Color("MainColor"))
                
                // Specialty
                Text(specialist.specialty)
                    .font(.subheadline)
                
                // Price Range
                Text("$\(specialist.minPrice, specifier: "%.2f") - $\(specialist.maxPrice, specifier: "%.2f")")
                    .font(.footnote)
                    .bold()
            }
            
            Spacer()
            
            // MARK: - Rating + Book Button
            VStack(alignment: .center) {
                
                // Star Rating
                HStack(spacing: 3) {
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundStyle(.yellow)
                    Text(String(format: "%.1f", specialist.rating))
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.black)
                }
                
                // Book Button
                NavigationLink(destination: BookAppointmentView()) {
                    Text("Book")
                        .font(.caption.weight(.bold))
                        .foregroundStyle(.white)
                        .padding(.vertical, 7)
                        .padding(.horizontal, 18)
                        .background(Color("MainColor"))
                        .clipShape(Capsule())
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Color("MainColor").opacity(0.1), radius: 10, x: 0, y: 4)
    }
}

#Preview {
    NavigationStack {
        VStack(spacing: 14) {
            SpecialistCardView(specialist: Specialist(
                name: "Fernanda",
                specialty: "Nails",
                minPrice: 10.00,
                maxPrice: 12.00,
                rating: 4.5,
                image: "person.crop.circle.fill"
            ))
            SpecialistCardView(specialist: Specialist(
                name: "Maria Johnson",
                specialty: "Lash Technician",
                minPrice: 80.00,
                maxPrice: 120.00,
                rating: 4.8,
                image: "person.crop.circle.fill"
            ))
            SpecialistCardView(specialist: Specialist(
                name: "Sophie Lee",
                specialty: "Nail Artist",
                minPrice: 50.00,
                maxPrice: 90.00,
                rating: 4.5,
                image: "person.crop.circle.fill"
            ))
        }
        .padding()
        .background(Color(.systemGroupedBackground))
    }
}
