//
//  ApiService.swift
//  BeautifulIndonesia
//
//  Created by Agus Tiyansyah Syam on 26/02/21.
//

import Foundation

class ApiService {
    private var dataTask: URLSessionTask?
    
    func getPlacesData(completion: @escaping (Result<PlaceData, Error>) -> Void) {
        let placesURL = "https://tourism-api.dicoding.dev/list"
        
        guard let url = URL(string: placesURL) else {
            return
        }
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                print("DataTask Error: \(error.localizedDescription)")
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Empty Response")
                return
            }
            
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else {
                print("Empty Data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(PlaceData.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
}
