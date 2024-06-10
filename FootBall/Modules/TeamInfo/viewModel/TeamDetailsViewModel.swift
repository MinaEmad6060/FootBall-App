//
//  TeamDetailsViewModel.swift
//  FootBall
//
//  Created by Mina Emad on 10/06/2024.
//

import Foundation



class TeamDetailsViewModel{
    var bindTeamsToViewController: (() -> ())?
    
    var networkManager = NetworkManager()
    
    var competitionsDetailsViewData: CompetitionsDetailsViewData?
    var competitionTeamViewData: [CompetitionTeamViewData]?
    
    var numberOfTeamsForCompetition: Int16?
    
//    func getTeamsFromNetworkService() {
//        let url = networkManager.setUrlFormat(baseUrl: Constants.baseUrl, id: "2000", query: "teams")
//        print("url : \(url)")
//        competitionTeamViewData = [CompetitionTeamViewData]()
//        networkManager.getFootballDetailsFromApi(url:  url, headers: Constants.headers) {[weak self]  (footballTeams: FootballTeams) in
//            
//            self?.numberOfTeamsForCompetition = footballTeams.count
//            print("#team : \(footballTeams.count ?? -1)")
//            if let teams = footballTeams.teams{
//                var team = CompetitionTeamViewData()
//                for i in 0..<teams.count{
//                    team.image = teams[i].crestUrl
//                    team.longName = teams[i].name
//                    team.shortName = teams[i].shortName
//                }
//                self?.competitionTeamViewData?.append(team)
//                print("team : \(self?.competitionTeamViewData?[0].longName ?? "none")")
//            }
//        }
//    }
}
