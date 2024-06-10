//
//  AllCompetitionsViewModel.swift
//  FootBall
//
//  Created by Mina Emad on 10/06/2024.
//

import Foundation


class AllCompetitionsViewModel: AllCompetitionsViewModelProtocol{
    
    
    var networkManager = NetworkManager()
    
    var bindCompetitionsToViewController : (()->())? = {}
    
    var allCompetitions: FootballCompetitions? {
        didSet{
                (bindCompetitionsToViewController ?? {})()
        }
    }
    
    
    
    func getCompetitionsFromNetworkService(){
        let url = networkManager.setUrlFormat(baseUrl: Constants.baseUrl)
        
        networkManager.getFootballDetailsFromApi(url:  url, headers: Constants.headers) {[weak self]  (footballCompetitions: FootballCompetitions) in
            self?.allCompetitions = footballCompetitions
            print("reslt : \(footballCompetitions.competitions?.count ?? 0)")
        }
    }
    
}
