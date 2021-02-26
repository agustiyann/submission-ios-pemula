//
//  PlaceModel.swift
//  BeautifulIndonesia
//
//  Created by Agus Tiyansyah Syam on 26/02/21.
//

import Foundation

struct PlaceData: Decodable {
    let places: [Place]
}

struct Place: Decodable {
    let name: String?
    let description: String?
    let address: String?
    let image: String?
}
