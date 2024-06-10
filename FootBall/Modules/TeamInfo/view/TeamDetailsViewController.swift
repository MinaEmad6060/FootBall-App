//
//  TeamDetailsViewController.swift
//  FootBall
//
//  Created by Mina Emad on 09/06/2024.
//

import UIKit




struct TeamInformationViewData{
    var image: String?
    var longName: String?
    var shortName: String?
    var founded: String?
    var stadium: String?
    var colors: String?
    var website: String?
    var players: [TeamPlayerViewData]?
}

struct TeamPlayerViewData{
    var image: String?
    var name: String?
    var position: String?
    var nationality: String?
}

class TeamDetailsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var playersTable: UITableView!
    
    @IBOutlet weak var teamLongName: UILabel!
   
    
    @IBOutlet weak var teamImage: UIImageView!
    
    @IBOutlet weak var teamShortName: UILabel!
    
    @IBOutlet weak var teamFounded: UILabel!
    
    @IBOutlet weak var teamStadium: UILabel!
    
    @IBOutlet weak var teamColors: UILabel!
    
    @IBOutlet weak var teamWebsite: UILabel!

    @IBOutlet weak var playerTitle: UILabel!
    
    
    var teamDetailsViewModel: TeamDetailsViewModelProtocol!
    
    var teamInformationViewData: TeamInformationViewData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamDetailsViewModel = TeamDetailsViewModel()
        teamInformationViewData = TeamInformationViewData()
        
        playersTable.delegate = self
        playersTable.dataSource = self

        teamDetailsViewModel.getPlayersFromNetworkService()
        
        let nibCustomCell = UINib(nibName: "PlayerViewCell", bundle: nil)
        playersTable.register(nibCustomCell, forCellReuseIdentifier: "teamPlayersCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        teamDetailsViewModel.bindTeamInformationToViewController = {
            self.teamInformationViewData = self.teamDetailsViewModel.teamInformation
            
            DispatchQueue.main.async {
                self.teamColors.text = self.teamInformationViewData.colors
                self.teamFounded.text = self.teamInformationViewData.founded
                self.teamLongName.text = self.teamInformationViewData.longName
                self.teamShortName.text = self.teamInformationViewData.shortName
                self.teamStadium.text = self.teamInformationViewData.stadium
                self.teamWebsite.text = self.teamInformationViewData.website

                if let teamImageURLString = self.teamInformationViewData.image, let teamImageURL = URL(string: teamImageURLString) {
                    self.teamImage.kf.setImage(with: teamImageURL, placeholder: Constants.placeholderCompetitionImage)
                } else {
                    self.teamImage.image = Constants.placeholderCompetitionImage
                }
                
                self.playersTable.reloadData()
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if teamInformationViewData.players?.count ?? 0 > 0{
            return teamInformationViewData.players?.count ?? 0
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamPlayersCell", for: indexPath) as! PlayerViewCell
        
        
        if teamInformationViewData.players?.count ?? 0 > indexPath.row{
            cell.playerName.text = teamInformationViewData.players?[indexPath.row].name
            cell.playerNationality.text = teamInformationViewData.players?[indexPath.row].nationality
            cell.playerPosition.text = teamInformationViewData.players?[indexPath.row].position
            if let teamImageURLString = self.teamInformationViewData.image, let teamImageURL = URL(string: teamImageURLString) {
                cell.playerImage.kf.setImage(with: teamImageURL, placeholder: Constants.placeholderCompetitionImage)
            } else {
                cell.playerImage.image = Constants.placeholderCompetitionImage
            }
        }

        return cell
    }
    
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true)
    }

    
    func setBorderRadiusForText(){
        self.playerTitle.layer.cornerRadius = 20
        self.teamLongName.layer.cornerRadius = 20
        self.teamShortName.layer.cornerRadius = 20
    }
    
    func clipsToBoundsForText(){
        self.playerTitle.clipsToBounds = true
        self.teamLongName.clipsToBounds = true
        self.teamShortName.clipsToBounds = true
    }
}
