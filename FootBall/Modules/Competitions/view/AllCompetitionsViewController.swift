//
//  ViewController.swift
//  FootBall
//
//  Created by Mina Emad on 09/06/2024.
//

import UIKit

struct CompetitionsViewData{
    var image: String?
    var longName: String?
    var shortName: String?
    var numberOfTeams: String?
    var numberOfGames: String?
}

class AllCompetitionsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var competitionsTable: UITableView!
    
    
    var allCompetitionsViewModel: AllCompetitionsViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        competitionsTable.delegate = self
        competitionsTable.dataSource = self
        
        allCompetitionsViewModel = AllCompetitionsViewModel()
        
        let nibCustomCell = UINib(nibName: "CompetitionViewCell", bundle: nil)
        competitionsTable.register(nibCustomCell, forCellReuseIdentifier: "competitionCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = competitionsTable.indexPathForSelectedRow {
            competitionsTable.deselectRow(at: indexPath, animated: false)
        }
        
        allCompetitionsViewModel.getCompetitionsFromNetworkService()
//        allCompetitionsViewModel
        
//        let url = networkManager.setUrlFormat(baseUrl: Constants.baseUrl)
//        
//        networkManager.getFootballDetailsFromApi(url:  url, headers: Constants.headers) {[weak self]  (footballCompetitions: FootballCompetitions) in
//            print("reslt : \(footballCompetitions.competitions?.count ?? 0)")
//        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "competitionCell", for: indexPath) as! CompetitionViewCell

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let detailViewController = storyboard.instantiateViewController(withIdentifier: "competitionDetails") as! CompetitionDetailsViewController
            
            present(detailViewController, animated: true, completion: nil)
        }
    
    
}

