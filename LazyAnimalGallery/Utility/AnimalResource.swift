//
//  AnimalResource.swift
//  LazyAnimalGallery
//
//  Created by Pranav Pratap on 31/10/23.
//

import Foundation

struct AnimalResource {
    private let apiString = "https://api-dev-scus-demo.azurewebsites.net/api/Animal/GetAnimals"
    
    func getAnimals(completionHandler: @escaping(AnimalResponse?)-> ()){
        let animalApiUrl = URL(string: apiString)!
        
        URLSession.shared.dataTask(with: animalApiUrl) { data, URLResponse, error in
            if (error == nil && data != nil){
                do{
                    let result = try JSONDecoder().decode(AnimalResponse.self, from: data!)
                    completionHandler(result)
                }catch let exceptionError{
                    debugPrint(exceptionError.localizedDescription)
                }
            }else{
                print("Cannot retrive data from API")
            }
        }.resume()
        
    }
}
