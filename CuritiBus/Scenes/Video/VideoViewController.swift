//
//  VideoViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 01/02/2018.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit
import TinyConstraints
import AVKit

class VideoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "bgvideo", ofType: "mp4")
        let pathURL = URL(fileURLWithPath: path!)
        
        let player = AVPlayer(url: pathURL)
        let layer = AVPlayerLayer(player: player)
        layer.frame = view.bounds
        layer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(layer)
        
        player.play()
        player.volume = 0
        player.rate = 0.75
    }

}
