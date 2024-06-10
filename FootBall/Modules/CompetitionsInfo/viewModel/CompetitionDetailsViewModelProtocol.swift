//
//  CompetitionDetailsViewModelProtocol.swift
//  FootBall
//
//  Created by Mina Emad on 10/06/2024.
//

import Foundation

protocol CompetitionDetailsViewModelProtocol{
    var competitionsDetailsViewData: CompetitionsDetailsViewData? { get set }
    var competitionTeamViewData: [CompetitionTeamViewData]? { get set }
//    var numberOfGamesForCompetition: Int16? { get set }

    var bindCompetitionsDetailsToViewController : (()->())? { get set }
    var bindTeamsToViewController : (()->())? { get set }
//    var bindGamesToViewController : (()->())? { get set }
    
    func getCompetitionsDetailsFromNetworkService()
    func getTeamsFromNetworkService()
//    func getGamesFromNetworkService()
}
