//
//  TeamDetailsViewModel.swift
//  FootBall
//
//  Created by Mina Emad on 10/06/2024.
//

import Foundation



class TeamDetailsViewModel : TeamDetailsViewModelProtocol{
    
    var teamPlayerViewData: [TeamPlayerViewData]?
    
    var teamInformation: TeamInformationViewData?
       
    var bindTeamsToViewController: (() -> ())?
    
    var bindPlayersToViewController: (() -> ())?
    
    var networkManager = NetworkManager()
    
   
    
    func getTeamDetailsFromNetworkService() {
//        let url = networkManager.setUrlFormat(baseUrl: Constants.baseUrl, request: "teams", id: "2000")
//        print("url : \(url)")
//        teamPlayerViewData = [TeamPlayerViewData]()
//        networkManager.getFootballDetailsFromApi(url:  url, headers: Constants.headers) {[weak self]  (footballPlayers: FootBallPlayer) in
//            
//            if let players = footballPlayers.squad {
//                var player = TeamPlayerViewData()
//                for i in 0..<players.count{
//                    player.name = players[i].name
//                    player.position = players[i].position
//                    player.nationality = players[i].nationality
//                }
//                self?.teamPlayerViewData?.append(player)
//                print("team : \(self?.teamPlayerViewData?[0].name ?? "none")")
//            }
//        }
    }
    
    
    func getPlayersFromNetworkService() {
        let url = networkManager.setUrlFormat(baseUrl: Constants.baseUrl, request: "teams", id: "2000")
        print("url : \(url)")
        teamPlayerViewData = [TeamPlayerViewData]()
        networkManager.getFootballDetailsFromApi(url:  url, headers: Constants.headers) {[weak self]  (footballPlayers: FootBallPlayer) in
            
            if let players = footballPlayers.squad {
                var player = TeamPlayerViewData()
                for i in 0..<players.count{
                    player.name = players[i].name
                    player.position = players[i].position
                    player.nationality = players[i].nationality
                }
                self?.teamPlayerViewData?.append(player)
                print("team : \(self?.teamPlayerViewData?[0].name ?? "none")")
            }
        }
    }
}
