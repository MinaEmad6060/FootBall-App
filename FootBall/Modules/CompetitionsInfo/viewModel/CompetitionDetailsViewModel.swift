//
//  CompetitionDetailsViewModel.swift
//  FootBall
//
//  Created by Mina Emad on 10/06/2024.
//

import Foundation


class CompetitionDetailsViewModel: CompetitionDetailsViewModelProtocol{
    
    
    var bindCompetitionsDetailsToViewController: (() -> ())?
    var bindTeamsToViewController: (() -> ())?
    var bindGamesToViewController: (() -> ())?
    
    var networkManager = NetworkManager()
    
    var competitionsDetailsViewData: CompetitionsDetailsViewData?
    var competitionTeamViewData: [CompetitionTeamViewData]?
    
    var numberOfGamesForCompetition: Int16?
    
    func getCompetitionsDetailsFromNetworkService() {
        let url = networkManager.setUrlFormat(baseUrl: Constants.baseUrl, request: "competitions", id: "2000")
        competitionsDetailsViewData = CompetitionsDetailsViewData()
        networkManager.getFootballDetailsFromApi(url:  url, headers: Constants.headers) {[weak self]  (footballCompetition: Competition) in
            
            self?.competitionsDetailsViewData?.endDate = footballCompetition.currentSeason?.endDate
            self?.competitionsDetailsViewData?.startDate = footballCompetition.currentSeason?.startDate
            self?.competitionsDetailsViewData?.image = footballCompetition.emblemUrl
            self?.competitionsDetailsViewData?.longName = footballCompetition.name
            self?.competitionsDetailsViewData?.shortName = footballCompetition.area?.name
            
            self?.competitionsDetailsViewData?.winnerImage = footballCompetition.currentSeason?.winner?.crestUrl
            self?.competitionsDetailsViewData?.winnerLongName = footballCompetition.currentSeason?.winner?.name
            self?.competitionsDetailsViewData?.winnerShortName = footballCompetition.currentSeason?.winner?.tla
            
            self?.bindCompetitionsDetailsToViewController?()
        }
    }
    
    func getTeamsFromNetworkService() {
        let url = networkManager.setUrlFormat(baseUrl: Constants.baseUrl, request: "competitions", id: "2000", query: "teams")
        competitionTeamViewData = [CompetitionTeamViewData]()
        networkManager.getFootballDetailsFromApi(url:  url, headers: Constants.headers) {[weak self]  (footballTeams: FootballTeams) in
          
            if let teams = footballTeams.teams{
                var team = CompetitionTeamViewData()
                for i in 0..<teams.count{
                    team.image = teams[i].crestUrl
                    team.longName = teams[i].name
                    team.shortName = teams[i].shortName
                    self?.competitionTeamViewData?.append(team)
                }
                self?.bindTeamsToViewController?()
            }
        }
    }
    
    func getGamesFromNetworkService() {
        let url = networkManager.setUrlFormat(baseUrl: Constants.baseUrl, request: "competitions", id: "2000", query: "matches")
        networkManager.getFootballDetailsFromApi(url:  url, headers: Constants.headers) {[weak self]  (footballGames: FootballGames) in
            self?.numberOfGamesForCompetition = footballGames.count
            self?.bindGamesToViewController?()
        }
    }
  
}
