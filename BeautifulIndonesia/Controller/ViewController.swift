//
//  ViewController.swift
//  BeautifulIndonesia
//
//  Created by Agus Tiyansyah Syam on 26/02/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var placeTableView: UITableView!
    
    var apiService = ApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        apiService.getPlacesData(completion: {(result) in
            print(result)
        })
    }


}

