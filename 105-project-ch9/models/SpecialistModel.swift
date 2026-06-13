//
//  SpecialistModel.swift
//  105-project-ch9
//
//  Created by Andrew Reyna on 6/6/26.
//

import Foundation

class Specialist: Identifiable {
    
    // MARK: - Properties
    let id = UUID()          // add this line for Identifiable
    var name: String
    var specialty: String
    var minPrice: Double
    var maxPrice: Double
    var rating: Double
    var image: String
    var description: String
    
    // MARK: -Initializer
    init(name: String,
         specialty: String,
         minPrice: Double,
         maxPrice: Double,
         rating: Double,
         image: String,
         description: String = "") {
        self.name = name
        self.specialty = specialty
        self.minPrice = minPrice
        self.maxPrice = maxPrice
        self.rating = rating
        self.image = image
        self.description = description
    }
}
