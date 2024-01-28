//
//  ViewController.swift
//  Map
//
//  Created by Hai Yen Nguyen on 1/28/24.
//

import UIKit
import MapKit

class ViewController: UIViewController, UISearchBarDelegate{

    @IBOutlet weak var myMapView: MKMapView!
    @IBAction func searchButton(_ sender: Any) {
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
        
    }
//    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        UIApplication.shared.beginIgnoringInteractionEvents()
//        let activityIndicator = UIActivityIndicatorView()
//        activityIndicator.activityIndicatorView = UIActivityIndicatorView(style: .gray)
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

