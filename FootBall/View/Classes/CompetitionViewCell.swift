//
//  CompetitionViewCell.swift
//  FootBall
//
//  Created by Mina Emad on 09/06/2024.
//

import UIKit

class CompetitionViewCell: UITableViewCell {

    
    @IBOutlet weak var competitionImage: UIImageView!
    
    @IBOutlet weak var competitionLongName: UILabel!
    
    @IBOutlet weak var competitionShortName: UILabel!
    
    @IBOutlet weak var competitionNumberOfTeams: UILabel!
    
    @IBOutlet weak var competitionNumberOfGames: UILabel!
    
    
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
