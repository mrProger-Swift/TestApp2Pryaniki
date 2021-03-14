//
//  NetworkManager.swift
//  TestAppPryaniki
//
//  Created by User on 11.03.2021.
//
import Alamofire
import Foundation

class NetworkManager{
    
    func getdata(urlString: String,
                 completion: @escaping(AFDataResponse<Any>)->(),
                 error: @escaping(AFError)->()) {
        AF.request(urlString, method: .get, parameters: nil,
                   encoding: URLEncoding.default,
                   headers: nil,
                   interceptor: .none,
                   requestModifier: .none).responseJSON { (responce) in
                    switch responce.result {
                    case .failure(_): error(responce.error!)
                    case .success(_): completion(responce)
                    }
            }
    }
}
