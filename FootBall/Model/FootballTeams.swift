//
//  Team.swift
//  FootBall
//
//  Created by Mina Emad on 09/06/2024.
//

import Foundation


struct FootballTeams: Decodable{
    var count: Int8?
    var competition: Competition?
    var teams: [Team]?
}

struct Team: Decodable{
    //longName
    var name:String?
    var shortName:String?
    var crestUrl:String?
    var clubColors:String?
    //stadium
    var venue:String?
    var website:String?
    var founded:Int8?
}

