//
//  MasterViewController.swift
//  LanguageProducer
//
//  Created by user201504 on 11/22/21.
//

import Foundation
import UIKit

class MasterViewController: UITableViewController {
    
    var LanguageClassObject = [LanguageClass]()
    
    
    //utility function that takes an Image and return a UIImage object
    func convertToImage(imgURL:String) -> UIImage {
        let imgURL2 = URL(string:imgURL)!
        
        //Reach out to the URL and download bytes of data
        let imgData = try? Data(contentsOf: imgURL2)
        print(imgData ?? "Error. Image doesnt exist at URL \(imgURL)")
        
        let img = UIImage(data: imgData!)
        
        return img!
    }
    
    
    func populateFromJSON() {
        // get the end point
        let endPoint =  "https://raw.githubusercontent.com/ImtiAdrali/IOS-Development/main/languages.json"
        let jSONURL = URL(string: endPoint)!
        // get the data
        let responseData = try? Data(contentsOf: jSONURL)
        print(responseData ?? "Error! No data to print. responseData is nil" )
        print(responseData)
        // convert JSON to Dictionary
        if (responseData != nil) {
            let dictionary:NSDictionary = (try! JSONSerialization.jsonObject(with: responseData!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
            
            print(dictionary)
            
            let LangDictionary = dictionary["ProgrammingLanguages"]! as! [[String:AnyObject]]
            
            for index in 0...LangDictionary.count - 1 {
                let singleLang = LangDictionary[index]
                let Lang = LanguageClass()
                Lang.name = singleLang["LanguageName"]! as! String
                Lang.description = singleLang["LanguageDescription"]! as! String
                Lang.image = singleLang["LanguageImage"]! as! String
                Lang.popularity = singleLang["LanguagePopularity"]! as! String
                Lang.site = singleLang["LanguageSite"]! as! String
                Lang.salary = singleLang["LanguageSalary"]! as! String
                LanguageClassObject.append(Lang)
            }
        
        }
        // convert Dictionary to Array
    }
    

    
    
    		
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateFromJSON()
        
        tableView.estimatedRowHeight = 130.0
        tableView.tableFooterView = UIView()
        tableView.separatorInset.left = 50
        
        self.tableView.rowHeight = 50.0
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetail") {
            //find destination controller
            let destController = segue.destination as! ViewController
        
            //find the selected table row (index)
            let indexPath = tableView.indexPathForSelectedRow!
            
            //Find the selected object index in the array and retrieve the objevt form the array
            let languageObject = LanguageClassObject[indexPath.row]
            
            //pass the selected object to the destinatin controler
            destController.passedLanguageClass = languageObject
        }
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LanguageClassObject.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let languageObject = LanguageClassObject[indexPath.row]
        let languageName = languageObject.name
        let languagepopularity = languageObject.popularity
        let languageImageUrl = languageObject.image
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "CellName", for: indexPath)
        cell.textLabel?.text = languageName
        cell.detailTextLabel?.text = languagepopularity
        
        
        let img = convertToImage(imgURL: languageImageUrl)
        
        cell.imageView?.image = img
        cell.imageView?.layer.cornerRadius = 2
        cell.imageView?.clipsToBounds = true
        cell.imageView?.layer.borderWidth = 2
        cell.imageView?.layer.borderColor = UIColor.lightGray.cgColor
    
        return cell
    }
    
}
