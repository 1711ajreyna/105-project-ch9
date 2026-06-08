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
                        
                        TextField("Lashes...", text: .constant(""))
                            .padding()
                            .background(.white)
                            .cornerRadius(4)
                            .padding(.horizontal, 40)
                    }
                    
                    //MARK: - Sections: Categories & Top Specialist
                    VStack(spacing:37){
                        
                        // Categories
                        VStack(spacing:20){
                            
                            HStack{
                                Text("Categories")
                                    .font(.title2.bold())
                                
                                Spacer()
                                
                                NavigationLink(destination: CategoriesView()){
                                    Text("See all")
                                        .font(.headline)
                                        .foregroundStyle(Color("MainColor"))
                                }
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing:20){
                                    
                                    CategoryCardView(icon: "eye", title: "Lashes")
                                    
                                    CategoryCardView(icon: "eyebrow", title: "Eyebrows")
                                    
                                    CategoryCardView(icon: "hand.raised", title: "nails")
                                    
                                    CategoryCardView(icon: "face.smiling.inverse", title: "Facial")
                                    
                                    
                                    
                                }
                                
                            }
                        } // END: Categories
                        .padding(.horizontal,30)
                        .padding(.vertical,20)
                        
                        // Top Specialist
                        VStack(alignment:.leading, spacing:20){
                            Text("Top Specialists")
                                .font(.title2.bold())
                            ScrollView(.vertical, showsIndicators: false) {
                                VStack(spacing: 14) {
                                    SpecialistCardView(specialist: Specialist(name: "Maria Johnson", specialty: "Lash Technician", minPrice: 80, maxPrice: 120, rating: 4.8, image: "image1"))
                                    
                                    SpecialistCardView(specialist: Specialist(name: "Sophie Lee", specialty: "Nail Artist", minPrice: 50, maxPrice: 90, rating: 4.5, image: "image2"))
                                    
                                    SpecialistCardView(specialist: Specialist(name: "Priya Patel", specialty: "Hair Stylist", minPrice: 100, maxPrice: 200, rating: 5.0, image: "image3"))
                                    
                                    SpecialistCardView(specialist: Specialist(name: "Jane Smith", specialty: "Brow Specialist", minPrice: 60, maxPrice: 100, rating: 4.2, image: "image4"))
                                    
                                    SpecialistCardView(specialist: Specialist(name: "Lisa Chen", specialty: "Skin Care", minPrice: 90, maxPrice: 150, rating: 4.7, image: "image5"))                           .padding(.horizontal, 20)
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
