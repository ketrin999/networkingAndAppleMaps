//
//  PostsViewController.swift
//  networking
//
//  Created by Ekaterina Yashunina on 12.01.2024.
//

import UIKit

class PostsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PostsTableViewCellDelegate {

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

        tableView.register(PostsTableViewCell.self, forCellReuseIdentifier: "Cell")
        title = "P O S T S"

        makeRequest()
    }

    var posts : [Posts] = []

    private func makeRequest() {
        var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let posts = try? JSONDecoder().decode([Posts].self, from: data) {
                self.posts.append(contentsOf: posts)

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        task.resume()
    }

    func onButtonClick(cell: PostsTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let selectedPost = posts[indexPath.row]

        let nextVC = SecondoSchermo()
        nextVC.post = selectedPost

        self.navigationController?.pushViewController(nextVC, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PostsTableViewCell

        let index = indexPath.row
        let posts = posts[index]
        cell.postsLabel.text = posts.title
        cell.bodyLabel.text = posts.body

        cell.delegate = self

        return cell
    }
}
