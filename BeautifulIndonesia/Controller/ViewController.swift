//
//  ViewController.swift
//  BeautifulIndonesia
//
//  Created by Agus Tiyansyah Syam on 26/02/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var placeTableView: UITableView!
    @IBOutlet weak var profileButton: UIBarButtonItem!
    
    private var viewModel = PlaceViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileButton.image = UIImage(named: "man")
        
        self.navigationItem.title = "Beautiful Indonesia"
        loadPlacesData()
    }
    
    private func loadPlacesData() {
        viewModel.fetchPlacesData(completion: { [weak self] in
            self?.placeTableView.dataSource = self
            self?.placeTableView.delegate = self
            self?.placeTableView.register(UINib(nibName: "PlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "PlaceCell")
            self?.placeTableView.reloadData()
        })
    }
    
    @IBAction func showProfile(_ sender: UIBarButtonItem) {
        let profile = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        self.navigationController?.pushViewController(profile, animated: true)
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

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        detail.place = viewModel.cellForRowAt(indexPath: indexPath)
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

