//
//  SpecialistCardView.swift
//  105-project-ch9
//
//  Created by Andrew Reyna on 6/3/26.
//

import SwiftUI

struct SpecialistCardView: View {
    
    var name: String = "Specialist Name"
    var specialty: String = "Specialty"
    var priceRange: String = "$xxx-$xxx"
    var rating: Double = 4.5
    
    var body: some View {
        HStack(spacing: 14) {
            
            // MARK: - Avatar
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 54, height: 54)
                .foregroundStyle(Color("MainColor").opacity(0.3))
                .clipShape(Circle())
            
            // MARK: - Info
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.headline)
                    .foregroundStyle(.black)
                
                Text(specialty)
                    .font(.subheadline)
                    .foregroundStyle(Color("MainColor"))
                
                Text(priceRange)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            // MARK: - Rating + Book Button
            VStack(alignment: .trailing, spacing: 10) {
                
                // Star Rating
                HStack(spacing: 3) {
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundStyle(.yellow)
                    Text(String(format: "%.1f", rating))
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
    VStack(spacing: 14) {
        SpecialistCardView(
            name: "Maria Johnson",
            specialty: "Lash Technician",
            priceRange: "$80–$120",
            rating: 4.8
        )

    }
    .padding()
}
