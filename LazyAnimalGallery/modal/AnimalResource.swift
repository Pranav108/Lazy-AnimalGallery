//
//  AnimalResource.swift
//  LazyAnimalGallery
//
//  Created by Pranav Pratap on 31/10/23.
//

import Foundation

struct AnimalResource {
    
    // This API is owned by CodeCat15
    private let apiString = "https://api-dev-scus-demo.azurewebsites.net/api/Animal/GetAnimals"
    
    func getAnimal(completionHandler : @escaping (Result<[Animal], RequestError>)->Void){
        guard let animalApiUrl = URL(string: apiString) else {
            completionHandler(.failure(.invalidUrl))
            return
        }
        URLSession.shared.dataTask(with: animalApiUrl) { data, response, error in
            var result : Result<[Animal], RequestError>
            defer {
                completionHandler(result)
            }
            if let error = error {
                result = .failure(.failedRequest(error: error))
                return
            }
            guard let data = data else{
                result = .failure(.unknownError)
                return
            }
            do {
                let animalArray = try JSONDecoder().decode(AnimalResponse.self, from: data)
                result = .success(animalArray.animals)
            }catch {
                result = .failure(.errorDecode)
            }
        }.resume()
    }
}
