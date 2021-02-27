//
//  PlaceTableViewCell.swift
//  BeautifulIndonesia
//
//  Created by Agus Tiyansyah Syam on 26/02/21.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

    @IBOutlet weak var imagePlace: UIImageView!
    @IBOutlet weak var namePlace: UILabel!
    @IBOutlet weak var descPlace: UILabel!
    
    func setCellWithValuesOf(_ place: Place) {
        updateUI(name: place.name, address: place.address, description: place.description, image: place.image)
    }
    
    private func updateUI(name: String?, address: String?, description: String?, image: String?) {
        self.namePlace.text = name
        self.descPlace.text = description
        
        guard let imageUrl = URL(string: image!) else {
            self.imagePlace.image = UIImage(named: "noImageAvailable")
            return
        }

        self.imagePlace.loadImage(withUrl: imageUrl)
        self.imagePlace.layer.cornerRadius = 12
        self.imagePlace.clipsToBounds = true
    }
    
}

