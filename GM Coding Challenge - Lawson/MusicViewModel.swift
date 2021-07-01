//
//  MusicViewModel.swift
//  GM Coding Challenge - Lawson
//
//  Created by ravebizz on 6/29/21.
//

import Foundation

class MusicViewModel {
    
    var musicModel: MusicModel? {
        didSet {
            updateUIClosure?()
        }
    }
    
    var updateUIClosure: (() -> Void)?
    
    init(artistName: String, completionHandler: ((MusicModel?) -> Void)?) {
        fetchMusicAPI(artistName: artistName, completionHandler: completionHandler)
    }
    
    func fetchMusicAPI(artistName: String, completionHandler: ((MusicModel?) -> Void)?) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(artistName)") else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decodedMusicModel = try JSONDecoder().decode(MusicModel.self, from: data)
                self.musicModel = decodedMusicModel
                DispatchQueue.main.async {
                    completionHandler?(decodedMusicModel)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
}
