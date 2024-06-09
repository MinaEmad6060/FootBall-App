//
//  Leagues.swift
//  FootBall
//
//  Created by Mina Emad on 09/06/2024.
//

import Foundation

struct FootballCompetitions: Decodable{
    var competitions: [Competition]?
}

struct Competition: Decodable{
    var id: Int8?
    var area: Area?
    //longName
    var name: String?
    var emblemUrl: String?
    var currentSeason: Season?
}


struct Area: Decodable{
    //shortName
    var name: String?
}

struct Season: Decodable{
    //games
    var currentMatchday: Int8?
    var startDate: String?
    var endDate: String?
    var winner: Winner?
}

struct Winner: Decodable{
    //longName
    var name: String?
    //shortName
    var tla: String?
    var crestUrl: String?
}
