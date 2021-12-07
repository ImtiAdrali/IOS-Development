//
//  ViewController.swift
//  LanguageProducer
//
//  Created by user201504 on 10/15/21.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
   

    
    @IBOutlet weak var MyView: UIView!
    @IBOutlet weak var LanguageImage: UIImageView!
    @IBOutlet weak var LanguageName: UILabel!
    @IBOutlet weak var MyView1: UIView!
    @IBOutlet weak var LangDescription: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var LangPopluarity: UILabel!
    @IBOutlet weak var LangSalary: UILabel!
    
    var mySound:AVAudioPlayer!
    
    

    var LanguageClassObject = [LanguageClass]()
    var passedLanguageClass:LanguageClass = LanguageClass()
    
    
    @IBAction func btnNextLang(_ sender: Any) {
        setLables()
        
    }
    
    @IBAction func btnVisitSite(_ sender: Any) {
        let app = UIApplication.shared
        let LanguageSite = URL(string: passedLanguageClass.site)
        app.open(LanguageSite!)
    }
        
    @IBAction func btnToSecondVeiw(_ sender: Any) {
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "second_vc") as? SecondViewController else {
            return
        }
        present(secondVC, animated: true)
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        LanguageImage.alpha = 0.0
        LanguageName.alpha = 0.0
       
        LangDescription.alpha = 0.0
        btn1.alpha = 0.0
        btn2.alpha = 0.0
        LangPopluarity.alpha = 0.0
        LangSalary.alpha = 0.0
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        UIView.animate(withDuration: 5.0, animations: {
            
            self.LanguageImage.alpha = 1.0
            self.LanguageName.alpha = 1.0
            
            self.LangDescription.alpha = 1.0
            self.btn1.alpha = 1.0
            self.btn2.alpha = 1.0
            self.LangPopluarity.alpha = 1.0
            self.LangSalary.alpha = 1.0
            
        })
        setLables()
    }
    
    
    var randomGlobalObject:LanguageClass = LanguageClass()
    func setLables() {
        //let randomLanguage = LanguageClassObject.randomElement()
        let randomLanguage = passedLanguageClass
        //randomGlobalObject = randomLanguage
        LanguageName.text = randomLanguage.name
        LangDescription.text = randomLanguage.description
        LangPopluarity.text = randomLanguage.popularity
        LangSalary.text = randomLanguage.salary
        
        let imgName = randomLanguage.image
        LanguageImage.image = convertToImage(imgURL: imgName)
        
        
        
        self.MyView.layer.shadowColor = UIColor.black.cgColor
        self.MyView.layer.shadowOpacity = 1
        self.MyView.layer.shadowOffset = .zero
        self.MyView.layer.shadowRadius = 10
        self.MyView.layer.cornerRadius = 10
        
        self.MyView1.layer.shadowColor = UIColor.black.cgColor
        self.MyView1.layer.shadowOpacity = 1
        self.MyView1.layer.shadowOffset = .zero
        self.MyView1.layer.shadowRadius = 10
        self.MyView1.layer.cornerRadius = 10
        
        mySound.play()
    }
    
    func convertToImage(imgURL:String) -> UIImage {
        let imgURL2 = URL(string:imgURL)!
        let imgData = try? Data(contentsOf: imgURL2)
        print(imgData ?? "Error. Image doesnt exits at URL \(imgURL)")
        let img = UIImage(data: imgData!)
        return img!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mySound = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "bam", ofType: "wav")!))
        //addToLanguageArray()
        setLables()
        
        
    }
}


