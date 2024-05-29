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
        
        let timeStamp = "\(Date().timeIntervalSince1970)"

        let hash = (timeStamp + ENV.privateApiKey.rawValue + ENV.publicApiKey.rawValue).md5
        
        let baseURL = "\(NetworkLayerConstant.baseURL)ts=\(timeStamp)&limit=\(APIConstants.defaultLimit)&offset=\(offset)&apikey=\(ENV.publicApiKey.rawValue)&hash=\(hash)"
        
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
