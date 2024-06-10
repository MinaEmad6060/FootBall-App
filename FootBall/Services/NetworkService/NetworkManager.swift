//
//  NetworkManager.swift
//  FootBall
//
//  Created by Mina Emad on 09/06/2024.
//

import Foundation
import Alamofire


struct NetworkManager{
    let url = "http://api.football-data.org/v2/competitions"
    let headers: HTTPHeaders = [
        "X-Auth-Token": "84c35a8dce344f05bc3b538e50e8ca0b"
    ]

//    func formatUrl(request: String, query: String="", value: String="") -> String{
//        return baseUrl+request+".json?"+query+"="+value
//    }
    
    func getFootballDetailsFromApi<T: Decodable>(url: String, handler: @escaping (T)->Void){
        let urlFB = URL(string: url)
        guard let urlFB = urlFB else{return}
        
        
        AF.request(urlFB, headers: headers).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let footballDetails):
                handler(footballDetails)
                print("Success: \(footballDetails)")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
//    
//    func handleResponse(_ json: [String: Any]) {
//        // Handle the JSON response
//        print("JSON Response: \(json)")
//    }
}


