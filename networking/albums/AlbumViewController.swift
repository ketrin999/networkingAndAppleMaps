//
//  AlbumViewController.swift
//  networking
//
//  Created by Ekaterina Yashunina on 18.01.2024.
//

import UIKit

class AlbumViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView = UITableView()

    var userNamesById: [Int: String] = [:]

    var albums: [Album] = []
    var users: [User] = []
    var albumsViewModel: [AlbumViewModel] = []
    var photos: [Photo] = []

    private let group = DispatchGroup()
    private let queue = DispatchQueue(label: "DispatchGroup", attributes: .concurrent)



    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.backgroundColor = .darkGray

        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: "alboumCell")

        tableView.delegate = self
        tableView.dataSource = self

        title = "A L B U M S"

        getAlbums()

    }

    private func getAlbums() {

        queue.async(group: group) {
            self.group.enter()
            var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/albums")!)
            request.httpMethod = "GET"

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data, let album = try? JSONDecoder().decode([Album].self, from: data) {
                    self.albums.append(contentsOf: album)
                    self.group.leave()
                }
            }
            task.resume()
        }

        queue.async(group: group) {
            self.group.enter()
            var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/users")!)
            request.httpMethod = "GET"

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data, let users = try? JSONDecoder().decode([User].self, from: data) {
                    self.users.append(contentsOf: users)
                    self.group.leave()
                }
            }
            task.resume()
        }

        queue.async(group: group) {
            self.group.enter()
            var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/photos")!)
            request.httpMethod = "GET"

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data, let photos = try? JSONDecoder().decode([Photo].self, from: data) {
                    self.photos.append(contentsOf: photos)
                    self.group.leave()
                }
            }
            task.resume()
        }

        group.notify(queue: queue) {
//            for album in self.albums {
//                let userId = album.userID
//                let foundUser = self.users.first(where: { $0.id == userId })
//
//                let userName = foundUser?.name ?? "Имя неизвестно"
//
//                let albumViewModel = AlbumViewModel(userName: userName, id: album.id, title: album.title)
//
//                self.albumsViewModel.append(albumViewModel)
//            }

            self.albumsViewModel = self.albums.map({ album in
                return AlbumViewModel(
                    userName: self.users.first(where: { $0.id == album.userID })?.name ?? "Имя неизвестно",
                    id: album.id,
                    title: album.title
                )
            })

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumsViewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alboumCell", for: indexPath) as! AlbumTableViewCell

        let index = indexPath.row
        let album = albumsViewModel[index]

        cell.userIdLabel.text = album.userName
        cell.idLabel.text = String(album.id)
        cell.titleLabel.text = album.title

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let album = albumsViewModel[indexPath.row]
        let foundPhotos = photos.filter { $0.albumID == album.id }

        let viewController = PhotoViewController()
        viewController.photos = foundPhotos

        navigationController?.pushViewController(viewController, animated: true)
    }
}
