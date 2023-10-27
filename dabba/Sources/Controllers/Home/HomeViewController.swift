//
//  HomeViewController.swift
//  dabba
//
//  Created by Abhilash K George on 26/10/23.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {

    @IBOutlet weak var videoContainerView: UIView!
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVideoView()
        registerNotification()
    }
    
    func setUpVideoView() {
        if let videoURL = Bundle.main.url(forResource: "animation", withExtension: "mp4") {
            let player = AVPlayer(url: videoURL)
            let playerLayer = AVPlayerLayer(player: player)
            
            if player.status == .failed {
                print("Failed to initialize AVPlayer")
            }

            playerLayer.frame = videoContainerView.bounds
            playerLayer.videoGravity = .resizeAspect
            videoContainerView.layer.addSublayer(playerLayer)
            player.play()
            self.player = player
            self.playerLayer = playerLayer
        }
    }
    
    func registerNotification() {
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: nil, queue: nil) { [weak self] _ in
            self?.player?.seek(to: .zero)
            self?.player?.play()
        }
    }
    
    
    


    

}
