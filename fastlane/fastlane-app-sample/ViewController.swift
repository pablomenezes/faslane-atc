//
//  ViewController.swift
//  fastlane
//
//  Created by Fernando Ribeiro on 4/16/16.
//  Copyright © 2016 poisonlabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginUser(sender: AnyObject) {
        if (self.email.text!.isEmpty || self.password.text!.isEmpty) {
            let alertController = UIAlertController.init(title: "Erro",
                                                         message: "Você deve preencher email e senha para efetuar o login",
                                                         preferredStyle: .Alert)
            
            let okAction = UIAlertAction.init(title: "ok", style: .Default, handler: nil)
            
            alertController.addAction(okAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }else{
            if User.validatesUserLogin(self.email.text, password: self.password.text) {
                self.performSegueWithIdentifier("loginSuccessSegue", sender: nil)
            }else{
                let alertController = UIAlertController.init(title: "Erro",
                                                             message: "Usuário ou senha invalidos",
                                                             preferredStyle: .Alert)
                
                let okAction = UIAlertAction.init(title: "ok", style: .Default, handler: nil)
                
                alertController.addAction(okAction)
                
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
    }

}

