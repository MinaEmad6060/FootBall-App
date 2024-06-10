//
//  NetworkManager.swift
//  FootBall
//
//  Created by Mina Emad on 09/06/2024.
//

import Foundation
import Alamofire


struct NetworkManager {
//    func formatUrl(request: String, query: String="", value: String="") -> String{
//        return baseUrl+request+".json?"+query+"="+value
//    }
    
    let url = "https://api.football-data.org/v2/competitions"
    let headers: HTTPHeaders = [
        "Content-Type": "application/json",
        "X-Auth-Token": "84c35a8dce344f05bc3b538e50e8ca0b"
    ]
    
    func getFootballDetailsFromApi<T: Decodable>(url: String, handler: @escaping (T)->Void){
        let urlFB = URL(string: url)
        guard let urlFB = urlFB else{return}
        
        
        AF.request(urlFB).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let upcomingMatches):
                handler(upcomingMatches)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }

}

