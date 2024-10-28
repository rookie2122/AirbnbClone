//
//  ProfileView.swift
//  airbnb
//
//  Created by SENA on 1.10.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            VStack(alignment:.leading, spacing: 32)  {
                VStack(alignment:.leading,spacing: 8) {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text("Log in to start planning your next trip.")
                }
                Button{
                    
                } label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .frame(width: 360,height: 48)
                        .background(.pink)
                        .cornerRadius(8)
                        .font(.subheadline)
                }
                
                HStack{
                    Text("Don't have an account?")
                    Text("Sign up")
                        .underline()
                        .fontWeight(.semibold)
                }
                .font(.caption)
            }
            
            VStack(spacing:24){
                
                ProfileOptionrowView(imageName: "gear", title: "Settings")
                ProfileOptionrowView(imageName: "gear", title: "Accessibilitiy")
                ProfileOptionrowView(imageName: "questionmark.circle", title: "Visit the Help Center")
            }
            .padding(.vertical)
            
        }
        .padding()
        
        
    }
}


#Preview {
    ProfileView()
}
