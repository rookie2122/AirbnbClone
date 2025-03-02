//
//  WishlistView.swift
//  airbnb
//
//  Created by SENA on 1.10.2024.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading,spacing: 32){
                
                VStack(alignment:.leading,spacing: 4){
                    Text("Log in to view your wishlists.")
                        .font(.headline)
                    Text("You can create, view or edit wishlists once you've logged in")
                        .font(.footnote)
                    
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
                
                    Spacer()
                
            }
            .padding()
            .navigationTitle("Wishlist")
            
        }
        
    }
}

#Preview {
    WishlistView()
}
