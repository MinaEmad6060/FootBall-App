//
//  Constants.swift
//  FootBall
//
//  Created by Mina Emad on 10/06/2024.
//

import Foundation
import Alamofire


class Constants{
    static let baseUrl = "https://api.football-data.org/v2"
    static let headers: HTTPHeaders = [
        "Content-Type": "application/json",
        "X-Auth-Token": "84c35a8dce344f05bc3b538e50e8ca0b"
    ]
    static var competitionId: Int16?
    
    static let placeholderCompetitionImage = UIImage(systemName: "trophy.fill")
    static let placeholderPlayerImage = UIImage(systemName: "figure.australian.football")
}
