//
//  RecordsVC.swift
//  Cookie-Hackathon1
//
//  Created by DaVinci on 2/7/17.
//  Copyright © 2017 Stefanie Fluin. All rights reserved.
//

import UIKit

class RecordsVC: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableview: UITableView!
    
    @IBOutlet var searchBar: UISearchBar!
    
    var files : [String] = []
    
    var cellString : [String] = []
    var filtered: [String] = []
    
    var searchActive : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableview.delegate = self
        tableview.dataSource = self
        searchBar.delegate = self
        searchBar.autocapitalizationType = .none
        searchBar.showsCancelButton = true
        searchBar.tintColor = UIColor.white
        
        files = DatabaseManager.singleton.getSurveyFileList()
        
        for i in 0 ..< self.files.count
        {
            let fileName = files[i]
            let object = DatabaseManager.singleton.readObject(name: fileName)
            
            cellString.append("\(object!.session!) : \(object!.answer!)")
        }
    }
   
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
        self.searchBar.endEditing(true)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
        self.searchBar.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filtered = cellString.filter({ (text) -> Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: searchText, options:.regularExpression)
            
            return range.location != NSNotFound
        })
        
        if(filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        
        tableview.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive {
            return filtered.count
        }
        else{
            return files.count
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let fileName = files[indexPath.row]
        let object = DatabaseManager.singleton.readObject(name: fileName)
        
        
        if searchActive
        {
            cell.textLabel?.text = "\(filtered[indexPath.row])"
        }
        else {
            if object != nil {
                cell.textLabel?.text = cellString[indexPath.row]
            }
        }
        cell.detailTextLabel?.text = object?.key
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.searchBar.endEditing(true)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let fileName = files[indexPath.row]
        if DatabaseManager.singleton.removeFile(fileName: fileName) {
            files = DatabaseManager.singleton.getSurveyFileList()
            tableview.reloadData()
        }
    }
}
