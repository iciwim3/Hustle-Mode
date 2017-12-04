//
//  ViewController.swift
//  hustle-mode
//
//  Created by Sain-R Edwards Jr. on 12/1/17.
//  Copyright © 2017 Appybuildmore Apps. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerButton: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var hustleLabel: UILabel!
    @IBOutlet weak var onLabel: UILabel!
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
        
    }

    @IBAction func powerButtonTapped(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerButton.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 3.4, animations: {
            self.rocket.frame = CGRect(x: 0, y: 250, width: 375, height: 204)
        }) { (finished) in
            self.hustleLabel.isHidden = false
            self.onLabel.isHidden = false
        }
    
    }

}

