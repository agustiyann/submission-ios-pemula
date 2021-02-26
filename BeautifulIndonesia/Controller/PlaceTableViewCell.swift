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
    
    private var urlString: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellWithValuesOf(_ place: Place) {
        updateUI(name: place.name, address: place.address, description: place.description, image: place.description)
    }
    
    private func updateUI(name: String?, address: String?, description: String?, image: String?) {
        self.namePlace.text = name
        self.descPlace.text = description
        self.imagePlace.load(url: URL(string: image!)!)
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
