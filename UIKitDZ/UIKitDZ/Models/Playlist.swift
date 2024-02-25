// Playlist.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Источник данных, хранилище песен
struct Playlist {
    
    // MARK: - Public properties

    var tracks: [Track]

    // MARK: - Initialization

    init() {
        let path1 = Bundle.main.path(forResource: "Track1", ofType: "mp3")
        let path2 = Bundle.main.path(forResource: "Track2", ofType: "mp3")
        let path3 = Bundle.main.path(forResource: "Track3", ofType: "mp3")
        let track1 = Track(
            image: "cover1",
            artist: "The Beatles",
            name: "Let it be",
            duration: "4:03",
            path: path1,
            number: 1
        )
        let track2 = Track(
            image: "cover2.jpg",
            artist: "The Beatles",
            name: "Yesterday",
            duration: "2:05",
            path: path2,
            number: 2
        )
        let track3 = Track(
            image: "cover3.jpg",
            artist: "Queen",
            name: "The Show Must Go On",
            duration: "4:31",
            path: path3,
            number: 3
        )

        tracks = [track1, track2, track3]
    }
}
