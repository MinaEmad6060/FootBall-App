//
//  AllCompetitionsViewModelProtocol.swift
//  FootBall
//
//  Created by Mina Emad on 10/06/2024.
//

import Foundation


protocol AllCompetitionsViewModelProtocol{
    var competitionsViewData: [CompetitionsViewData]? { get set }
//    var numberOfTeamsForCompetition: Int16? { get set }
    
    var bindCompetitionsToViewController : (()->())? { get set }
//    var bindTeamsToViewController : (()->())? { get set }
    
    func getCompetitionsFromNetworkService()
//    func getNumberOfTeamsFromNetworkService()
}
