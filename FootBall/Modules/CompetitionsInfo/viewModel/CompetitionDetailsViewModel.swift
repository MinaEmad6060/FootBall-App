//
//  CompetitionDetailsViewModel.swift
//  FootBall
//
//  Created by Mina Emad on 10/06/2024.
//

import Foundation


class CompetitionDetailsViewModel: CompetitionDetailsViewModelProtocol{
    
    
    var bindCompetitionsDetailsToViewController: (() -> ())?
    
    var networkManager = NetworkManager()
    
    var competitionsDetailsViewData: CompetitionsDetailsViewData?
    
    func getCompetitionsDetailsFromNetworkService() {
        let url = networkManager.setUrlFormat(baseUrl: Constants.baseUrl, id: "2000")
        competitionsDetailsViewData = CompetitionsDetailsViewData()
        networkManager.getFootballDetailsFromApi(url:  url, headers: Constants.headers) {[weak self]  (footballCompetition: Competition) in
            self?.competitionsDetailsViewData?.endDate = footballCompetition.currentSeason?.endDate
            self?.competitionsDetailsViewData?.startDate = footballCompetition.currentSeason?.startDate
            self?.competitionsDetailsViewData?.image = footballCompetition.emblemUrl
            self?.competitionsDetailsViewData?.longName = footballCompetition.name
            self?.competitionsDetailsViewData?.shortName = footballCompetition.area?.name
            self?.bindCompetitionsDetailsToViewController?()
        }
    }
  
}
