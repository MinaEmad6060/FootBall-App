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
    
    static let placeholderCompetitionImage = UIImage(named: "team")
    static let placeholderPlayerImage = UIImage(named: "player")
    
    static var teamID: Int16 = 2061
    static var competitionID: Int16 = 2000

    static func generateRandomNumber(start: Int16, end: Int16) -> Int {
        return Int.random(in: Int(start)...Int(end))
    }
}
