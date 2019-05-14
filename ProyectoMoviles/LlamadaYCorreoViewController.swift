//
//  LlamadaYCorreoViewController.swift
//  ProyectoMoviles
//
//  Created by Alister Estrada Cueto on 5/14/19.
//  Copyright © 2019 Alister Estrada Cueto. All rights reserved.
//

import UIKit
import MessageUI

class LlamadaYCorreoViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func HacerLlamda(_ sender: Any) {
        
        
        var url:NSURL = NSURL(string: "tel://015554832020")!
        UIApplication.shared.openURL(url as URL)
    }
    
    @IBAction func MandarCorreo(_ sender: Any) { let mailComposeViewController = configureMailController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            showMailError()
        }
    }
    
    func configureMailController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["andrew@seemuapps.com", "jose.molina@itesm.mx"])
        mailComposerVC.setSubject("Cedetec")
        mailComposerVC.setMessageBody("Hola buenas tardes,\nMe gustaría apartar el laboratio de cedetec para el dia de mañana.\nSaludos ", isHTML: false)
        
        return mailComposerVC
    }
    
    func showMailError() {
        let sendMailErrorAlert = UIAlertController(title: "Could not send email", message: "Your device could not send email", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
