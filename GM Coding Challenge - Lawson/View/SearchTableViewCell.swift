//
//  SearchTableViewCell.swift
//  GM Coding Challenge - Lawson
//
//  Created by ravebizz on 6/30/21.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var trackPrice: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var genre: UILabel!
    static let id = String(describing: SearchTableViewCell.self)
    var cellViewModel: CellViewModel? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        artistName.text = cellViewModel?.artistName
        trackName.text = cellViewModel?.trackName
        trackPrice.text = "$\(cellViewModel?.trackPrice ?? 0.00)"
        releaseDate.text = cellViewModel?.releaseDate
        genre.text = cellViewModel?.genre
    }
    
}
