//
//  ItemViewModel.swift
//  airbnb
//
//  Created by SENA on 9.09.2024.
//

import Foundation
import Combine

class ListingViewModel: ObservableObject {
    @Published var items: [AirbnbListing] = []
    @Published var errorMessage: String? = nil
    
    func fetchData() {
        guard let url = URL(string: "https://api.apify.com/v2/datasets/TbtAVDeU09S8Gocft/items?clean=true&format=json") else {
            self.errorMessage = "Geçersiz URL."
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue("Bearer apify_api_EqXhjo6cEHrg8glzZM0bBbVrXfU79s2e4KaP", forHTTPHeaderField: "Authorization") // API anahtarınızı buraya ekleyin
        
        URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    self?.errorMessage = "Hata: \(error.localizedDescription)"
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    self?.errorMessage = "HTTP Yanıtı alınamadı."
                }
                return
            }
            
            if httpResponse.statusCode != 200 {
                DispatchQueue.main.async {
                    self?.errorMessage = "API'den geçersiz yanıt: \(httpResponse.statusCode)"
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self?.errorMessage = "Veri alınamadı."
                }
                return
            }
        
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([AirbnbListing].self, from: data)
                DispatchQueue.main.async {
                    self?.items = decodedData
                }
            } catch let error {
                DispatchQueue.main.async {
                    self?.errorMessage = "JSON çözümleme hatası: \(error.localizedDescription)"
                }
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print(jsonString)
            }

        }.resume()
    }
    
    func updateListingsForLocation(_location: String){
        let filteredListings = items.filter({
            $0.location.lowercased() == _location.lowercased()
        })
        
        self.items = filteredListings.isEmpty ? items : filteredListings
    }
    
    
    
}

