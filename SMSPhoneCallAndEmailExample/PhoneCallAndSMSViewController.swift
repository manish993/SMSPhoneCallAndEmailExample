//
//  ViewController.swift
//  SMSPhoneCallAndEmailExample
//
//  Created by moxDroid on 2018-03-05.
//  Copyright © 2018 moxDroid. All rights reserved.
//

import UIKit
import MessageUI

class EmailViewController: UIViewController, MFMailComposeViewControllerDelegate {
     @IBOutlet var subject: UITextField!
    @IBOutlet var body: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print( NSLocalizedString("STR_SUBJECT", comment: ""))
    }
    
    //Send SMS
    @IBAction func sendMail(sender: UIButton) {
        
        if MFMailComposeViewController.canSendmail() {
            
        
           let picker = MFMailComposeViewController()
            picker.mailComposeDelegate = self
            picker.setToRecipients(["jyothithomas.05@gmail.com"])
            picker.setSubject(subject.text!)
            picker.setMessageBody(body.text!, isHTML: true)
            
            present(picker, animated: true, completion: nil)
        }else{
            print("NO Email Client exist")
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult)
    {
        
       dismiss(animated: true, completion: nil) 
    }
    
   
    
}

