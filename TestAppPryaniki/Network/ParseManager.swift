//
//  ParseManager.swift
//  TestAppPryaniki
//
//  Created by User on 11.03.2021.
//
import Alamofire
import Foundation
class ParseManager{
    var networkManager = NetworkManager()
    
    func parseJson<model: Decodable>(urlString: String,
                                     model: model.Type,
                                     completion: @escaping(model)->(),
                                     error: @escaping(AFError)->()){
        networkManager.getdata(urlString: urlString) { (AFData) in
            let jsonDecoder = JSONDecoder()
            do{
                guard let data = AFData.data else {return}
                let decoded = try jsonDecoder.decode(model.self, from: data)
                completion(decoded)
            } catch {
                print (error.localizedDescription)
            }
        } error: { (errors) in
            error(errors)
        }
    }
}
