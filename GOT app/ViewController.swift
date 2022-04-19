//
//  ViewController.swift
//  GOT app
//
//  Created by Chris Bond on 4/19/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var houses = Houses()
    var numberOfTimesCalled = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        houses.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()

            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let destination = segue.destination as! DetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.houseInfo  = houses.houseArray[selectedIndexPath.row]
            
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.houseArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("loading row: \(indexPath.row + 1) out of \(houses.houseArray.count) total houses")
        if indexPath.row == houses.houseArray.count - 1 && houses.continueLoading {
            houses.getData {
                print("number of times called: \(self.numberOfTimesCalled)")
                self.numberOfTimesCalled += 1
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1). \(houses.houseArray[indexPath.row].name)"
        return cell
    }
}
