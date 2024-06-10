//
//  TeamDetailsViewModelProtocol.swift
//  FootBall
//
//  Created by Mina Emad on 10/06/2024.
//

import Foundation


protocol TeamDetailsViewModelProtocol{
    var teamPlayerViewData: [TeamPlayerViewData]? { get set }
    var teamInformation: TeamInformationViewData? { get set }
    var bindTeamsToViewController : (()->())? { get set }
    func getTeamDetailsFromNetworkService()
    func getPlayersFromNetworkService()
}
