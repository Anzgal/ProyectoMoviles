//
//  ViewController.swift
//  ProyectoMoviles
//
//  Created by Alister Estrada Cueto and Martín Anzures on 3/19/19.
// Huevos profe 2 y MArtin
//  Copyright © 2019 Alister Estrada Cueto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }


}

