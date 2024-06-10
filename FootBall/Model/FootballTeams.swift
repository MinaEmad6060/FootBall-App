//
//  Team.swift
//  FootBall
//
//  Created by Mina Emad on 09/06/2024.
//

import Foundation


struct FootballTeams: Decodable{
    var count: Int16?
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
    var founded:Int16?
    var squad: [Squad]?
}


struct Squad: Decodable{
    var name: String?
    var position: String?
    var nationality: String?
}

