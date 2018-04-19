//
//  noAccountARViewController.swift
//  rular
//
//  Created by Joshua Barrios on 4/14/18.
//  Copyright © 2018 Joshua Barrios. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class noAccountARViewController: UIViewController, ARSCNViewDelegate {
    
    

    @IBOutlet weak var sceneView: ARSCNView!
    
    @IBOutlet weak var measurements: UILabel!
    
    var dotNodes = [SCNNode]()
    var textNode = SCNNode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
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
    //after your second touch this removes the dots to allow new measurements
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if dotNodes.count >= 2{
            for dot in dotNodes{
                dot.removeFromParentNode()
            }
            
            //new empty array
            dotNodes = [SCNNode]()
        }
        if let touchLoc = touches.first?.location(in: sceneView){
            let hitTestResult = sceneView.hitTest(touchLoc, types: .featurePoint)
            
            if let hitResult = hitTestResult.first {
                addDot(at: hitResult)
            }
        }
    }
    func addDot(at hitResult : ARHitTestResult){
        let dotGeometry = SCNSphere(radius: 0.005)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.blue
        
        dotGeometry.materials = [material]
        let dotNode = SCNNode(geometry: dotGeometry)
        
        dotNode.position = SCNVector3(hitResult.worldTransform.columns.3.x, hitResult.worldTransform.columns.3.y, hitResult.worldTransform.columns.3.z)
        
        sceneView.scene.rootNode.addChildNode(dotNode)
        
        dotNodes.append(dotNode)
        if dotNodes.count >= 2 {
            calculate()
        }
    }
    func calculate(){
        //adding nodes to display
        let start = dotNodes[0]
        let end = dotNodes[1]
        
        let a = end.position.x - start.position.x
        let b = end.position.y - start.position.y
        let c = end.position.z - start.position.z
        
        let distance = (sqrt(pow(a, 2) + pow(b, 2) + pow(c, 2))/2.54) * 100
        updateText(text:"\(abs(distance)) inches", atPosition: end.position)
        measurements.text="\(abs(distance)) inches"
    }
    func updateText(text: String, atPosition: SCNVector3){
        textNode.removeFromParentNode()
        
        let textGeometry = SCNText(string: text, extrusionDepth: 1.0)
        textGeometry.firstMaterial?.diffuse.contents = UIColor.blue
        
        textNode = SCNNode(geometry: textGeometry)
        textNode.position = SCNVector3(atPosition.x, atPosition.y, atPosition.z)
        textNode.scale = SCNVector3(0.01, 0.01, 0.01)
        
        sceneView.scene.rootNode.addChildNode(textNode)
        
    }
}



