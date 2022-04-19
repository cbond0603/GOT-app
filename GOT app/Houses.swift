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
    var continueLoading = true
    
    func getData(completed: @escaping () -> ()) {
        let urlString = "https://www.anapioficeandfire.com/api/houses?page=\(pageNumber)&pageSize=50"
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
                let results = try JSONDecoder().decode([HouseInfo].self, from: data!)
                //If there is data in the array, increment pageNumber by 1 and update the house array to equal houseArray + new Array
                if results.count > 0 {
                    self.pageNumber = self.pageNumber + 1
                    self.houseArray = self.houseArray + results
                } else {
                    self.continueLoading = false
                }
            } catch {
                print("🤬 JSON ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()
    }
}
