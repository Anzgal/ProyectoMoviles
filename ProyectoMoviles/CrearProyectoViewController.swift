//
//  CrearProyectoViewController.swift
//  ProyectoMoviles
//
//  Created by Alister Estrada Cueto on 3/21/19.
//  Copyright © 2019 Alister Estrada Cueto. All rights reserved.
//

import UIKit
import EventKit

class CrearProyectoViewController: UIViewController {
    
    @IBOutlet weak var nombreProyecto: UITextField!
    
    @IBOutlet weak var inicio: UIDatePicker!
    

    @IBOutlet weak var fin: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func CrearEvento(_ sender: UIButton) {
        
        let eventStore:EKEventStore = EKEventStore()
        eventStore.requestAccess(to: .event) { (granted ,error) in
            
            if(granted) && (error == nil){
                
                print("granted \(granted)")
                print("error \(error)")
                
                let event:EKEvent = EKEvent(eventStore: eventStore)
                event.title = self.nombreProyecto.text
                event.startDate = self.inicio.date
                event.endDate = self.fin.date
                event.notes = "Notita"
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
