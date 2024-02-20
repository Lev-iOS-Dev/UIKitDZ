// PlayerViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class PlayerViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet private var volumeSlider: UISlider!
    @IBOutlet private var coverImageView: UIImageView!
    @IBOutlet private var trackNameLabel: UILabel!
    @IBOutlet private var artistLabel: UILabel!
    @IBOutlet private var durationLabel: UILabel!
    @IBOutlet private var durationSlider: UISlider!
    @IBOutlet private var playPauseButton: UIButton!

    // MARK: - Public Properties

    var track: Track? {
        didSet {
            if view.bounds.height > 0 {
                setOutlets()
                startTimer()
            }
        }
    }

    // MARK: - Private Properties

    private let player = Player.shared
    private let playlist = Playlist()
    private var timer: Timer?

    // MARK: - IBAction

    @IBAction private func closeButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }

    @IBAction private func shareButtonAction(_ sender: UIButton) {
        print(#function)
    }

    @IBAction private func volumeSliderAction(_ sender: UISlider) {
        player.setVolume(sender.value)
    }

    @IBAction private func durationSliderAction(_ sender: UISlider) {
        player.setTiming(durationSlider.value)
    }

    @IBAction private func playPauseButtonAction(_ sender: Any) {
        let isPaying = player.playPause()
        let replaceImageName = isPaying ? "play" : "pause"
        playPauseButton.setImage(UIImage(named: replaceImageName), for: .normal)
        if isPaying {
            startTimer()
        } else { timer?.invalidate() }
    }

    @IBAction private func backwardButtonAction(_ sender: Any) {
        guard let track else { return }
        if track.number == 1 {
            self.track = playlist.tracks[2]
        } else {
            let previousNumber = track.number - 2
            self.track = playlist.tracks[previousNumber]
        }
        playPauseButton.setImage(UIImage(named: "play"), for: .normal)
    }

    @IBAction private func forwardButtonAction(_ sender: Any) {
        guard let track else { return }
        if track.number == 3 {
            self.track = playlist.tracks[0]
        } else {
            let previousNumber = track.number
            self.track = playlist.tracks[previousNumber]
        }
        playPauseButton.setImage(UIImage(named: "play"), for: .normal)
    }

    // MARK: - Private Methods

    private func setOutlets() {
        coverImageView.layer.cornerRadius = 30
        guard let track else { return }
        coverImageView.image = UIImage(named: track.image)
        trackNameLabel.text = track.name
        artistLabel.text = track.artist
        durationLabel.text = "-\(track.duration)"
        durationSlider.value = 0
        durationSlider.maximumValue = player.playTrack(track.path)
        volumeSlider.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        volumeSlider.value = player.volume
    }

    private func startTimer() {
        Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateUI),
            userInfo: nil,
            repeats: true
        )
    }

    @objc private func updateUI() {
        let (sliderValue, remainingValue) = player.getDurationData()
        durationSlider.value = sliderValue
        durationLabel.text = remainingValue
    }

    private func stopPlayer() {
        player.stop()
        timer?.invalidate()
    }
}
