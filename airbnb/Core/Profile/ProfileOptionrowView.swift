//
//  ProfileOptionrowView.swift
//  airbnb
//
//  Created by SENA on 1.10.2024.
//

import SwiftUI

struct ProfileOptionrowView: View {
    let imageName: String
    let title: String
    var body: some View {
        
        VStack{
            HStack{
                Image(systemName: imageName)
                Text(title)
                    .font(.subheadline)
                Spacer()
                Image(systemName: "chevron.right")
            }
            Divider()
        }
        
    }
}

#Preview {
    ProfileOptionrowView(imageName: "gear", title: "Settings")
}
