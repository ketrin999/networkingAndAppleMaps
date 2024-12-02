//
//  UsersViewController.swift
//  networking
//
//  Created by Ekaterina Yashunina on 16.01.2024.
//

import UIKit

class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UsersDelegate {

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.backgroundColor = .darkGray

        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(UsersTableViewCell.self, forCellReuseIdentifier: "cellUsers")
        title = "A C C O U N T S"

        getUsers()
    }

    var user : [User] = []

    private func getUsers() {
        var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/users")!)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let user = try? JSONDecoder().decode([User].self, from: data) {
                self.user.append(contentsOf: user)

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        task.resume()
    }

    func onButtonClick(cell: UsersTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let selectedUser = user[indexPath.row]

        let nextVC = UserGeoViewController()
        nextVC.user = selectedUser

        self.navigationController?.pushViewController(nextVC, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellUsers", for: indexPath) as! UsersTableViewCell

        let index = indexPath.row
        let user = user[index]
        cell.nameLabel.text = user.name
        cell.usernameLabel.text = user.username

        cell.delegate = self

        return cell
    }
}
