//
//  VideoViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 01/02/2018.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit
import AVKit

class VideoViewController: UIViewController {
    
    private var playerLooper: AVPlayerLooper!
    private var player: AVQueuePlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "bgvideo", ofType: "mp4")
        let pathURL = URL(fileURLWithPath: path!)
        
        let playerItem = AVPlayerItem(url: pathURL)
        player = AVQueuePlayer(items: [playerItem])
        let playerLayer = AVPlayerLayer(player: player)
        self.playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)
        
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.frame = view.bounds
        view.layer.addSublayer(playerLayer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        player.play()
        player.volume = 0
        player.rate = 0.75
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        player.pause()
    }

}
