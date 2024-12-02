//
//  SecondoSchermo.swift
//  networking
//
//  Created by Ekaterina Yashunina on 12.01.2024.
//

import UIKit

class SecondoSchermo: UIViewController, UITableViewDelegate, UITableViewDataSource {

    weak var postsTableViewCellDelegate: PostsTableViewCellDelegate?

    var post: Posts?

    var comments: [Comment] = []

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

        tableView.register(DueTableViewCell.self, forCellReuseIdentifier: "Due")

        tableView.delegate = self
        tableView.dataSource = self

        title = "comments"

        getComments()

    }

    private func getComments() {
        guard let post = self.post, let postId = post.id else { return }

        let serviceUrl = "https://jsonplaceholder.typicode.com/comments"
        let queryParam = "?postId=" + String(postId)

        var request = URLRequest(url: URL(string: serviceUrl + queryParam)!)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let comment = try? JSONDecoder().decode([Comment].self, from: data) {
                self.comments.append(contentsOf: comment)

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        task.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Due", for: indexPath) as! DueTableViewCell
        
        let index = indexPath.row
        let comments = comments[index]
        cell.dueEmailLabel.text = comments.email
        cell.duePostsLabel.text = comments.name
        cell.dueBodyLabel.text = comments.body

        return cell
    }
}
