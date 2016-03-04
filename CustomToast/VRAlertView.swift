//
//  VRAlertView.swift
//  VideoReady
//
//  Created by Ashu on 14/04/15.
//  Copyright (c) 2015 Intelligrape. All rights reserved.
//

import UIKit

class VRAlertView: UIView {
    
    let alertFrame = CGRectMake(0.0, 0.0, 300.0, 50.0)          // initial frame of custom alert
    let zeroOrigin : CGFloat = 0.0                              /// origin is 0.0
    let screenWidth = UIScreen.mainScreen().bounds.width        /// width of screen
    let screenHeight = UIScreen.mainScreen().bounds.height      /// height of screen
    let alertShownTime: NSTimeInterval = 2.0
    
    let appDelegateObj = UIApplication.sharedApplication().delegate as! AppDelegate
    var timer: NSTimer!
    
    
    // MARK:- Initialization Methods
    init(message: String) {
        
        super.init(frame: CGRectMake(zeroOrigin, zeroOrigin, screenWidth , screenHeight))

        self.backgroundColor = UIColor.clearColor()
        
        self.addMessageTextField(message)
        self.addTapGesture()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK:- Private Methods
    
    // This method will add message text view on self view and set message on it.
    func addMessageTextField(message: String) {
        
        let messageTextView = UITextView(frame: alertFrame)
        messageTextView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7)
        messageTextView.font = UIFont.systemFontOfSize(14.0)
        messageTextView.textColor = UIColor.whiteColor()
        messageTextView.textAlignment = NSTextAlignment.Center
        messageTextView.text = message
        messageTextView.sizeToFit()
        messageTextView.userInteractionEnabled = false
        messageTextView.center = CGPointMake(self.frame.width/2, self.frame.height/2)
        messageTextView.layer.cornerRadius = 8.0
        
        self.addSubview(messageTextView)
    }
    
    // This method will add tap gesture on self view
    func addTapGesture() {
    
        let tap = UITapGestureRecognizer(target: self, action: "tapActionMethod:")
        self.addGestureRecognizer(tap)
    }
    
    // This method will be called when user taps the alert view and it will remove the alert view from window
    func tapActionMethod(sender: UIGestureRecognizer) {
        
        self.removeAlertFromWindow()
    }
    
    // This method will add alert view as subview on window
    func showAlertOnWindow() {
        
        self.removeAlertFromWindow()
        
        self.center = CGPointMake(screenWidth/2, screenHeight/2)
        appDelegateObj.window?.addSubview(self)
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(alertShownTime, target: self, selector: "removeAlertFromWindow", userInfo: nil, repeats: false)
    }
    
    // This method will remove alert view from window
    func removeAlertFromWindow() {
        
        let viewsArray = appDelegateObj.window!.subviews
        
        for view in viewsArray {
            
            if view.isKindOfClass(VRAlertView) {
                
                view.removeFromSuperview()
                self.timer.invalidate()
            }
        }
    }
    
}
