//
//  ViewController.swift
//  VCLifecycle
//
//  Created by Marcelo Reina on 17/04/17.
//  Copyright © 2017 Instituto de Pesquisas Eldorado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var blueView: UIView!
    

    //MARK: View Controller Lifecycle - Initialization methods
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("# init?(coder aDecoder: NSCoder)\n button: \(button)\n redView: \(redView)\n blueView: \(blueView)\n")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("# awakeFromNib()\n \(self)")
    }
    
    //MARK: View Controller Lifecycle - Load methods
    override func viewDidLoad() {
        super.viewDidLoad()
        print("# viewDidLoad()\n \(self)")
    }

    //MARK: View Controller Lifecycle - Display methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("# viewWillAppear(_ animated: Bool)\n \(self)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("# viewDidAppear(_ animated: Bool)\n \(self)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("# viewWillDisappear(_ animated: Bool)\n \(self)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("# viewDidDisappear(_ animated: Bool)\n \(self)")
    }
    
    //MARK: View Controller Lifecycle - Memory Management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning()")
    }
    
    //MARK: View Controller Lifecycle - Diagram
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("# viewWillLayoutSubviews()\n \(self)")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("# viewDidLayoutSubviews()\n \(self)")
    }
    
    //MARK: View Controller Lifecycle - Rotation
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator);
        print("# viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)\n \(self)")
    }
    

    //MARK: Helper
    override var description: String {
        var fullDescription = "ViewController Description\n"
        
        fullDescription.append(" view: \(view.frame)\n")
        fullDescription.append(" button: \(button.frame)\n")
        fullDescription.append(" redView: \(redView.frame)\n")
        fullDescription.append(" blueView: \(blueView.frame)\n")
        
        fullDescription.append("-#\n")
        return fullDescription
    }
}

