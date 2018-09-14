//
//  ViewController.swift
//  WhereIsWallien
//
//  Created by Gustavo Lima on 26/04/2017.
//  Copyright © 2017 Instituto de Pesquisas Eldorado. All rights reserved.
//

import UIKit

class WallienPlayerViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var playerName: UITextField!
    
    @IBOutlet weak var inserNameAlert: UILabel!
    
    @IBOutlet weak var theScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inserNameAlert.isHidden = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShow(notification:NSNotification){
        //give room at the bottom of the scroll view, so it doesn't cover up anything the user needs to tap
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.theScrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.theScrollView.contentInset = contentInset
    }
    
    func keyboardWillHide(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.theScrollView.contentInset = contentInset
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if playerName.text == ""{
            inserNameAlert.isHidden = false
    playerName.shake()
    return false
        }
        return true
    }
}

