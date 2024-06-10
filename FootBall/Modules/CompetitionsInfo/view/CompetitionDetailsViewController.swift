//
//  CompetitionDetailsViewController.swift
//  FootBall
//
//  Created by Mina Emad on 09/06/2024.
//

import UIKit


struct CompetitionsDetailsViewData{
    var startDate: String?
    var endDate: String?
    var image: String?
    var longName: String?
    var shortName: String?
    var winnerImage: String?
    var winnerLongName: String?
    var winnerShortName: String?
}

struct CompetitionTeamViewData{
    var image: String?
    var longName: String?
    var shortName: String?
}

class CompetitionDetailsViewController: UIViewController {

    
    
    var competitionDetailsViewModel: CompetitionDetailsViewModelProtocol!
    var competitionTeamViewData: [CompetitionTeamViewData]!
    
    var numberOfTeamsForCompetition: [String]?
    var numberOfGamesForCompetition: [String]?
    
    //just for view data (not a model)
    var detailsOfCompetitionViewData: CompetitionsDetailsViewData!
    
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        competitionDetailsViewModel = CompetitionDetailsViewModel()
        
        //just for view data (not a model)
        detailsOfCompetitionViewData = CompetitionsDetailsViewData()
        competitionTeamViewData = [CompetitionTeamViewData]()
        
        
        competitionDetailsViewModel.getCompetitionsDetailsFromNetworkService()
        competitionDetailsViewModel.getTeamsFromNetworkService()
        competitionDetailsViewModel.getGamesFromNetworkService()
        
        print("Comp Id : \(Constants.competitionId ?? 00)")
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        competitionDetailsViewModel.bindCompetitionsDetailsToViewController = {
            
            self.detailsOfCompetitionViewData = self.competitionDetailsViewModel.competitionsDetailsViewData
        }
        
    }
}
