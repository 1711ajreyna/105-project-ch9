//
//  SpecialistView.swift
//  105-project-ch9
//
//  Created by Andrew Reyna on 6/3/26.
//

import SwiftUI

struct SpecialistView: View {
    var body: some View {
        // Navigation container for the screen
        NavigationStack {
            
            // Background color
            ZStack {
                Color("MainColor")
                    .ignoresSafeArea()
                
                // Main Stack
                VStack(spacing:30) {
                    
                    //Mark: - Title & Search Box
                    VStack(spacing:30){
                        
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
                    }
                    
                    //MARK: - Sections: Categories & Top Specialist
                    VStack(spacing:37){
                        
                        // Categories
                        VStack(spacing:20){
                            
                            HStack{
                                Text("Categories")
                                    .font(.title2.bold())
                                    .accessibilityLabel("Categories")
                                    .accessibilityHint("This section shows beauty service categories")
                                
                                Spacer()
                                
                                NavigationLink(destination: CategoriesView()){
                                    Text("See all")
                                        .font(.headline)
                                        .foregroundStyle(Color("MainColor"))
                                }
                                .accessibilityLabel("See all categories")
                                .accessibilityHint("Double tap to open the full list of beauty categories")
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing:20){
                                    
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
                        } // END: Categories
                        .padding(.horizontal,30)
                        .padding(.vertical,20)
                        
                        // Top Specialist
                        VStack(alignment:.leading, spacing:20){
                            Text("Top Specialists")
                                .font(.title2.bold())
                                .accessibilityLabel("Top Specialists")
                                .accessibilityHint("This section shows highly rated beauty specialists")
                            
                            ScrollView(.vertical, showsIndicators: false) {
                                VStack(spacing: 14) {
                                    SpecialistCardView(specialist: Specialist(name: "Maria Johnson", specialty: "Lash Technician", minPrice: 80, maxPrice: 120, rating: 4.8, image: "image1"))
                                        .accessibilityLabel("Maria Johnson, Lash Technician")
                                        .accessibilityHint("Prices range from 80 to 120 dollars. Rating is 4.8 out of 5")
                                    
                                    SpecialistCardView(specialist: Specialist(name: "Sophie Lee", specialty: "Nail Artist", minPrice: 50, maxPrice: 90, rating: 4.5, image: "image2"))
                                        .accessibilityLabel("Sophie Lee, Nail Artist")
                                        .accessibilityHint("Prices range from 50 to 90 dollars. Rating is 4.5 out of 5")
                                    
                                    SpecialistCardView(specialist: Specialist(name: "Priya Patel", specialty: "Hair Stylist", minPrice: 100, maxPrice: 200, rating: 5.0, image: "image3"))
                                        .accessibilityLabel("Priya Patel, Hair Stylist")
                                        .accessibilityHint("Prices range from 100 to 200 dollars. Rating is 5 out of 5")
                                    
                                    SpecialistCardView(specialist: Specialist(name: "Jane Smith", specialty: "Brow Specialist", minPrice: 60, maxPrice: 100, rating: 4.2, image: "image4"))
                                        .accessibilityLabel("Jane Smith, Brow Specialist")
                                        .accessibilityHint("Prices range from 60 to 100 dollars. Rating is 4.2 out of 5")
                                    
                                    SpecialistCardView(specialist: Specialist(name: "Lisa Chen", specialty: "Skin Care", minPrice: 90, maxPrice: 150, rating: 4.7, image: "image5"))
                                        .accessibilityLabel("Lisa Chen, Skin Care Specialist")
                                        .accessibilityHint("Prices range from 90 to 150 dollars. Rating is 4.7 out of 5")
                                        .padding(.horizontal, 20)
                                        .padding(.bottom, 30)
                                }
                            }
                            .padding(.vertical,10)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color("SurfaceColor"))
                        
                    } //End: VStack - Main Stack
                } //End: ZStack - Background Color
            } //End: NavigationStack
        } //End: body
    }  //End: specialistView
}

#Preview {
    SpecialistView()
}
