//
//  SplashScreenViewController.swift
//  GOT app
//
//  Created by Chris Bond on 4/19/22.
//

import UIKit
import AVFoundation

class SplashScreenViewController: UIViewController {
    
    @IBOutlet weak var throneImageView: UIImageView!
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        playSound(name: "GoT_theme")
        
        let yAtStart = throneImageView.frame.origin.y
        throneImageView.frame.origin.y = self.view.frame.height
        UIView.animate(withDuration: 1.0, delay: 1.0, animations: {self.throneImageView.frame.origin.y = yAtStart})
    }
    
    func playSound(name: String){
            if let sound = NSDataAsset(name: name){
                do {
                    try audioPlayer = AVAudioPlayer(data: sound.data)
                    audioPlayer.play()
                } catch {
                    print("Error: \(error.localizedDescription) could not read")
                }
            } else {
                print("Error could not read")
            }
        }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        if audioPlayer != nil {
            audioPlayer.stop()
        }
        performSegue(withIdentifier: "ShowTableView", sender: nil)
    }
    
    
    

}
