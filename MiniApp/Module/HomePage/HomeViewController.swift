//
//  HomeViewController.swift
//  MiniApp
//
//  Created by Carlos on 21/02/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var listUser: [ListUser] = []
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        regisrerNib()
        getUser()
    }
    
    func regisrerNib() {
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
    }
    
    func getUser() {
        viewModel.fetchUser { response in
            response.map { [weak self] list in
                guard let self = self else { return }
                self.listUser = list
                self.tableView.reloadData()
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        let data = listUser[indexPath.row]
        cell.setupView(urlImage: data.avatar, name: data.firstName, email: data.email)
        return cell
    }
    
}
