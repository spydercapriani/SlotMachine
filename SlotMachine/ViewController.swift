//
//  ViewController.swift
//  SlotMachine
//
//  Created by Daniel Gilbert on 9/23/14.
//  Copyright (c) 2014 Daniel Gilbert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Containers
    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!
    
    // Information Labels
    var lblCredits:UILabel!
    var lblBet:UILabel!
    var lblWinnings:UILabel!
    
    var lblTitleCredits:UILabel!
    var lblTitleBets:UILabel!
    var lblTitleWinnings:UILabel!
    
    // Buttons
    var btnReset:UIButton!
    var btnBetOne:UIButton!
    var btnBetMax:UIButton!
    var btnSpin:UIButton!
    
    // Top Container
    var lblTitle:UILabel!
    
    // Constants
    let kMarginForView:CGFloat = 10.0
    let kMarginForSlot:CGFloat = 2.0
    
    let kSixth:CGFloat = 1.0/6.0
    let kThird:CGFloat = 1.0/3.0
    let kHalf:CGFloat = 1.0/2.0
    let kEighth:CGFloat = 1.0/8.0
    
    let kColumns = 3 // # of Containers
    let kRows = 3 // # of Slots
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupContainerViews()
        setupFirstContainer(firstContainer)
        setupSecondContainer(secondContainer)
        setupThirdContainer(thirdContainer)
        setupFourthContainer(fourthContainer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // IBActions
    
    func resetButtonPressed (button: UIButton) {
        println("Reset Button Pressed")
    }
    
    func betOneButtonPressed (button: UIButton) {
        println("Bet One Button Pressed")
    }
    
    func betMaxButtonPressed (button: UIButton) {
        println("Bet Max Button Pressed")
    }
    
    func spinButtonPressed (button: UIButton) {
        println("Spin Button Pressed")
    }
    
    func setupContainerViews() {
        self.firstContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + kMarginForView, self.view.bounds.origin.y, self.view.bounds.width - (kMarginForView * 2), self.view.bounds.height * kSixth))
        self.firstContainer.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.firstContainer)
        
        self.secondContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + kMarginForView, firstContainer.frame.height, self.view.bounds.width - (kMarginForView * 2), self.view.bounds.height * (3 * kSixth)))
        self.secondContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.secondContainer)
        
        self.thirdContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + kMarginForView, firstContainer.frame.height + secondContainer.frame.height, self.view.bounds.width - (kMarginForView * 2), self.view.bounds.height * kSixth))
        self.thirdContainer.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(self.thirdContainer)
        
        self.fourthContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + kMarginForView, firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height, self.view.bounds.width - (kMarginForView * 2), self.view.bounds.height * kSixth))
        self.fourthContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.fourthContainer)
    }
    
    func setupFirstContainer(containerView:UIView) {
        lblTitle = UILabel()
        lblTitle.text = "Super Slots"
        lblTitle.textColor = UIColor.yellowColor()
        lblTitle.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        lblTitle.sizeToFit()
        lblTitle.center = containerView.center
        containerView.addSubview(lblTitle)
    }
    
    func setupSecondContainer(containerView:UIView) {
        for var containerNumber = 0; containerNumber < kColumns; containerNumber++ {
            for var slotNumber = 0; slotNumber < kRows; slotNumber++ {
                var slotImageView = UIImageView()
                slotImageView.backgroundColor = UIColor.yellowColor()
                slotImageView.frame = CGRectMake(containerView.bounds.origin.x + (containerView.bounds.size.width * (CGFloat(containerNumber) * kThird)), containerView.bounds.origin.y + (containerView.bounds.size.height * (CGFloat(slotNumber) * kThird)), containerView.bounds.width * kThird - kMarginForSlot, containerView.bounds.height * kThird - kMarginForSlot)
                containerView.addSubview(slotImageView)
            }
        }
    }
    
    func setupThirdContainer(containerView:UIView) {
        lblCredits = UILabel()
        lblCredits.text = "000000"
        lblCredits.textColor = UIColor.redColor()
        lblCredits.font = UIFont(name: "Menlo-Bold", size: 16)
        lblCredits.sizeToFit()
        lblCredits.center = CGPointMake(containerView.frame.width * kSixth, containerView.frame.height * kThird)
        lblCredits.textAlignment = NSTextAlignment.Center
        lblCredits.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(lblCredits)
        
        lblBet = UILabel()
        lblBet.text = "0000"
        lblBet.textColor = UIColor.redColor()
        lblBet.font = UIFont(name: "Menlo-Bold", size: 16)
        lblBet.sizeToFit()
        lblBet.center = CGPointMake(containerView.frame.width * kSixth * 3, containerView.frame.height * kThird)
        lblBet.textAlignment = NSTextAlignment.Center
        lblBet.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(lblBet)
        
        lblWinnings = UILabel()
        lblWinnings.text = "000000"
        lblWinnings.textColor = UIColor.redColor()
        lblWinnings.font = UIFont(name: "Menlo-Bold", size: 16)
        lblWinnings.sizeToFit()
        lblWinnings.center = CGPointMake(containerView.frame.width * kSixth * 5, containerView.frame.height * kThird)
        lblWinnings.textAlignment = NSTextAlignment.Center
        lblWinnings.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(lblWinnings)
        
        lblTitleCredits = UILabel()
        lblTitleCredits.text = "Credits"
        lblTitleCredits.textColor = UIColor.blackColor()
        lblTitleCredits.font = UIFont(name: "AmericanTypewriter", size: 14)
        lblTitleCredits.sizeToFit()
        lblTitleCredits.center = CGPointMake(containerView.frame.width * kSixth, containerView.frame.height * kThird * 2)
        containerView.addSubview(lblTitleCredits)
        
        lblTitleBets = UILabel()
        lblTitleBets.text = "Bet"
        lblTitleBets.textColor = UIColor.blackColor()
        lblTitleBets.font = UIFont(name: "AmericanTypewriter", size: 14)
        lblTitleBets.sizeToFit()
        lblTitleBets.center = CGPointMake(containerView.frame.width * kSixth * 3, containerView.frame.height * kThird * 2)
        containerView.addSubview(lblTitleBets)
        
        lblTitleWinnings = UILabel()
        lblTitleWinnings.text = "Winnings"
        lblTitleWinnings.textColor = UIColor.blackColor()
        lblTitleWinnings.font = UIFont(name: "AmericanTypewriter", size: 14)
        lblTitleWinnings.sizeToFit()
        lblTitleWinnings.center = CGPointMake(containerView.frame.width * kSixth * 5, containerView.frame.height * kThird * 2)
        containerView.addSubview(lblTitleWinnings)
    }
    
    func setupFourthContainer(containerView:UIView) {
        btnReset = UIButton()
        btnReset.setTitle("Reset", forState: UIControlState.Normal)
        btnReset.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        btnReset.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        btnReset.backgroundColor = UIColor.yellowColor()
        btnReset.sizeToFit()
        btnReset.center = CGPointMake(containerView.frame.width * kEighth, containerView.frame.height * kHalf)
        btnReset.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(btnReset)
        
        btnBetOne = UIButton()
        btnBetOne.setTitle("Bet One", forState: UIControlState.Normal)
        btnBetOne.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        btnBetOne.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        btnBetOne.backgroundColor = UIColor.greenColor()
        btnBetOne.sizeToFit()
        btnBetOne.center = CGPointMake(containerView.frame.width * kEighth * 3, containerView.frame.height * kHalf)
        btnBetOne.addTarget(self, action: "betOneButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(btnBetOne)
        
        btnBetMax = UIButton()
        btnBetMax.setTitle("Bet Max", forState: UIControlState.Normal)
        btnBetMax.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        btnBetMax.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        btnBetMax.backgroundColor = UIColor.greenColor()
        btnBetMax.sizeToFit()
        btnBetMax.center = CGPointMake(containerView.frame.width * kEighth * 5, containerView.frame.height * kHalf)
        btnBetMax.addTarget(self, action: "betMaxButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(btnBetMax)
        
        btnSpin = UIButton()
        btnSpin.setTitle("Spin", forState: UIControlState.Normal)
        btnSpin.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        btnSpin.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        btnSpin.backgroundColor = UIColor.redColor()
        btnSpin.sizeToFit()
        btnSpin.center = CGPointMake(containerView.frame.width * kEighth * 7, containerView.frame.height * kHalf)
        btnSpin.addTarget(self, action: "spinButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(btnSpin)
    }

}

