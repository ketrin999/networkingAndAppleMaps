//
//  UserGeoViewController.swift
//  networking
//
//  Created by Ekaterina Yashunina on 17.01.2024.
//

import UIKit
import MapKit

class UserGeoViewController: UIViewController {

    let map = MKMapView()

    weak var usersDelegate: UsersDelegate?

    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let user = self.user,
              let latitude = Double(user.address.geo.lat),
              let longitude = Double(user.address.geo.lng)
        else { return }

        view.addSubview(map)
        map.translatesAutoresizingMaskIntoConstraints = false
        map.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        map.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        map.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        map.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        let geo = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        let region = MKCoordinateRegion(center: geo, span: span)
        map.setRegion(region, animated: true)
        let annotion = MKPointAnnotation()
        annotion.coordinate = geo
        annotion.title = "⛳︎"
        map.addAnnotation(annotion)

    }

}
