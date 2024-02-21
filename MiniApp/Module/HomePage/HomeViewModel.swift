//
//  HomeViewModel.swift
//  MiniApp
//
//  Created by Carlos on 21/02/24.
//

import Foundation
import Network
import Alamofire

class HomeViewModel {
    func fetchUser(completion: @escaping (Result<[ListUser], Error>) -> Void) {
        let parameters: [String: Any] = [
            "page": 2
        ]
        
        if let userUrl = URL(string: "https://reqres.in/api/users") {
            AF.request(userUrl, method: .get, parameters: parameters)
                .validate()
                .responseDecodable(of: User.self) { response in
                    
                    switch response.result {
                    case .success(let userResponse):
                        completion(.success(userResponse.data))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        }
    }
}
