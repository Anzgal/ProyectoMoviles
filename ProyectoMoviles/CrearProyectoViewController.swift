//
//  CrearProyectoViewController.swift
//  ProyectoMoviles
//
//  Created by Alister Estrada Cueto on 3/21/19.
//  Copyright © 2019 Alister Estrada Cueto. All rights reserved.
//

import UIKit
import EventKit
import UserNotifications

class CrearProyectoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nombreProyecto: UITextField!
    
    @IBOutlet weak var inicio: UIDatePicker!
    
    @IBOutlet weak var actividades: UITextField!
    
    @IBOutlet weak var fin: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
        
        self.actividades.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ actividades: UITextField) -> Bool{
        
        actividades.resignFirstResponder()
        return(true)
    }
    
    
    @IBAction func CrearEvento(_ sender: UIButton) {
    
        
        let content = UNMutableNotificationContent()
        content.title = self.nombreProyecto.text!
        content.subtitle = self.actividades.text!
        content.body = self.actividades.text!
        content.badge = 1
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: "PROYECTO CREADO", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        let eventStore:EKEventStore = EKEventStore()
        eventStore.requestAccess(to: .event) { (granted ,error) in
            
            if(granted) && (error == nil){
                
                print("granted \(granted)")
                print("error \(error)")
                
                let event:EKEvent = EKEvent(eventStore: eventStore)
                event.title = self.nombreProyecto.text
                event.startDate = self.inicio.date
                event.endDate = self.fin.date
                event.notes = self.actividades.text
                event.calendar = eventStore.defaultCalendarForNewEvents
                
                do{
                    try eventStore.save(event, span: .thisEvent)
                }catch let error as NSError{
                    
                    print("error : \(error)")
                }
                print ("Save Event")
                
                
                
                
            }else{
                print("error : \(error)")
                
            }
            
            
        }
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
