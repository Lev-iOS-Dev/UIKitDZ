// Player.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// Логика для управления плеера
final class Player {
    // MARK: - Public Properties

    static let shared = Player()
    public lazy var volume: Float = player.volume

    // MARK: - Private Properties

    private var isPlaying: Bool = false
    private var player = AVAudioPlayer()

    // MARK: - Initializers

    private init() {}

    // MARK: - Public Methods

    public func playTrack(_ path: String?) -> Float {
        if player.isPlaying {
            player.stop()
        }
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path ?? ""))
        } catch {
            print("Error")
        }
        player.play()
        return Float(player.duration)
    }

    public func stop() {
        player.stop()
    }

    public func getDurationData() -> (sliderValue: Float, remainingTime: String) {
        let sliderValue = Float(player.currentTime)
        let remainingTime = getRemainingTime()
        return (sliderValue, remainingTime)
    }

    public func setTiming(_ time: Float) {
        player.currentTime = Double(time)
    }

    public func playPause() -> Bool {
        let _: Any = (player.isPlaying) ? player.pause() : player.play()
        return player.isPlaying
    }

    public func setVolume(_ volume: Float) {
        player.volume = volume
    }

    // MARK: - Private Methods

    private func getRemainingTime() -> String {
        let time = Int(player.duration - player.currentTime + 0.5)
        let min = time / 60
        let sec = time % 60
        return String(format: "%02d:%02d", min, sec)
    }
}
