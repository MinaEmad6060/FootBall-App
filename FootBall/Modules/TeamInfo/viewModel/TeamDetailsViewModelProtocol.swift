//
//  TeamDetailsViewModelProtocol.swift
//  FootBall
//
//  Created by Mina Emad on 10/06/2024.
//

import Foundation


protocol TeamDetailsViewModelProtocol{
    var teamInformation: TeamInformationViewData? { get set }
    var networkManager: NetworkManagerProtocol? { get set }

    var bindTeamInformationToViewController : (()->())? { get set }
    
    func getPlayersFromNetworkService()
}
