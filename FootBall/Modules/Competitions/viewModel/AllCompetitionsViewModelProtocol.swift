//
//  AllCompetitionsViewModelProtocol.swift
//  FootBall
//
//  Created by Mina Emad on 10/06/2024.
//

import Foundation


protocol AllCompetitionsViewModelProtocol{
    
    var competitionsViewData: [CompetitionsViewData]? { get set }
    var networkManager: NetworkManagerProtocol? { get set }
    
    var bindCompetitionsToViewController : (()->())? { get set }
    
    func getCompetitionsFromNetworkService()
    
}
