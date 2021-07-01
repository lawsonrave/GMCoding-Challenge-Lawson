//
//  TableViewController.swift
//  GM Coding Challenge - Lawson
//
//  Created by ravebizz on 6/29/21.
//

import UIKit

class TableViewController: UITableViewController {
    
    var searchViewModel: SearchViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        navigationController?.navigationBar.isTranslucent = false
    }
    
    func configureTableView() {
        tableView.register(UINib(nibName: SearchTableViewCell.id, bundle: nil), forCellReuseIdentifier: SearchTableViewCell.id)
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension TableViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.id, for: indexPath) as? SearchTableViewCell,
              let musicItem = searchViewModel?.getMusicListItem(at: indexPath.row)
        else { return UITableViewCell() }
        
        cell.cellViewModel = CellViewModel(musicItem: musicItem)
        return cell
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchViewModel?.numMusicModels() ?? 0
    }
}
