//
//  MessageListViewController.swift
//  ReadWrite_Firebase
//
//  Created by Дмитрий Подольский on 02.06.2022.
//

import UIKit
import MessageKit

class MessageListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}

extension MessageListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Freddy"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ChatViewController()
        vc.chatID = "FirstChatId"
        vc.otherID = "IXo1Cr5LWQdlPo2SOvsDOBgTjjG3"
        navigationController?.pushViewController(vc, animated: true)

    }
}
