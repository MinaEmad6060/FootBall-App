//
//  ViewController.swift
//  FootBall
//
//  Created by Mina Emad on 09/06/2024.
//

import UIKit
import Kingfisher

struct CompetitionsViewData{
    var image: String?
    var longName: String?
    var shortName: String?
//    var numberOfTeams: Int16?
    var numberOfGames: Int16?
}

class AllCompetitionsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var competitionsTable: UITableView!
    
    var allCompetitionsViewModel: AllCompetitionsViewModelProtocol!
    
    var numberOfTeamsForCompetition: [String]?
    
    //just for view data (not a model)
    var competitionsViewData: [CompetitionsViewData]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        competitionsTable.delegate = self
        competitionsTable.dataSource = self
        
        allCompetitionsViewModel = AllCompetitionsViewModel()
        competitionsViewData = [CompetitionsViewData]()
        
        let nibCustomCell = UINib(nibName: "CompetitionViewCell", bundle: nil)
        competitionsTable.register(nibCustomCell, forCellReuseIdentifier: "competitionCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = competitionsTable.indexPathForSelectedRow {
            competitionsTable.deselectRow(at: indexPath, animated: false)
        }
        
        allCompetitionsViewModel.getCompetitionsFromNetworkService()
        allCompetitionsViewModel.bindCompetitionsToViewController = {
            
            self.competitionsViewData = self.allCompetitionsViewModel.competitionsViewData
            DispatchQueue.main.async {
                self.competitionsTable.reloadData()
            }
        }
        
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
            print("if count")
            cell.competitionLongName.text = competitionsViewData?[indexPath.row].longName
            cell.competitionShortName.text = competitionsViewData?[indexPath.row].shortName
            cell.competitionNumberOfGames.text = "\(competitionsViewData?[indexPath.row].numberOfGames ?? 0)"
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
            let detailViewController = storyboard.instantiateViewController(withIdentifier: "competitionDetails") as! CompetitionDetailsViewController
            
            present(detailViewController, animated: true, completion: nil)
        }
    
    
}

