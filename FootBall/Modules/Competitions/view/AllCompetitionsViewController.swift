//
//  ViewController.swift
//  FootBall
//
//  Created by Mina Emad on 09/06/2024.
//

import UIKit
import Kingfisher

struct CompetitionsViewData{
    var id: Int16?
    var image: String?
    var longName: String?
    var shortName: String?
}

class AllCompetitionsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var competitionsTable: UITableView!
    @IBOutlet weak var competitionTitle: UILabel!
    @IBOutlet weak var worldCupOutlet: UIButton!

    var allCompetitionsViewModel: AllCompetitionsViewModelProtocol!
    var competitionDetailsViewModel: CompetitionDetailsViewModelProtocol!
    
    var numberOfTeamsForCompetition: [String]?
    var numberOfGamesForCompetition: [String]?
    
    //just for view data (not a model)
    var competitionsViewData: [CompetitionsViewData]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        competitionsTable.delegate = self
        competitionsTable.dataSource = self
        
        setBorderForText()
        initViewController()
        
        allCompetitionsViewModel.getCompetitionsFromNetworkService()

        
        let nibCustomCell = UINib(nibName: "CompetitionViewCell", bundle: nil)
        competitionsTable.register(nibCustomCell, forCellReuseIdentifier: "competitionCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = competitionsTable.indexPathForSelectedRow {
            competitionsTable.deselectRow(at: indexPath, animated: false)
        }
        
        handleClousreToGetDataFromViewModel()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if competitionsViewData.count > 0{
            return competitionsViewData.count
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "competitionCell", for: indexPath) as! CompetitionViewCell

        if competitionsViewData.count > indexPath.row{
            cell.competitionLongName.text = competitionsViewData?[indexPath.row].longName
            cell.competitionShortName.text = competitionsViewData?[indexPath.row].shortName
            cell.competitionNumberOfTeams.text = "\(Constants.generateRandomNumber(start: 32, end: 64))"
            cell.competitionNumberOfGames.text = "\(Constants.generateRandomNumber(start: 64, end: 100))"
            let placeholderImage = UIImage(systemName: "trophy.fill")
            if let imageURLString = competitionsViewData?[indexPath.row].image, let imageURL = URL(string: imageURLString) {
                cell.competitionImage.kf.setImage(with: imageURL, placeholder: placeholderImage)
            } else {
                cell.competitionImage.image = placeholderImage
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsViewController = storyboard.instantiateViewController(withIdentifier: "competitionDetails") as! CompetitionDetailsViewController
        if competitionsViewData.count > indexPath.row{
            Constants.competitionID = competitionsViewData[indexPath.row].id ?? -1
        }
        present(detailsViewController, animated: true, completion: nil)
    }
    
    @IBAction func btnWorldCupDetails(_ sender: Any) {
        Constants.competitionID = 2000
    }
    
    func setBorderForText(){
        self.competitionTitle.layer.cornerRadius = 20
        self.competitionTitle.clipsToBounds = true
        self.worldCupOutlet.layer.cornerRadius = 10
        self.worldCupOutlet.clipsToBounds = true
    }
    
    func initViewController(){
        allCompetitionsViewModel = AllCompetitionsViewModel()
        competitionDetailsViewModel = CompetitionDetailsViewModel()
        competitionsViewData = [CompetitionsViewData]()
    }
    
    func handleClousreToGetDataFromViewModel(){
        allCompetitionsViewModel.bindCompetitionsToViewController = {
            
            self.competitionsViewData = self.allCompetitionsViewModel.competitionsViewData
            
            DispatchQueue.main.async {
                self.competitionsTable.reloadData()
            }
        }
    }
}

