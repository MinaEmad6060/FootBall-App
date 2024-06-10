//
//  AllCompetitionsViewModel.swift
//  FootBall
//
//  Created by Mina Emad on 10/06/2024.
//

import Foundation


class AllCompetitionsViewModel: AllCompetitionsViewModelProtocol{
    
    var networkManager = NetworkManager()
    
    var competitionsViewData: [CompetitionsViewData]?{
        didSet{
                (bindCompetitionsToViewController ?? {})()
        }
    }
    var bindCompetitionsToViewController : (()->())? = {}

    
    
    
    func getCompetitionsFromNetworkService(){
        let url = networkManager.setUrlFormat(baseUrl: Constants.baseUrl)
        competitionsViewData = [CompetitionsViewData]()
        networkManager.getFootballDetailsFromApi(url:  url, headers: Constants.headers) {[weak self]  (footballCompetitions: FootballCompetitions) in
            var competition = CompetitionsViewData()
            if let competitions = footballCompetitions.competitions {
                for i in 0..<competitions.count {
                   
                    competition.image = footballCompetitions.competitions?[i].emblemUrl
                    print("VM url true \(competition.image ?? "none")")
                    competition.longName = footballCompetitions.competitions?[i].name
                    competition.shortName = footballCompetitions.competitions?[i].area?.name
                    competition.numberOfGames = footballCompetitions.competitions?[i].currentSeason?.currentMatchday
                    self?.competitionsViewData?.append(competition)
                }
                
            }
            print("reslt : \(footballCompetitions.competitions?.count ?? 0)")
        }
    }
    
}
