//
//  TeamDetailsViewModel.swift
//  FootBall
//
//  Created by Mina Emad on 10/06/2024.
//

import Foundation



class TeamDetailsViewModel : TeamDetailsViewModelProtocol{
    
    
    var teamInformation: TeamInformationViewData?
       
    var bindTeamInformationToViewController: (() -> ())?
        
    var networkManager = NetworkManager()
    
    func getPlayersFromNetworkService() {
        let url = networkManager.setUrlFormat(baseUrl: Constants.baseUrl, request: "teams", id: "2061")
        print("url : \(url)")
        teamInformation = TeamInformationViewData()
        teamInformation?.players = [TeamPlayerViewData]()
        networkManager.getFootballDetailsFromApi(url:  url, headers: Constants.headers) {[weak self]  (footballPlayers: Team) in
            
            self?.teamInformation?.founded = "\(footballPlayers.founded ?? -1)"
            self?.teamInformation?.longName = footballPlayers.name
            self?.teamInformation?.shortName = footballPlayers.shortName
            self?.teamInformation?.stadium = footballPlayers.venue
            self?.teamInformation?.colors = footballPlayers.clubColors
            self?.teamInformation?.website = footballPlayers.website
            self?.teamInformation?.image = footballPlayers.crestUrl
            
            if let players = footballPlayers.squad {
                var player = TeamPlayerViewData()
                for i in 0..<players.count{
                    player.name = players[i].name
                    player.position = players[i].position
                    player.nationality = players[i].nationality
                    self?.teamInformation?.players?.append(player)
                }
                self?.bindTeamInformationToViewController?()
                print("Plyers : \(self?.teamInformation?.players?.count ?? -1)")
            }
        }
    }
}
