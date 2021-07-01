//
//  CellViewModel.swift
//  GM Coding Challenge - Lawson
//
//  Created by ravebizz on 6/30/21.
//

import Foundation

class CellViewModel {
    
    let artistName: String
    let trackName: String
    let trackPrice: Double
    var releaseDate: String {
        didSet {
            self.releaseDate = releaseDateString(releaseDate: self.releaseDate)
            print(self.releaseDate)
        }
    }
    let genre: String
    
    init(musicItem: MusicItem) {
        self.artistName = musicItem.artistName ?? ""
        self.trackName = musicItem.trackName ?? ""
        self.trackPrice = musicItem.trackPrice ?? 0.00
        self.releaseDate = musicItem.releaseDate ?? ""
        self.genre = musicItem.primaryGenreName ?? ""
    }
    
    func releaseDateString(releaseDate: String?) -> String {
        let isoDate = releaseDate ?? ""
        let dateFormatter = ISO8601DateFormatter()
        let date = dateFormatter.date(from: isoDate)!
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        let finalDate = calendar.date(from: components)!
        
        let formatter2 = DateFormatter()
        formatter2.dateStyle = .short
        return formatter2.string(from: finalDate)
    }
    
}
