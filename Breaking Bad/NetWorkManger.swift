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
        
        AF.request("https://www.breakingbadapi.com/api/quote/random",method: .get,encoding: URLEncoding.default).responseData { dataRespnse in
            if let err      = dataRespnse.error{
                print(err.localizedDescription)
                return
            }
            guard let data = dataRespnse.data else{return}
            print(data)
            do{
                let encoder = JSONDecoder()
                let randomQoutes = try encoder.decode([RandomQouteData].self, from: data)
                completion(randomQoutes)

            }catch let error {
                print(error.localizedDescription)
            }
        }
    }
        func getCountDeath(completion: @escaping([DeathCountElement]) ->Void){
            
            AF.request("https://www.breakingbadapi.com/api/death-count",method: .get,encoding: URLEncoding.default).responseData { dataRespnse in
                if let err      = dataRespnse.error{
                    print(err.localizedDescription)
                    return
                }
                guard let data = dataRespnse.data else{return}
                
                do{
                    let encoder = JSONDecoder()
                    let count = try encoder.decode([DeathCountElement].self, from: data)
                   completion(count)
                 

                }catch let error {
                    print(error.localizedDescription)
                }
            }

    }
    
    func getAllIDeath(completion: @escaping([AllDeathElement]) ->Void){
        
        AF.request("https://www.breakingbadapi.com/api/deaths",method: .get,encoding: URLEncoding.default).responseData { dataRespnse in
            if let err      = dataRespnse.error{
                print(err.localizedDescription)
                return
            }
            guard let data = dataRespnse.data else{return}
            
            do{
                let encoder = JSONDecoder()
                let randomQoutes = try encoder.decode([AllDeathElement].self, from: data)
               completion(randomQoutes)

            }catch let error {
                print(error.localizedDescription)
            }
        }

}
    func searchAllIDeath(sreachText:String,completion: @escaping([AllDeathElement]) ->Void){
        
        AF.request("https://www.breakingbadapi.com/api/death?name=\(sreachText)",method: .get,encoding: URLEncoding.default).responseData { dataRespnse in
            if let err      = dataRespnse.error{
                print(err.localizedDescription)
                return
            }
            guard let data = dataRespnse.data else{return}
            
            do{
                let encoder = JSONDecoder()
                let randomQoutes = try encoder.decode([AllDeathElement].self, from: data)
               completion(randomQoutes)

            }catch let error {
                print(error.localizedDescription)
            }
        }

}
    func getsearchResultsFromCharacter(sreachText:String,completion: @escaping([CharactersNameElement]) ->Void){
        
        AF.request("https://www.breakingbadapi.com/api/characters?name=" + sreachText,method: .get,encoding: URLEncoding.default).responseData { dataRespnse in
            if let err      = dataRespnse.error{
                print(err.localizedDescription)
                return
            }
            guard let data = dataRespnse.data else{return}
            
            do{
                let encoder = JSONDecoder()
                let charactersName = try encoder.decode([CharactersNameElement].self, from: data)
                completion(charactersName)

            }catch let error {
                print(error.localizedDescription)
            }
        }

}

    
    func getAllCharacters(completion: @escaping([CharactersNameElement]) ->Void){
        
        AF.request("https://www.breakingbadapi.com/api/characters",method: .get,encoding: URLEncoding.default).responseData { dataRespnse in
            if let err      = dataRespnse.error{
                print(err.localizedDescription)
                return
            }
            guard let data = dataRespnse.data else{return}
            
            do{
                let encoder = JSONDecoder()
                let charactersName = try encoder.decode([CharactersNameElement].self, from: data)
                completion(charactersName)

            }catch let error {
                print(error.localizedDescription)
            }
        }

}
    func getAllEpisode(completion: @escaping([AllEpisode]) ->Void){
        
        AF.request("https://www.breakingbadapi.com/api/episodes",method: .get,encoding: URLEncoding.default).responseData { dataRespnse in
            if let err      = dataRespnse.error{
                print(err.localizedDescription)
                return
            }
            guard let data = dataRespnse.data else{return}
            
            do{
                let encoder = JSONDecoder()
                let episode = try encoder.decode([AllEpisode].self, from: data)
                completion(episode)

            }catch let error {
                print(error.localizedDescription)
            }
        }

}

    func searchAllEpisode(searchText:String,completion: @escaping([AllEpisode]) ->Void){
        
        AF.request("https://www.breakingbadapi.com/api/episodes/\(searchText)",method: .get,encoding: URLEncoding.default).responseData { dataRespnse in
            if let err      = dataRespnse.error{
                print(err.localizedDescription)
                return
            }
            guard let data = dataRespnse.data else{return}
            
            do{
                let encoder = JSONDecoder()
                let episode = try encoder.decode([AllEpisode].self, from: data)
                completion(episode)

            }catch let error {
                print(error.localizedDescription)
            }
        }

}
//
}
/***/
