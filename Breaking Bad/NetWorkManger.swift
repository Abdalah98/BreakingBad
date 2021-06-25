//
//  NetWorkManger.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/15/21.
//

import Foundation

import Alamofire

class NetworkManger{
    static let shared = NetworkManger()
    
    
    func getAllIRandomQuote(completion: @escaping([RandomQouteData]) ->Void){
        fetchGenericJSONData(urlString:"https://www.breakingbadapi.com/api/quote/random" , completion: completion)
    }
    
    func getCountDeath(completion: @escaping([DeathCountElement]) ->Void){
        fetchGenericJSONData(urlString: "https://www.breakingbadapi.com/api/death-count" , completion: completion)
    }
    
    func getAllIDeath(completion: @escaping([AllDeathElement]) ->Void){
        fetchGenericJSONData(urlString: "https://www.breakingbadapi.com/api/deaths" , completion: completion)
    }
    
    func searchAllIDeath(sreachText:String,completion: @escaping([AllDeathElement]) ->Void){
        fetchGenericJSONData(urlString: "https://www.breakingbadapi.com/api/death?name=\(sreachText)" + sreachText, completion: completion)
    }
    
    func getsearchResultsFromCharacter(sreachText:String,completion: @escaping([CharactersNameElement]) ->Void){
        fetchGenericJSONData(urlString: "https://www.breakingbadapi.com/api/characters?name=" + sreachText, completion: completion)
    }
    
    func getAllCharacters(completion: @escaping([CharactersNameElement]) ->Void){
        fetchGenericJSONData(urlString: "https://www.breakingbadapi.com/api/characters", completion: completion)
    }
    func getAllEpisode(completion: @escaping([AllEpisode]) ->Void){
        fetchGenericJSONData(urlString: "https://www.breakingbadapi.com/api/episodes", completion: completion)
    }
    
    func searchAllEpisode(searchText:String,completion: @escaping([AllEpisode]) ->Void){
        fetchGenericJSONData(urlString:"https://www.breakingbadapi.com/api/episodes/\(searchText)" , completion: completion)
    }
    
    func fetchGenericJSONData<T:Codable>(urlString:String,completion: @escaping (T)-> ()){
        AF.request(urlString,method: .get,encoding: URLEncoding.default).responseData { dataRespnse in
            if let err      = dataRespnse.error{
                print(err.localizedDescription)
                return
            }
            guard let data = dataRespnse.data else{return}
            
            do{
                let encoder = JSONDecoder()
                let episode = try encoder.decode(T.self, from: data)
                completion(episode)
                
            }catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
/***/
