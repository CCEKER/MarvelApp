//
//  CharacterService.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 28.05.2024.
//

import Foundation
import Alamofire

protocol CharacterServiceProtocol {
    func getCharacters(offset: Int, completion: @escaping (Result<[Character], Error>) -> Void)
}

final class CharacterService: CharacterServiceProtocol {
    
    func getCharacters(offset: Int, completion: @escaping (Result<[Character], Error>) -> Void) {
        
        let baseURL = "\(NetworkLayerConstant.baseURL)ts=1716888126&limit=\(APIConstants.defaultLimit)&offset=\(offset)&apikey=28bede087e3f85b6080e72b877883b9a&hash=03b0de8a0f87e32766bc3fb2934c35f1"
        
        let parameters: Parameters = ["offset": offset]
        
        
        AF.request(baseURL, method: .get, parameters: parameters).responseDecodable(of: BaseResponseModel.self) { response in
            switch response.result {
            case .success(let response):
                completion(.success(response.data.results))
            case .failure(let error):
                print("Bir hata oluştu: \(error)")
            }
        }
    }
}
