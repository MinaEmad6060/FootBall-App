//
//  AllCompetitionsViewModel.swift
//  FootBall
//
//  Created by Mina Emad on 10/06/2024.
//

import Foundation


class AllCompetitionsViewModel: AllCompetitionsViewModelProtocol{
    
    var networkManager = NetworkManager()
    
    var competitionsViewData: [CompetitionsViewData]?

    var bindCompetitionsToViewController : (()->())? = {}

    
    
    
    func getCompetitionsFromNetworkService(){
        let url = networkManager.setUrlFormat(baseUrl: Constants.baseUrl)
        competitionsViewData = [CompetitionsViewData]()
        networkManager.getFootballDetailsFromApi(url:  url, headers: Constants.headers) {[weak self]  (footballCompetitions: FootballCompetitions) in
            var competition = CompetitionsViewData()
            if let competitionList = footballCompetitions.competitions {
                for i in 0..<competitionList.count {
                    competition.image = competitionList[i].emblemUrl
                    competition.longName = competitionList[i].name
                    competition.shortName = competitionList[i].area?.name
                    competition.id = competitionList[i].id
                    self?.competitionsViewData?.append(competition)
                }
                self?.bindCompetitionsToViewController?()
            }
        }
    }
    
}
