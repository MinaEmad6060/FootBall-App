//
//  PlayerViewCell.swift
//  FootBall
//
//  Created by Mina Emad on 10/06/2024.
//

import UIKit

class PlayerViewCell: UITableViewCell {

    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerPosition: UILabel!
    @IBOutlet weak var playerNationality: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
