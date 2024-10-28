//
//  ListingItemView.swift
//  airbnb
//
//  Created by SENA on 9.09.2024.
//
import SwiftUI

struct ListingItemView: View {
    let model: AirbnbListing
    var body: some View {
        VStack(spacing: 8) {
            ListingImageCarouselView(images: model.images?.compactMap { $0.imageUrl } ?? [])
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            // Detayları gösteren kısım
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(model.locationSubtitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Text("12 mi away")
                        .foregroundColor(.gray)
                    
                    Text("3 - 6 Nov")
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 4) {
                        Text(model.price.price)
                            .fontWeight(.semibold)
                        Text("night")
                    }
                    .foregroundColor(.black)
                }
                Spacer()
                
                // Puan gösteren kısım
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    Text(String(format: "%.2f", model.rating.guestSatisfaction))
                }
                .foregroundColor(.black)
            }
            .font(.footnote)
        }
    }
}








struct ListingItemView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyListing = AirbnbListing(
            id: "1",
            coordinates: Coordinates(latitude: 25.7617, longitude: -80.1918),
            descriptionOriginalLanguage: nil,
            metaDescription: nil,
            seoTitle: nil,
            sharingConfigTitle: nil,
            thumbnail: "https://a0.muscache.com/pictures/miso/Hosting-24978287/original/23db7045-cebf-4f56-b296-f1364d033729.jpeg", // Replace with a real or placeholder URL
            url: "https://example.com",
            androidLink: nil,
            iosLink: nil,
            propertyType: "House",
            roomType: "Entire home",
            homeTier: 1,
            personCapacity: 4,
            rating: Rating(accuracy: 4.8, checking: 4.7, cleanliness: 4.9, communication: 4.9, location: 5.0, value: 4.6, guestSatisfaction: 4.87, reviewsCount: 120),
            breadcrumbs: nil,
            location: "Miami, Florida",
            host: Host(id: "12345", name: "John Doe", profileImage: nil, isSuperHost: true, isVerified: true, highlights: nil, about: nil, ratingCount: 50, ratingAverage: 4.9, hostDetails: nil, timeAsHost: TimeAsHost(months: 6, years: 2)),
            locationSubtitle: "Near the beach",
            locationDescriptions: nil,
            title: "Beautiful Beachfront House",
            description: "A wonderful place to stay near the beach.",
            subDescription: nil,
            price: Price(label: "per night", qualifier: nil, price: "350", originalPrice: nil, discountedPrice: nil, breakDown: nil),
            brandHighlights: nil,
            images: [ListingImage(caption: nil, imageUrl: "https://a0.muscache.com/im/pictures/miso/Hosting-24978287/original/23db7045-cebf-4f56-b296-f1364d033729.jpeg?ml=true", orientation: nil)],
            highlights: nil,
            houseRules: nil,
            cancellationPolicies: nil,
            amenities: nil,
            checkIn: "2024-09-18",
            checkOut: "2024-09-23"
        )
        
        ListingItemView(model: dummyListing)
    }
}






