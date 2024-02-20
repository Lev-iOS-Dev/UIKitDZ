// PlaylistViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый вью контроллер
class PlaylistViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet private var coverImageView1: UIImageView!
    @IBOutlet private var coverImageView2: UIImageView!
    @IBOutlet private var coverImageView3: UIImageView!

    // MARK: - Private Properties

    private var playlist = Playlist()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - IBAction

    @IBAction private func playTrack(_ sender: UIButton) {
        performSegue(withIdentifier: "PlaylistToPlayer", sender: sender)
    }

    // MARK: - Private Methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "PlaylistToPlayer" else { return }
        guard let destination = segue.destination as? PlayerViewController else { return }
        guard let sender = sender as? UIButton else { return }
        let track = playlist.tracks[sender.tag - 1]
        destination.track = track
    }

    private func setUI() {
        coverImageView1.layer.cornerRadius = 12
        coverImageView2.layer.cornerRadius = 12
        coverImageView3.layer.cornerRadius = 12
    }
}
