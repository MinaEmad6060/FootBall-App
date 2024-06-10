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
    
    var allCompetitionsViewModel: AllCompetitionsViewModelProtocol!
    
    var numberOfTeamsForCompetition: [String]?
    var numberOfGamesForCompetition: [String]?
    
    //just for view data (not a model)
    var competitionsViewData: [CompetitionsViewData]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        competitionsTable.delegate = self
        competitionsTable.dataSource = self
        
        allCompetitionsViewModel = AllCompetitionsViewModel()
        competitionsViewData = [CompetitionsViewData]()
        
        allCompetitionsViewModel.getCompetitionsFromNetworkService()
        
        let nibCustomCell = UINib(nibName: "CompetitionViewCell", bundle: nil)
        competitionsTable.register(nibCustomCell, forCellReuseIdentifier: "competitionCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = competitionsTable.indexPathForSelectedRow {
            competitionsTable.deselectRow(at: indexPath, animated: false)
        }
        
        
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
            cell.competitionLongName.text = competitionsViewData?[indexPath.row].longName
            cell.competitionShortName.text = competitionsViewData?[indexPath.row].shortName
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
            Constants.competitionId = competitionsViewData[indexPath.row].id
            present(detailViewController, animated: true, completion: nil)
        }
    
    
}

