//
//  SearchViewModel.swift
//  GM Coding Challenge - Lawson
//
//  Created by ravebizz on 6/30/21.
//

import Foundation

class SearchViewModel {
    
    var musicModel: MusicModel {
        didSet {
            updateUIClosure?()
        }
    }
    
    var updateUIClosure: (() -> Void)?
    
    init(musicModelData: MusicModel) {
        self.musicModel = musicModelData
    }
    
    func numMusicModels() -> Int {
        return musicModel.results.count
    }
    
    func getMusicListItem(at row: Int) -> MusicItem {
        return musicModel.results[row]
    }
}
