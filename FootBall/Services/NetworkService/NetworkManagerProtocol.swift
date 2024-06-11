//
//  NetworkManagerProtocol.swift
//  FootBall
//
//  Created by Mina Emad on 10/06/2024.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol{
    func setUrlFormat(baseUrl: String,request: String, id: String, query: String) -> String
    func getFootballDetailsFromApi<T: Decodable>(url: String, headers: HTTPHeaders, handler: @escaping (T)->Void)
}
