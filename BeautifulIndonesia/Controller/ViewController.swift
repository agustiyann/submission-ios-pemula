//
//  ViewController.swift
//  BeautifulIndonesia
//
//  Created by Agus Tiyansyah Syam on 26/02/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var placeTableView: UITableView!
    
    private var viewModel = PlaceViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Beautiful Indonesia"
        loadPlacesData()
    }
    
    private func loadPlacesData() {
        viewModel.fetchPlacesData(completion: { [weak self] in
            self?.placeTableView.dataSource = self
            self?.placeTableView.register(UINib(nibName: "PlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "PlaceCell")
            self?.placeTableView.reloadData()
        })
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath) as? PlaceTableViewCell {
            let place = viewModel.cellForRowAt(indexPath: indexPath)
            cell.setCellWithValuesOf(place)
            
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    
}

