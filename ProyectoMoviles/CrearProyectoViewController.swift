//
//  CrearProyectoViewController.swift
//  ProyectoMoviles
//
//  Created by Alister Estrada Cueto on 3/21/19.
//  Copyright © 2019 Alister Estrada Cueto. All rights reserved.
//

import UIKit
import EventKit

class CrearProyectoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }
    

    @IBOutlet weak var pickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    let colors = ["Laboratorio 101","Laboratorio 102","Laboratorio 103","Laboratorio 104"]
    
    @IBAction func CrearEvento(_ sender: UIButton) {
        
        let eventStore:EKEventStore = EKEventStore()
        eventStore.requestAccess(to: .event) { (granted , error) in
            
            if(granted) && (error == nil){
                
                print("granted \(granted)")
                print("error \(error)")
                
                let event:EKEvent = EKEvent(eventStore: eventStore)
                event.title = "Pruebita del calendarito"
                event.startDate = Date()
                event.endDate = Date()
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
