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
    
    var competitionsDetailsViewData: CompetitionsDetailsViewData?
    var competitionTeamViewData: [CompetitionTeamViewData]?
    
    var networkManager: NetworkManagerProtocol?
    
    init(){
        networkManager = NetworkManager()
    }

    func getCompetitionsDetailsFromNetworkService() {
        let url = networkManager?.setUrlFormat(baseUrl: Constants.baseUrl, request: "competitions", id: "\(Constants.competitionID)", query: "") ?? ""
        competitionsDetailsViewData = CompetitionsDetailsViewData()
        networkManager?.getFootballDetailsFromApi(url:  url, headers: Constants.headers) {[weak self]  (footballCompetition: Competition) in
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
        let url = networkManager?.setUrlFormat(baseUrl: Constants.baseUrl, request: "competitions", id: "\(Constants.competitionID)", query: "teams") ?? ""
        competitionTeamViewData = [CompetitionTeamViewData]()
        networkManager?.getFootballDetailsFromApi(url:  url, headers: Constants.headers) {[weak self]  (footballTeams: FootballTeams) in
          
            if let teams = footballTeams.teams{
                var team = CompetitionTeamViewData()
                for i in 0..<teams.count{
                    team.id = teams[i].id
                    team.image = teams[i].crestUrl
                    team.longName = teams[i].name
                    team.shortName = teams[i].shortName
                    self?.competitionTeamViewData?.append(team)
                }
                self?.bindTeamsToViewController?()
            }
        }
    }
}
