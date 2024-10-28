//
//  ListingDetailView.swift
//  airbnb
//
//  Created by SENA on 11.09.2024.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    let model: AirbnbListing
   
    @Environment(\.dismiss) var dismiss
    @State private var cameraPosition: MapCameraPosition = .automatic
    var body: some View {
        ScrollView{
            
            ZStack(alignment:.topLeading) {
                ListingImageCarouselView(images: model.images?.compactMap { $0.imageUrl } ?? [])
                    .frame(height: 320)
                
                Button{
                    dismiss()
                }label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background{
                            Circle()
                                .fill(.white)
                                .frame(width: 32,height: 32)
                        }
                        .padding(40)
                }
               
                
                
            }
            
            
            VStack(alignment: .leading,spacing: 8){
                Text(model.subDescription?.title ?? "")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading){
                    HStack(spacing: 2){
                        Image(systemName: "star.fill")
                        Text(String(format: "%.2f",model.rating.guestSatisfaction))
                        Text(" - ")
                        Text(String(format: "%d", model.rating.reviewsCount))
                            .underline()
                            .fontWeight(.semibold)
                        Text("reviews")
                            .underline()
                            .fontWeight(.semibold)
                        
                    }
                    .foregroundStyle(.black)
                    
                    HStack{
                        ForEach((model.subDescription?.items)!,id: \.self){
                            item in
                            Text(item)
                            if item != (model.subDescription?.items)!.last {
                                Text("•")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity,alignment: .leading)
            
            
            Divider()
            
            //host info
            HStack{
                VStack(alignment:.leading,spacing: 4){
                    
                    Text("Hosted by \(model.host.name)")
                        .font(.headline)
                        .frame(width: 250,alignment: .leading)
                    
                    Text("\(model.host.timeAsHost?.years ?? 0) years hosting")
                        .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                Spacer()
                
                AsyncImage(url: URL(string: model.host.profileImage!)){ image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64,height: 64)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                        .frame(width: 100,height: 100)

                }
                .clipShape(Circle())
            }
            .padding()
            
            
            Divider()
            
            //listing features
            VStack(alignment: .leading,spacing: 16){
                HStack(spacing: 12){
                    Image(systemName: "door.left.hand.open")
                    VStack(alignment:.leading){
                        Text("Self check in")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Text("Check yourself in with the keypad.")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                }
                HStack(spacing: 12){
                    Image(systemName: "medal")
                    VStack(alignment:.leading){
                        Text("Superhost")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Text("Superhosts are experience, highly rated hosts who are commited to providing great stars for guests.")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                }
            }
            .padding()
           
            
            Divider()
            
            //where you'll sleep
            VStack(alignment:.leading,spacing:16){
                Text("Where you'll sleep")
                    .font(.headline)
                
                ScrollView(.horizontal,showsIndicators: false){
                    VStack(alignment:.leading){
                        Image(systemName: "bed.double")
                        Text("Bedroom")
                            .font(.headline)
                    }
                    .frame(width: 132,height: 100)
                    .overlay{
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(.gray)
                    }
                }
            }
            .padding()
            
            
            Divider()
            
            //listing amenities
            VStack(alignment: .leading,spacing: 16){
                Text("What this place offers")
                    .font(.headline)
                VStack(alignment:.leading,spacing: 16){
                    HStack { Image(systemName: "wifi")
                            .foregroundColor(.black)
                        Text("Wifi")
                            .font(.footnote)
                    }
                    HStack { Image(systemName: "shield.pattern.checkered")
                            .foregroundColor(.black)
                        Text("Alarm System")
                            .font(.footnote)
                    }
                    HStack { Image(systemName: "building.2.fill")
                            .foregroundColor(.black)
                        Text("Balcony")
                            .font(.footnote)
                    }
                    HStack { Image(systemName: "washer.fill")
                            .foregroundColor(.black)
                        Text("Laundry")
                            .font(.footnote)
                    }
                    HStack { Image(systemName: "tv.fill")
                            .foregroundColor(.black)
                        Text("TV")
                            .font(.footnote)
                    }
                   
                }
                .padding(.leading,0)
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Divider()
            
            //map
            VStack(alignment:.leading,spacing: 16){
                Text("Where you'll be")
                    .font(.headline)
                
                Map(position: $cameraPosition){
                if let coordinates = model.coordinates {
                    Annotation("",coordinate: CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)) {
                        ZStack{
                            Circle()
                                .frame(width: 100,height: 100)
                                .foregroundStyle(.black.opacity(0.3))
                            Image(systemName: "house.fill")
                                .frame(width: 100,height: 100)
                                
                        }
                    }
                }
            }
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .onAppear {updateMapRegion()}
            
            }
            .padding()
            
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom,72)
        .overlay(alignment:.bottom){
            VStack{
                Divider()
                    .padding(.bottom)
                
                HStack{
                    VStack(alignment:.leading){
                        Text(model.price.price)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("Total before taxes")
                            .font(.footnote)
                        HStack{
                            if let checkInDate = model.checkIn, let formattedDate = formatDate(checkInDate) {
                                Text("\(formattedDate) -")  }
                            if let checkOutDate = model.checkOut, let formattedDate = formatDate(checkOutDate) { Text("\(formattedDate)") }
                        }
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .underline()
                        
                        
                    }
                    Spacer()
                    
                    Button{
                        
                    } label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140,height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal,32)
            }
            .background(.white)
        }
        .navigationBarHidden(true)
       
        
    }
    
    func formatDate(_ dateString: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd" // Gelen tarih formatı
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "MMM d" // Çıkacak tarih formatı örneği: "September 18, 2024"
        
        if let date = inputFormatter.date(from: dateString) 
        {
            return outputFormatter.string(from: date)
        }
        return nil
    }
    
    
    
    func updateMapRegion() {
           if let coordinates = model.coordinates {
               let region = MKCoordinateRegion(
                   center: CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude),
                   span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
               )
               cameraPosition = .region(region) // Harita pozisyonunu güncelle
           }
       }

}



#Preview {
    ListingDetailView(model: AirbnbListing(id: "1",coordinates: Coordinates(latitude: 25.7617, longitude: -80.1918),descriptionOriginalLanguage: nil,metaDescription: nil,seoTitle: nil,sharingConfigTitle: "Hostel in London · ★4.49 · 1 bedroom · 1 bed · 1 shared bath",thumbnail: "https://a0.muscache.com/pictures/miso/Hosting-24978287/original/23db7045-cebf-4f56-b296-f1364d033729.jpeg", url: "https://example.com", androidLink: nil, iosLink: nil, propertyType: "House", roomType: "Entire home",homeTier: 1, personCapacity: 4,rating: Rating(accuracy: 4.8, checking: 4.7, cleanliness: 4.9, communication: 4.9, location: 5.0, value: 4.6, guestSatisfaction: 4.87, reviewsCount: 120), breadcrumbs: nil,location: "London",host: Host(id: "12345", name: "John Doe", profileImage: "https://a0.muscache.com/im/pictures/user/9c4eca71-be4e-4317-b690-2f8e58f51641.jpg", isSuperHost: true, isVerified: true, highlights: nil, about: nil, ratingCount: 50, ratingAverage: 4.9, hostDetails: nil, timeAsHost: TimeAsHost(months: 6, years: 2)),locationSubtitle: "Near the beach",locationDescriptions: nil,title: "Beautiful Beachfront House",description: "A wonderful place to stay near the beach.",subDescription: SubDescription (title:"Room in London, United Kingdom", items:[ "1 bunk bed","Shared bathroom"]), price: Price(label: "per night", qualifier: nil, price: "$35", originalPrice: nil, discountedPrice: nil, breakDown: nil),brandHighlights: nil,images: [ListingImage(caption: nil, imageUrl: "https://a0.muscache.com/im/pictures/miso/Hosting-24978287/original/23db7045-cebf-4f56-b296-f1364d033729.jpeg?ml=true", orientation: nil)],highlights: nil,houseRules: nil,cancellationPolicies: nil,amenities: nil, checkIn: "2024-09-18",checkOut: "2024-09-23"))
}
