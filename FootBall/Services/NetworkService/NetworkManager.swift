//
//  NetworkManager.swift
//  FootBall
//
//  Created by Mina Emad on 09/06/2024.
//

import Foundation
import Alamofire


struct NetworkManager {
    
    
    func setUrlFormat(baseUrl: String, id: String="", query: String="") -> String{
        return baseUrl+id+query
    }
    
    
    func getFootballDetailsFromApi<T: Decodable>(url: String, headers: HTTPHeaders, handler: @escaping (T)->Void){
        let urlFB = URL(string: url)
        guard let urlFB = urlFB else{return}
        
        AF.request(urlFB, headers: headers).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let upcomingMatches):
                handler(upcomingMatches)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }

}

