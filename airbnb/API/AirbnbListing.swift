//
//  model.swift
//  airbnb
//
//  Created by SENA on 9.09.2024.
//
import Foundation

// MARK: - Airbnb Listing Model
struct AirbnbListing: Codable , Identifiable{
    let id: String
    let coordinates: Coordinates?
    let descriptionOriginalLanguage: String?
    let metaDescription: String?
    let seoTitle: String?
    let sharingConfigTitle: String?
    let thumbnail: String?
    let url: String
    let androidLink: String?
    let iosLink: String?
    let propertyType: String
    let roomType: String?
    let homeTier: Int?
    let personCapacity: Int
    let rating: Rating
    let breadcrumbs: [Breadcrumb]?
    let location: String
    let host: Host
    let locationSubtitle: String
    let locationDescriptions: [LocationDescription]?
    let title: String
    let description: String?
    let subDescription: SubDescription?
    let price: Price
    let brandHighlights: BrandHighlight?
    let images: [ListingImage]?
    let highlights: [Highlight]?
    let houseRules: HouseRules?
    let cancellationPolicies: [CancellationPolicy]?
    let amenities: [Amenity]?
    let checkIn: String?
    let checkOut: String?
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let latitude: Double
    let longitude: Double
}

// MARK: - Rating
struct Rating: Codable{
    let accuracy: Double
    let checking: Double
    let cleanliness: Double
    let communication: Double
    let location: Double
    let value: Double
    let guestSatisfaction: Double
    let reviewsCount: Int
}

// MARK: - Breadcrumb
struct Breadcrumb: Codable {
    let linkRoute: String?
    let linkText: String?
}

// MARK: - Host
struct Host: Codable {
    let id: String
    let name: String
    let profileImage: String?
    let isSuperHost: Bool
    let isVerified: Bool
    let highlights: [String]?
    let about: String?
    let ratingCount: Int
    let ratingAverage: Double
    let hostDetails: [String]?
    let timeAsHost: TimeAsHost?
}

// MARK: - TimeAsHost
struct TimeAsHost: Codable {
    let months: Int?
    let years: Int?
}

// MARK: - LocationDescription
struct LocationDescription: Codable {
    let title: String?
    let content: String?
}

// MARK: - SubDescription
struct SubDescription: Codable {
    let title: String?
    let items: [String]?
}

// MARK: - Price
struct Price: Codable {
    let label: String
    let qualifier: String?
    let price: String
    let originalPrice: String?
    let discountedPrice: String?
    let breakDown: BreakDown?
}

// MARK: - BreakDown
struct BreakDown: Codable {
    let basePrice: BasePrice?
    let serviceFee: Fee?
    let totalBeforeTaxes: Fee?
}

// MARK: - BasePrice
struct BasePrice: Codable {
    let description: String?
    let price: String?
}

// MARK: - Fee
struct Fee: Codable {
    let description: String?
    let price: String?
}

// MARK: - BrandHighlight
struct BrandHighlight: Codable {
    let title: String?
    let subtitle: String?
    let hasGoldenLaurel: Bool?
}

// MARK: - ListingImage
struct ListingImage: Codable {
    let caption: String?
    let imageUrl: String
    let orientation: String?
}

// MARK: - Highlight
struct Highlight: Codable {
    let title: String?
    let subtitle: String?
    let icon: String?
}

// MARK: - HouseRules
struct HouseRules: Codable {
    let general: [Rule]?
}

// MARK: - Rule
struct Rule: Codable {
    let title: String?
    let values: [RuleValue]?
}

// MARK: - RuleValue
struct RuleValue: Codable {
    let title: String?
    let icon: String?
}

// MARK: - CancellationPolicy
struct CancellationPolicy: Codable {
    let title: String?
    let policyName: String?
}

// MARK: - Amenity
struct Amenity: Codable {
    let title: String?
    let values: [AmenityValue]?
}

// MARK: - AmenityValue
struct AmenityValue: Codable {
    let title: String?
    let subtitle: String?
    let icon: String?
}
