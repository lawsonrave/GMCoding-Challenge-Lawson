//
//  MusicModel.swift
//  GM Coding Challenge - Lawson
//
//  Created by ravebizz on 6/29/21.
//

import Foundation

struct MusicModel: Decodable {
    let results: [MusicItem]
}

struct MusicItem: Decodable {
    let artistName: String?
    let trackName: String?
    let trackPrice: Double?
    let releaseDate: String?
    let primaryGenreName: String?
}
