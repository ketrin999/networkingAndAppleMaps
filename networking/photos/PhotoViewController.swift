//
//  PhotoViewController.swift
//  networking
//
//  Created by Ekaterina Yashunina on 29.01.2024.
//

import UIKit

class PhotoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView = UITableView()

    var photos: [Photo] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.backgroundColor = .darkGray

        tableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: "photoCell")

        tableView.delegate = self
        tableView.dataSource = self

        title = "P H O T O S"

//        getPhotos()

    }

//    private func getPhotos() {
//        guard let album = self.album, let userId = album.userID else { return }
//
//        let serviceUrl = "https://jsonplaceholder.typicode.com/photos"
//        let queryParam = "?userId=" + String(userId)
//
//        var request = URLRequest(url: URL(string: serviceUrl + queryParam)!)
//        request.httpMethod = "GET"
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data, let photo = try? JSONDecoder().decode([Photo].self, from: data) {
//                self.photos.append(contentsOf: photo)
//
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            }
//        }
//        task.resume()
//    }



//    let api = "https://jsonplaceholder.typicode.com/photos"
//
//    guard let urlApi = URL(string: api) else {
//        fatalError("error")
//    }
//
//    let session = URLSession(configuration: .default)
//    let task = session.dataTask(with: urlApi) { (data, response, error) in
//        guard let data = data, error == nil else { return }
//        DispatchQueue.main.async {
//            self.imageView.image = UIImage(data: data)
//        }
//    }
//    task.resume()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as! PhotoTableViewCell

        let index = indexPath.row
        let photo = photos[index]

        cell.titleLabel.text = photo.title

        let session = URLSession(configuration: .default)
        let url = URL(string: photo.url)!
        let urlRequest = URLRequest(url: url)
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else { return }

            DispatchQueue.main.async {
                cell.imgView.image = UIImage(data: data)
            }
        }

        task.resume()

//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: photo.url) { (data, response, error) in
//            guard let data = data, error == nil else { return }
//            DispatchQueue.main.async {
//                self.imageView.image = UIImage(data: data)
//            }
//        }
//        task.resume()
        return cell
    }
}
