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

class CompetitionDetailsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var teamsTable: UITableView!
    
    var competitionDetailsViewModel: CompetitionDetailsViewModelProtocol!
    var teamDetailsViewModel: TeamDetailsViewModel!
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
        
        teamsTable.delegate = self
        teamsTable.dataSource = self
        
        competitionDetailsViewModel = CompetitionDetailsViewModel()
        teamDetailsViewModel = TeamDetailsViewModel()
        
        //just for view data (not a model)
        detailsOfCompetitionViewData = CompetitionsDetailsViewData()
        competitionTeamViewData = [CompetitionTeamViewData]()
        
        
        competitionDetailsViewModel.getCompetitionsDetailsFromNetworkService()
       
        
        let nibCustomCell = UINib(nibName: "TeamViewCell", bundle: nil)
        teamsTable.register(nibCustomCell, forCellReuseIdentifier: "competitionTeamsCell")
        
        print("Comp Id : \(Constants.competitionId ?? 00)")
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        competitionDetailsViewModel.bindCompetitionsDetailsToViewController = {
            
            self.detailsOfCompetitionViewData = self.competitionDetailsViewModel.competitionsDetailsViewData
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "competitionTeamsCell", for: indexPath) as! TeamViewCell
        
        return cell
    }
    

}
