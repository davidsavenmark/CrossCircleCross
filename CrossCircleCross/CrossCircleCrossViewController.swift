//
//  ViewController.swift
//  CrossCircleCross
//
//  Created by David Sävenmark on 2020-12-26.
//  Copyright © 2020 David Sävenmark. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class CrossCircleCrossViewController: UIViewController {
    
    let serviceType = "ds-tictactoe"
    
    var crossCircleCross = CrossCircleCross()
    
    private var peerID: MCPeerID!
    private var session: MCSession!
    private var nearbyServiceAdvertiser: MCNearbyServiceAdvertiser!

    @IBOutlet weak var boardView: BoardView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boardView.crossCircleCrossDelegate = self
        
        peerID = MCPeerID(displayName: UIDevice.current.name)
        session = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        session.delegate = self
    
        
    }
  

    @IBAction func advertise(_ sender: Any) {
        let nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: serviceType )
        nearbyServiceAdvertiser.delegate = self
        nearbyServiceAdvertiser.startAdvertisingPeer()
    }
    
    
    @IBAction func dropAt(_ sender: UITapGestureRecognizer) {
        let finger = sender.location(in: boardView)
        let col: Int = Int(finger.x / (boardView.bounds.width/3))
        let row: Int = 2 - Int(finger.y / (boardView.bounds.height/3))
        crossCircleCross.dropAt(col: col, row: row)
        print(crossCircleCross)
        boardView.setNeedsDisplay()
        
        
       
        
        
    }
    
    @IBAction func invite(_ sender: Any) {
        
        let browser = MCBrowserViewController(serviceType: serviceType, session: session)
        browser.delegate = self
        present(browser, animated: true, completion: nil)
        
    }
    
    
}
    
extension CrossCircleCrossViewController: CrossCircleCrossDelegate {
    func pieceAt(col: Int, row: Int) -> Piece? {
        return crossCircleCross.pieceAt(col: col, row: row)
    }
}

extension CrossCircleCrossViewController: MCNearbyServiceAdvertiserDelegate{
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        invitationHandler(true, session)
    }
    
    
}

extension CrossCircleCrossViewController: MCBrowserViewControllerDelegate{
func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
    dismiss(animated: true)
}

func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
    dismiss(animated: true)
}
   
}

extension CrossCircleCrossViewController: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
    

}
