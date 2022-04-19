//
//  Houses.swift
//  GOT app
//
//  Created by Chris Bond on 4/19/22.
//

import Foundation

class Houses {
    
    var houseArray: [HouseInfo] = []
    var url = "https://www.anapioficeandfire.com/api/houses?page=1&pageSize=50"
    var pageNumber = 1
    
    func getData(completed: @escaping () -> ()) {
        let urlString = url
        print("🕸🕸 We are accessing the url \(urlString)")
        
        guard let url = URL(string: urlString) else {
            print("🤬 ERROR: Couldn't create a URL from \(urlString)")
            completed()
            return
        }
        
        //Create Session
        let session = URLSession.shared
        
        //get data with .datatask method
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("🤬 ERROR: \(error.localizedDescription)")
            }
            //deal with data
            do {
                self.houseArray = try JSONDecoder().decode([HouseInfo].self, from: data!)
                print("*** \(self.houseArray)")
                
            } catch {
                print("🤬 JSON ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()
    }
}
