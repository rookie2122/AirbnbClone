//
//  DestinationSearchView.swift
//  airbnb
//
//  Created by SENA on 18.09.2024.
//

import SwiftUI


enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @ObservedObject var viewModel: ListingViewModel
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numberOfGuests = 0
   
    var body: some View {
        
        VStack {
            HStack {
                Button{
                    withAnimation {
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                Spacer()
                
                if !destination.isEmpty{
                    Button{
                        destination = ""
                    } label: {
                        Text("Clear")
                            .foregroundStyle(.black)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                }
                
                
            }
            .padding()
            
            
            
            VStack(alignment:.leading){
                if selectedOption == .location{
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        TextField("Search destination",text: $destination)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingsForLocation(_location: destination)
                                show.toggle()
                            }
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else{
                    CollapsedPickerView(title: "Where ", description: "Add location")
                }
            }
            .padding()
            .frame(height: selectedOption == .location ?  120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy){ selectedOption = .location }
            }
            
            // date
            
            VStack(alignment: .leading) {
                if selectedOption == .dates{
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        
                        Divider()
                        
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                        
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    
                } else {
                    CollapsedPickerView(title: "When ", description: "Add dates")
                    
                }
                
            }
            .padding()
            .frame(height: selectedOption == .dates ?  180 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy){ selectedOption = .dates }
            }
            
            
            // guests
            
            
            VStack(alignment:.leading){
                if selectedOption == .guests{
                    Text("Who's coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Text("\(numberOfGuests) Adults")
                        Stepper("", value:$numberOfGuests,in: 0...9999 )
                    }
                } else{
                    CollapsedPickerView(title: "Who", description: "Add guests")
                    
                }
            }
            .padding()
            .frame(height: selectedOption == .guests ?  120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy){ selectedOption = .guests }
            }
        }
        Spacer()
    }
}

#Preview {
    DestinationSearchView(show: .constant(false), viewModel: ListingViewModel())
}

struct CollapsedPickerView: View {
    
    let title: String
    let description:String
    
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
            }
            .font(.subheadline)
            .fontWeight(.semibold)
        }
    }
}
    

