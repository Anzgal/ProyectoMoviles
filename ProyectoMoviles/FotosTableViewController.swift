//
//  FotosTableViewController.swift
//  ProyectoMoviles
//
//  Created by Martin Anzures on 4/11/19.
//  Copyright © 2019 Alister Estrada Cueto. All rights reserved.
//

import UIKit

class FotosTableViewController: UITableViewController  {
    
    var tableArray = [String] ()
    var textoFila:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
        
        print(self.tableArray)
        
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension FotosTableViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        
        cell.textLabel?.text = self.tableArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.tableArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.tableArray[indexPath.row])
       /*
        textoFila = self.tableArray[indexPath.row]

        tableView.deselectRow(at: indexPath, animated: true)
        */
        /*
        performSegue(withIdentifier: "showImage", sender: indexPath)
        */
        
        let cell = tableView.cellForRow(at: indexPath) as! UITableViewCell
        let labelContent = cell.textLabel!.text
        textoFila = labelContent!
        //get the text from a textLabel
        
    }
    
    /*override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            // delete item at indexPath
            self.tableArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            print(self.tableArray)
        }
        
        let share = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath) in
            // share item at indexPath
            print("I want to share: \(self.tableArray[indexPath.row])")
        }
        
        share.backgroundColor = UIColor.lightGray
        
        return [delete, share]
        
    }*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let siguiente = segue.destination as! PanonoViewController
        //let prueba = textoFila
        //siguiente.linkRecibido = self.tableArray[IndexPath.row]
        siguiente.linkRecibido = "http://martinmolina.com.mx/201911/imagesCDT/101Panono%20-%20Cabina%20de%20control.jpg"
        
        print("El textoFila es: " + textoFila)
        
        /*
        if segue.identifier == "showImage" {
            
            let siguiente = segue.destination as! PanonoViewController
            let indexPath = sender as! IndexPath
            siguiente.linkRecibido = sections[indexPath.section].items[indexPath.row]
        }*/
    }
    
    
    
}
