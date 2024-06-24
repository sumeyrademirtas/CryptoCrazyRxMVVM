//
//  WebService.swift
//  CryptoCrazyRxMVVM
//
//  Created by Sümeyra Demirtaş on 24.06.2024.
//

import Foundation


enum CryptoError :  Error {
    case serverError
    case parsingError
}

class WebService {
    
    //escaping is bittikten sonra calistiriliyor
    func downloadCurrencies(url: URL, completion: @escaping (Result<[Crypto], CryptoError>) -> () ) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            //eger hata mesaji varsa, ben bu fonksiyonun dondurecegi closure a bu hatayi donduruyorum
            if let _ = error {
                completion(.failure(.serverError))
            } else if let data = data {
                
               let cryptoList = try? JSONDecoder().decode([Crypto].self, from: data)
                if let cryptoList = cryptoList {
                    completion(.success(cryptoList))
                } else {
                    completion(.failure(.parsingError))
                }
            }
            
        } .resume() //bunu eklemezsek calismiyor
    }
    
}
