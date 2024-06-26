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
    var id: Int16?
    var image: String?
    var longName: String?
    var shortName: String?
}

class CompetitionDetailsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var competitionLongName: UILabel!
    @IBOutlet weak var competitionImage: UIImageView!
    @IBOutlet weak var competitionShortName: UILabel!
    @IBOutlet weak var competitionStartDate: UILabel!
    @IBOutlet weak var competitionEndDate: UILabel!
    @IBOutlet weak var winnerImage: UIImageView!
    @IBOutlet weak var winnerLongName: UILabel!
    @IBOutlet weak var winnerShortName: UILabel!
    @IBOutlet weak var teamsTable: UITableView!
    @IBOutlet weak var lastVersionTitle: UILabel!
    @IBOutlet weak var winnerTitle: UILabel!
    @IBOutlet weak var teamsTitle: UILabel!
  
    var competitionDetailsViewModel: CompetitionDetailsViewModelProtocol!
        
    //just for view data (not a model)
    var detailsOfCompetitionViewData: CompetitionsDetailsViewData!
    var competitionTeamViewData: [CompetitionTeamViewData]!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamsTable.delegate = self
        teamsTable.dataSource = self
        
        setBorderRadiusForText()
        clipsToBoundsForText()
        initViewController()
        fetchDataFromApi()
      
        let nibCustomCell = UINib(nibName: "TeamViewCell", bundle: nil)
        teamsTable.register(nibCustomCell, forCellReuseIdentifier: "competitionTeamsCell")
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        deselectCell()
        handleClousreToGetCompetitionsDetailsFromViewModel()
        handleClousreToGetTeamsFromViewModel()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if competitionTeamViewData.count > 0{
            return competitionTeamViewData.count
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "competitionTeamsCell", for: indexPath) as! TeamViewCell
        
        if competitionTeamViewData.count > indexPath.row{
            cell.teamLongName.text = competitionTeamViewData?[indexPath.row].longName
            cell.teamShortName.text = competitionTeamViewData?[indexPath.row].shortName
            if let imageURLString = competitionTeamViewData?[indexPath.row].image, let imageURL = URL(string: imageURLString) {
                cell.teamImage.kf.setImage(with: imageURL, placeholder: Constants.placeholderCompetitionImage)
            } else {
                cell.teamImage.image = Constants.placeholderCompetitionImage
            }
        }
        
        return cell
    }
    
    func deselectCell(){
        if let indexPath = teamsTable.indexPathForSelectedRow {
            teamsTable.deselectRow(at: indexPath, animated: false)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsViewController = storyboard.instantiateViewController(withIdentifier: "teamDetails") as! TeamDetailsViewController
        if competitionTeamViewData.count > indexPath.row{
            Constants.teamID = competitionTeamViewData[indexPath.row].id ?? 2061
        }
        present(detailsViewController, animated: true, completion: nil)
    }
    
    func setBorderRadiusForText(){
        self.lastVersionTitle.layer.cornerRadius = 20
        self.winnerTitle.layer.cornerRadius = 20
        self.teamsTitle.layer.cornerRadius = 20
        self.competitionLongName.layer.cornerRadius = 20
        self.competitionShortName.layer.cornerRadius = 10
    }
    
    func clipsToBoundsForText(){
        self.lastVersionTitle.clipsToBounds = true
        self.winnerTitle.clipsToBounds = true
        self.teamsTitle.clipsToBounds = true
        self.competitionLongName.clipsToBounds = true
        self.competitionShortName.clipsToBounds = true
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func initViewController(){
        competitionDetailsViewModel = CompetitionDetailsViewModel()
        detailsOfCompetitionViewData = CompetitionsDetailsViewData()
        competitionTeamViewData = [CompetitionTeamViewData]()
    }
    
    func fetchDataFromApi(){
        competitionDetailsViewModel.getCompetitionsDetailsFromNetworkService()
        competitionDetailsViewModel.getTeamsFromNetworkService()
    }
    
    func handleClousreToGetTeamsFromViewModel(){
        competitionDetailsViewModel.bindTeamsToViewController = {
            self.competitionTeamViewData = self.competitionDetailsViewModel.competitionTeamViewData
            DispatchQueue.main.async {
                self.teamsTable.reloadData()
            }
        }
    }
    
    func handleClousreToGetCompetitionsDetailsFromViewModel(){
        competitionDetailsViewModel.bindCompetitionsDetailsToViewController = {
            self.detailsOfCompetitionViewData = self.competitionDetailsViewModel.competitionsDetailsViewData
            DispatchQueue.main.async {
                self.competitionEndDate.text = self.detailsOfCompetitionViewData.endDate
                self.competitionStartDate.text = self.detailsOfCompetitionViewData.startDate
                self.competitionLongName.text = self.detailsOfCompetitionViewData.longName
                self.competitionShortName.text = self.detailsOfCompetitionViewData.shortName
                self.winnerLongName.text = self.detailsOfCompetitionViewData.winnerLongName
                self.winnerShortName.text = self.detailsOfCompetitionViewData.winnerShortName
                if let competitionImageURLString = self.detailsOfCompetitionViewData.image,
                   let winnerImageURLString = self.detailsOfCompetitionViewData.winnerImage,
                   let competitionImageURL = URL(string: competitionImageURLString),
                   let winnerImageURL = URL(string: winnerImageURLString){
                    self.competitionImage.kf.setImage(with: competitionImageURL, placeholder: Constants.placeholderCompetitionImage)
                    self.winnerImage.kf.setImage(with: winnerImageURL, placeholder: Constants.placeholderCompetitionImage)
                } else {
                    self.winnerImage.image = Constants.placeholderCompetitionImage
                }
            }
        }
    }
    

}
