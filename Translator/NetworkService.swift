//
//  NetworkService.swift
//  Translator
//
//  Created by Ivan Zakharov on 3/9/21.
//

import Foundation

class NetworkService {

    func getTranslate(word: String, completion: @escaping (Result<[MeaningsModel], Error>) -> Void) {
        let urlString = "https://dictionary.skyeng.ru/api/public/v1/words/search?search=\(word)"
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else {
                    return
                }
                do {
                    let meanings = try JSONDecoder().decode([MeaningsModel].self, from: data)
                    completion(.success(meanings))
                }
                catch let jsonError {
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
