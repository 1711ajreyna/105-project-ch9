//
//  BookAppointmentView.swift
//  105-project-ch9
//
//  Created by Andrew Reyna on 6/3/26.
//

import SwiftUI

struct BookAppointmentView: View {
    var body: some View {
        ZStack {
            Color("MainColor")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image(systemName: "calendar.badge.plus")
                    .font(.system(size: 60))
                    .foregroundStyle(.white.opacity(0.8))
                
                Text("Book Appointment")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                Text("Under Construction...")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.7))
            }
        }
        .navigationBarBackButtonHidden(false)  // shows back arrow
        .navigationTitle("")
    }
}

#Preview {
    NavigationStack {
        BookAppointmentView()
    }
}
