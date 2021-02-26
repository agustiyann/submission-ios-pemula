//
//  PlaceViewModel.swift
//  BeautifulIndonesia
//
//  Created by Agus Tiyansyah Syam on 26/02/21.
//

import Foundation

class PlaceViewModel {
    private var apiService = ApiService()
    private var places = [Place]()
    
    func fetchPlacesData(completion: @escaping () -> ()) {
        apiService.getPlacesData(completion: { [weak self] (result) in
            switch result {
                case .success(let listOf):
                    self?.places = listOf.places
                    completion()
                case .failure(let error):
                    print("Error processinng json data: \(error)")
            }
        })
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if places.count != 0 {
            return places.count
        }
        return 0
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Place {
        return places[indexPath.row]
    }
}
