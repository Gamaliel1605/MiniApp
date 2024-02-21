//
//  LoginViewModel.swift
//  MiniApp
//
//  Created by Carlos on 21/02/24.
//

import Foundation
import Network
import Alamofire

class LoginViewModel {
    func loginUser(username: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        let parameters: [String: Any] = [
            "username": "",
            "email": username,
            "password": password
        ]
        
        if let loginURL = URL(string: "https://reqres.in/api/login") {
            AF.request(loginURL, method: .post, parameters: parameters)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: Login.self) { response in
                    switch response.result {
                    case .success(let loginResponse):
                        completion(.success(loginResponse.token))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        }
    }
}
