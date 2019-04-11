//
//  ViewController.swift
//  VideoAR
//
//  Created by molina on 28/03/18.
//  Copyright © 2018 Tec de Monterrey. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import AVFoundation

class Videos360ViewController: UIViewController, ARSCNViewDelegate {
    var linkRecibido = ""
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
        registerGestureRecognizer()
    }
    
    private func registerGestureRecognizer()
    {
        let tapGesto = UITapGestureRecognizer(target: self, action: #selector(tapEnPantalla))
        self.sceneView.addGestureRecognizer(tapGesto)
    }
    
    @objc func tapEnPantalla(manejador:UIGestureRecognizer)
    {
        //currentFrame es la imagen actual de la camara
        guard let currentFrame = self.sceneView.session.currentFrame else {return}
        
        //let path = Bundle.main.path(forResource: "video", ofType: "mp4")
        //let url = URL(fileURLWithPath: path!)
        
        let moviePath = "http://all360media.com/wp-content/uploads/pano/laphil/media/video-ios.mp4"
        
        let url = URL(string: moviePath)
        //let player = AVPlayer(url: url)
        //player.volume = 0.5
        //print(player.isMuted)
        
        // crear un nodo capaz de reporducir un video
        let videoNodo = SKVideoNode(url: url!)
        //let videoNodo = SKVideoNode(fileNamed: "video.mp4")
        //let videoNodo = SKVideoNode(avPlayer: player)
        videoNodo.play() //ejecutar play al momento de presentarse
        
        //crear una escena sprite kit, los parametros estan en pixeles
        let spriteKitEscene =  SKScene(size: CGSize(width: 6000, height: 3000))
        
        
        //colocar el videoNodo en el centro de la escena tipo SpriteKit
        videoNodo.position = CGPoint(x: spriteKitEscene.size.width/2, y: spriteKitEscene.size.height/2)
        videoNodo.size = spriteKitEscene.size
        spriteKitEscene.addChild(videoNodo)
        
        //__________
        let esfera = SCNSphere(radius: 20.0)
        let materialTierra = SCNMaterial()
        materialTierra.diffuse.contents = spriteKitEscene//UIImage(named:"307Gear.JPG")
        materialTierra.isDoubleSided = true
        
        var transform = SCNMatrix4MakeRotation(Float.pi, 0.0, 0.0, 1.0)
        transform = SCNMatrix4Translate(transform, 1.0, 1.0, 0)
        materialTierra.diffuse.contentsTransform = transform
        let tierra = SCNNode()
        tierra.geometry = esfera
        tierra.geometry?.materials = [materialTierra]
        
        tierra.position = SCNVector3(x:0, y:0, z:0)
        //scene.rootNode.addChildNode(tierra)
        
        //________
        
        
        
        
        
        //crear una pantalla 4/3, los parametros son metros
        //let pantalla = SCNPlane(width: 1.0, height: 0.75)
        
        //pantalla.firstMaterial?.diffuse.contents = UIColor.blue
        //modificar el material del plano
        //pantalla.firstMaterial?.diffuse.contents = spriteKitEscene
        //permitir ver el video por ambos lados
        //pantalla.firstMaterial?.isDoubleSided = true
        
        //let pantallaPlanaNodo = SCNNode(geometry: pantalla)
        //identificar en donde se ha tocado el currentFrame
        var traduccion = matrix_identity_float4x4
        //definir un metro alejado del dispositivo
        traduccion.columns.3.z = -1.0
        //pantallaPlanaNodo.simdTransform = matrix_multiply(currentFrame.camera.transform, traduccion)
        
        //pantallaPlanaNodo.eulerAngles = SCNVector3(Double.pi, 0, 0)
        self.sceneView.scene.rootNode.addChildNode(tierra)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    // MARK: - ARSCNViewDelegate
    
    /*
     // Override to create and configure nodes for anchors added to the view's session.
     func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
     let node = SCNNode()
     
     return node
     }
     */
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}

