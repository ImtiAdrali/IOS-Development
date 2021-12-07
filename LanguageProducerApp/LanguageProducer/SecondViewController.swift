//
//  SecondViewController.swift
//  LanguageProducer
//
//  Created by user201504 on 10/16/21.
//

import UIKit
import SwiftUI

class SecondViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDisclaimer: UILabel!
    @IBOutlet weak var textFieldFavLan: UITextField!
    @IBOutlet weak var btnFavLangAction: UIButton!
    @IBOutlet weak var lblOutPutArray: UILabel!
    @IBOutlet weak var lblFavHeading: UILabel!
    
    
    var languages: [String] = []
    
            
    @IBAction func btnSubmit(_ sender: UIButton) {
        //let mText = textFieldFavLan.text
        //lblOutPutArray.text = mText
        if let input = textFieldFavLan.text, input.isEmpty == false {
            languages.append(input)
        }
        
        textFieldFavLan.text = nil
        
        
    }
    
    @IBAction func btnAppend(_ sender: Any) {
        lblOutPutArray.text = languages.joined(separator: "\n")
        
    }
    
    

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblFavHeading.text = "Your Favorite Languages"
        lblTitle.text = "Desclaimer"
        lblDisclaimer.text = "This App is developed as an educational project. Certain materials are included under the fair use guidlines and are restricted from further use.\n\n\n"
        
        
    
    }
    

    

}
