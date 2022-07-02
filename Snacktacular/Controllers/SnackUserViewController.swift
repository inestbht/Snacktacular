//
//  SnackUserViewController.swift
//  Snacktacular
//
//  Created by Samuel Pena on 7/2/22.
//  Copyright © 2022 Samuel Pena. All rights reserved.
//

import UIKit

class SnackUserViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var snackUsers: SnackUsers!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        snackUsers = SnackUsers()
        snackUsers.loadData {
            self.tableView.reloadData()
        }
    }
}

extension SnackUserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snackUsers.userArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SnackUserTableViewCell
        cell.snackUser = snackUsers.userArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
