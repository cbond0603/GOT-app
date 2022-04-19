//
//  DetailViewController.swift
//  GOT app
//
//  Created by Chris Bond on 4/19/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var regionImageView: UIImageView!
    @IBOutlet weak var coatOfArmsTextView: UITextView!
    @IBOutlet weak var coatOfArmsLabel: UILabel!
    
    var houseInfo: HouseInfo!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if houseInfo == nil {
            houseInfo = HouseInfo(name: "", region: "", coatOfArms: "", words: "")
        }
        updateUserInterface()
    }
    
    func updateUserInterface() {
        nameLabel.text = houseInfo.name
        wordLabel.text = houseInfo.words
        if wordLabel.text != "" {
            wordLabel.text = "\"\(houseInfo.words)\""
        }
        regionLabel.text = houseInfo.region
        regionImageView.image = UIImage(named: houseInfo.region)
        coatOfArmsTextView.text = houseInfo.coatOfArms
        if coatOfArmsTextView.text == "" {
            coatOfArmsLabel.isHidden = true
        }
    }
}
