//
//  ContentPriorityViewController.swift
//  AutoLayoutPractice
//
//  Created by SERGIO J RAFAEL ORDINE on 06/04/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

class ContentPriorityViewController: UIViewController {
    
    var names = ["Guinea Pig","Meerschweinchen"]
    var languages = ["English","German"]
    
    var imageResists = true
    var isEnglish = true
    
    let HighPriority:Float = 750
    let LowPriority:Float = 700

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    
    @IBOutlet weak var selectedLanguage: UILabel!
    @IBOutlet weak var selectedPriority: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presentLanguage()
        setPriority()
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = profileImage.bounds.width / 2.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func changeLanguage(_ sender: Any) {
        
        setLanguage()
        
    }
    
    @IBAction func changePriority(_ sender: Any) {
        
        setPriority()
    }


    private func setLanguage() {
        
        isEnglish = !isEnglish
        

        presentLanguage()
    }
    
    
    private func setPriority() {
        
        imageResists = !imageResists
        
        var imagePriority = HighPriority
        var textPriority = LowPriority
        
        if (!imageResists) {
            imagePriority = LowPriority
            textPriority = HighPriority
        }
        
        profileImage.setContentCompressionResistancePriority(imagePriority, for: .horizontal)
        profileImage.setContentCompressionResistancePriority(imagePriority, for: .vertical)
        
        profileName.setContentCompressionResistancePriority(textPriority, for: .horizontal)
        profileName.setContentCompressionResistancePriority(textPriority, for: .vertical)
        
        presentPriority()
        
    }
    
    
    private func presentLanguage() {
        if (isEnglish) {
            
            selectedLanguage.text = "English"
            profileName.text = "Guinea Pig"
            
        } else {
            
            selectedLanguage.text = "German"
            profileName.text = "Meerschweinchen"
        }
    }
    
    
    private func presentPriority() {
        
        selectedPriority.text = imageResists ? "Image" : "Text"
        
    }
    
}
