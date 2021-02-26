//
//  DetailViewController.swift
//  BeautifulIndonesia
//
//  Created by Agus Tiyansyah Syam on 26/02/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imagePlace: UIImageView!
    @IBOutlet weak var namePlace: UILabel!
    @IBOutlet weak var addressPlace: UILabel!
    @IBOutlet weak var descPlace: UILabel!
    
    var place: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let result = place {
            namePlace.text = result.name
            addressPlace.text = result.address
            descPlace.text = result.description
            
            guard let imageUrl = URL(string: result.image!) else {
                self.imagePlace.image = UIImage(named: "noImageAvailable")
                return
            }
            imagePlace.loadImge(withUrl: imageUrl)
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
