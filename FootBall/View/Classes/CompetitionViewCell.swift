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
    
    @IBOutlet weak var bgView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.competitionImage.layer.cornerRadius = 25
        self.competitionImage.clipsToBounds = true
        
        self.bgView.layer.cornerRadius = 25
        self.bgView.clipsToBounds = true
    }

    
    
}
