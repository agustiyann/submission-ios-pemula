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
        
        if NetworkMonitor.shared.isConnected {
            print("Connected")
            self.showSpinner()
            
            loadPlacesData()
        } else {
            print("Not connected")
            self.showSpinner()
            showConnectionAlert()
        }
        
        profileButton.image = UIImage(named: "man")
        self.navigationItem.title = "Beautiful Indonesia"
    }
    
    private func loadPlacesData() {
        viewModel.fetchPlacesData(completion: { [weak self] in
            self?.placeTableView.dataSource = self
            self?.placeTableView.delegate = self
            self?.placeTableView.register(UINib(nibName: "PlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "PlaceCell")
            self?.placeTableView.reloadData()
            self?.removeSpinner()
        })
    }
    
    @IBAction func showProfile(_ sender: UIBarButtonItem) {
        let profile = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        self.navigationController?.pushViewController(profile, animated: true)
    }
    
    func showConnectionAlert() {
        let alert = UIAlertController(title: "Connection Problem", message: "Make sure your device is connected to an internet and try to restart the app!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.removeSpinner()
        }))
        self.present(alert, animated: true)
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
        tableView.deselectRow(at: indexPath, animated: true)
        let detail = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        detail.place = viewModel.cellForRowAt(indexPath: indexPath)
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

