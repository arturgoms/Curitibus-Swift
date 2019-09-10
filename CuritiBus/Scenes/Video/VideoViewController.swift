//
//  VideoViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 09/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import UIKit
import AVKit

class VideoViewController: UIViewController {
    
    private var playerLooper: AVPlayerLooper!
    private var player: AVQueuePlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "bgvideo", ofType: "mov")
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
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        player.pause()
    }

}
