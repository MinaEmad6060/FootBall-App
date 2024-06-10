//
//  CompetitionDetailsViewModelProtocol.swift
//  FootBall
//
//  Created by Mina Emad on 10/06/2024.
//

import Foundation

protocol CompetitionDetailsViewModelProtocol{
    var competitionsDetailsViewData: CompetitionsDetailsViewData? { get set }
    var bindCompetitionsDetailsToViewController : (()->())? { get set }
    func getCompetitionsDetailsFromNetworkService()
}
