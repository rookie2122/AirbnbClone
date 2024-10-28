//
//  ExploreView.swift
//  airbnb
//
//  Created by SENA on 8.09.2024.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject var viewModel = ListingViewModel()
    @State private var showDestinationSearchView = false
    
    var body: some View {
        NavigationStack{
            
            if showDestinationSearchView{
                DestinationSearchView(show: $showDestinationSearchView, viewModel: viewModel)
            } else{
                ScrollView{
                    SearchAndFilterBar()
                        .onTapGesture {
                            withAnimation(.snappy){
                                showDestinationSearchView.toggle()
                            }
                        }
                    LazyVStack(spacing: 32){
                        ForEach(viewModel.items){ item in
                            NavigationLink(destination: ListingDetailView(model: item))
                            {
                                ListingItemView(model: item)
                               .frame(height: 400)
                               .clipShape(RoundedRectangle(cornerRadius: 10))

                            }
                            
                            
                            
                            
                        }
                    }
                    .padding()
                }
            }
            
            
            
        }
        .onAppear{
            viewModel.fetchData()
        }
       
    }
}

#Preview {
    ExploreView()
}
