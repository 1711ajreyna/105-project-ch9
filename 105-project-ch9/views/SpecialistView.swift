//
//  SpecialistView.swift
//  105-project-ch9
//
//  Created by Andrew Reyna on 6/3/26.
//

import SwiftUI

struct SpecialistView: View {
    
    // MARK: - State Properties
    
    // Tracks whether the screen is in day mode or night mode.
    // When false, the app uses the normal MainColor background.
    // When true, the app uses a darker night mode background.
    @State private var isNightMode = false
    
    
    // MARK: - Body
    
    var body: some View {
        
        // Navigation container for the screen
        NavigationStack {
            
            // Background color
            ZStack {
                
                // MARK: - Day / Night Background
                
                // Changes the background color depending on the Toggle.
                // If isNightMode is true, the background becomes black.
                // If isNightMode is false, the background uses MainColor.
                (isNightMode ? Color.black : Color("MainColor"))
                    .ignoresSafeArea()
                
                
                // Main Stack
                VStack(spacing: 30) {
                    
                    // MARK: - Title, Search Box & Toggle
                    
                    VStack(spacing: 30) {
                        
                        Text("Find Your Beauty Specialist!")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .accessibilityLabel("Find Your Beauty Specialist")
                            .accessibilityHint("This is the main title of the screen")
                        
                        TextField("Lashes...", text: .constant(""))
                            .padding()
                            .background(.white)
                            .cornerRadius(4)
                            .padding(.horizontal, 40)
                            .accessibilityLabel("Search for a beauty specialist")
                            .accessibilityHint("Type a service such as lashes, eyebrows, nails, facial, or hair")
                        
                        
                        // MARK: - Day / Night Toggle
                        
                        // Toggle allows the user to switch
                        // between day mode and night mode.
                        Toggle(isNightMode ? "Night Mode" : "Day Mode", isOn: $isNightMode)
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 40)
                            .foregroundColor(.black)
                            .accessibilityLabel("Day and night mode toggle")
                            .accessibilityHint("Double tap to switch between day mode and night mode")
                        
                    } // END - VStack (Title, Search Box & Toggle)
                    
                    
                    // MARK: - Sections: Categories & Top Specialist
                    
                    VStack(spacing: 37) {
                        
                        // Categories
                        VStack(spacing: 20) {
                            
                            HStack {
                                Text("Categories")
                                    .font(.title2.bold())
                                    .accessibilityLabel("Categories")
                                    .accessibilityHint("This section shows beauty service categories")
                                
                                Spacer()
                                
                                NavigationLink(destination: CategoriesView()) {
                                    Text("See all")
                                        .font(.headline)
                                        .foregroundStyle(Color("MainColor"))
                                }
                                .accessibilityLabel("See all categories")
                                .accessibilityHint("Double tap to open the full list of beauty categories")
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    
                                    CategoryCardView(icon: "eye", title: "Lashes")
                                        .accessibilityLabel("Lashes category")
                                        .accessibilityHint("Double tap to view lash specialists")
                                    
                                    CategoryCardView(icon: "eyebrow", title: "Eyebrows")
                                        .accessibilityLabel("Eyebrows category")
                                        .accessibilityHint("Double tap to view eyebrow specialists")
                                    
                                    CategoryCardView(icon: "hand.raised", title: "Nails")
                                        .accessibilityLabel("Nails category")
                                        .accessibilityHint("Double tap to view nail specialists")
                                    
                                    CategoryCardView(icon: "face.smiling.inverse", title: "Facial")
                                        .accessibilityLabel("Facial category")
                                        .accessibilityHint("Double tap to view facial specialists")
                                }
                            }
                        } // END - Categories
                        .padding(.horizontal, 30)
                        .padding(.vertical, 20)
                        
                        
                        
                        // Top Specialist
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Top Specialists")
                                .font(.title2.bold())
                                .accessibilityLabel("Top Specialists")
                                .accessibilityHint("This section shows highly rated beauty specialists")
                            
                            ScrollView(.vertical, showsIndicators: false) {
                                VStack(spacing: 14) {
                                    
                                    SpecialistCardView(
                                        specialist: Specialist(
                                            name: "Maria Johnson",
                                            specialty: "Lash Technician",
                                            minPrice: 80,
                                            maxPrice: 120,
                                            rating: 4.8,
                                            image: "image1",
                                            description: "Maria Johnson is a lash technician who focuses on classic sets, hybrid lashes, and volume lash extensions with a comfortable appointment experience."
                                        )
                                    )
                                    
                                    SpecialistCardView(
                                        specialist: Specialist(
                                            name: "Sophie Lee",
                                            specialty: "Nail Artist",
                                            minPrice: 50,
                                            maxPrice: 90,
                                            rating: 4.5,
                                            image: "image2",
                                            description: "Sophie Lee specializes in nail art, gel polish, acrylic nails, and clean designs for clients who want a polished everyday look."
                                        )
                                    )
                                    
                                    SpecialistCardView(
                                        specialist: Specialist(
                                            name: "Priya Patel",
                                            specialty: "Hair Stylist",
                                            minPrice: 100,
                                            maxPrice: 200,
                                            rating: 5.0,
                                            image: "image3",
                                            description: "Priya Patel provides hair styling, trims, color services, and special occasion styling with a focus on healthy hair care."
                                        )
                                    )
                                    
                                    SpecialistCardView(
                                        specialist: Specialist(
                                            name: "Jane Smith",
                                            specialty: "Brow Specialist",
                                            minPrice: 60,
                                            maxPrice: 100,
                                            rating: 4.2,
                                            image: "image4",
                                            description: "Jane Smith focuses on brow shaping, brow tinting, and detailed eyebrow services designed to match each client's face shape."
                                        )
                                    )
                                    
                                    SpecialistCardView(
                                        specialist: Specialist(
                                            name: "Lisa Chen",
                                            specialty: "Skin Care",
                                            minPrice: 90,
                                            maxPrice: 150,
                                            rating: 4.7,
                                            image: "image5",
                                            description: "Lisa Chen provides skin care services including facials, basic treatments, and relaxing appointments for clients looking to refresh their skin."
                                        )
                                    )
                                    .padding(.horizontal, 20)
                                    .padding(.bottom, 30)
                                    
                                } // END - VStack (Specialist Cards)
                            } // END - ScrollView
                            .padding(.vertical, 10)
                        } // END - VStack (Top Specialists)
                        .padding(.horizontal, 30)
                        
                    }// END - VStack (Categories & Top Specialist)
                    .background(Color("SurfaceColor"))
                    
                } // END - Main Stack
                
            } // END - ZStack
            
        } // END - NavigationStack
        
    } // END - body
    
} // END - SpecialistView


#Preview {
    SpecialistView()
}
