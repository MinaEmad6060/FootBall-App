//
//  FootBallPlayers.swift
//  FootBall
//
//  Created by Mina Emad on 10/06/2024.
//

import Foundation


struct FootBallPlayer: Decodable{
    var squad: [Squad]?
}

struct Squad: Decodable{
    var name: String?
    var position: String?
    var nationality: String?
}
