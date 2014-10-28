//
//  KeyboardViewController.swift
//  CustomKeyboard
//
//  Created by Luke Wilkinson on 2014/10/22.
//  Copyright (c) 2014 OddDog. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController
{

    @IBOutlet var nextKeyboardButton: UIButton!
    
    var allButtons = [UIButton]()

    override func updateViewConstraints()
    {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let buttonTitles1 = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"]
        let buttonTitles2 = ["A", "S", "D", "F", "G", "H", "J", "K", "L"]
        let buttonTitles3 = ["⬆︎", "Z", "X", "C", "V", "B", "N", "M", "⬅︎"]
        let buttonTitles4 = ["123","🌐","⎯", "Return"]
        //⚒
        var row1 = createRowOfButtons(buttonTitles1)
        var row2 = createRowOfButtons(buttonTitles2)
        var row3 = createRowOfButtons(buttonTitles3)
        var row4 = createRowOfButtons(buttonTitles4)
        
        self.view.addSubview(row1)
        self.view.addSubview(row2)
        self.view.addSubview(row3)
        self.view.addSubview(row4)
        
        row1.setTranslatesAutoresizingMaskIntoConstraints(false)
        row2.setTranslatesAutoresizingMaskIntoConstraints(false)
        row3.setTranslatesAutoresizingMaskIntoConstraints(false)
        row4.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        addConstraintsToInputView(self.view, rowViews: [row1, row2, row3, row4])
        
        applyCurrentTheme()
        
        let buttonsNum1FirstRow = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
        let buttonsNum2FirstRow = ["-", "/", ":", ";", "(", ")", "$", "&", "@", "\""]
        let buttonsNum3FirstRow = ["#+=", ".", ",", "?", "!", "'", "7", "⬅︎"]
        let buttonsNum4FirstRow = ["ABC","⎯","Return"]
        
       //define rows as class variable instead of function variable
        
        var Srow1:UIView!
        var Srow2:UIView!
        var Srow3:UIView!
        var Srow4:UIView!
        var Srow1Num:UIView!
        
        //Hide it like below:
        func didTapChangeToNumbersButton(sender: AnyObject?)
        {
            Srow1.hidden = true
            
            Srow1Num.hidden = false
            
        }
    }
    
    func createRowOfButtons(buttonTitles: [NSString]) -> UIView
    {
        
        var buttons = [UIButton]()
        var keyboardRowView = UIView(frame: CGRectMake(0, 0, 320, 50))
        
        for buttonTitle in buttonTitles{
            
            let button = createButtonWithTitle(buttonTitle)
            buttons.append(button)
            keyboardRowView.addSubview(button)
        }
        
        allButtons += buttons
        addIndividualButtonConstraints(buttons, mainView: keyboardRowView)
        
        return keyboardRowView
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput)
    {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput)
    {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark
        {
            textColor = UIColor.whiteColor()
        }
        
        else
        {
            textColor = UIColor.blackColor()
        }
    }
    
    
    
    func createButtonWithTitle(title: String) -> UIButton
    {
        
        let button = UIButton.buttonWithType(.System) as UIButton
        button.frame = CGRectMake(0, 0, 20, 20)
        button.setTitle(title, forState: .Normal)
        button.sizeToFit()
        button.titleLabel?.font = UIFont.systemFontOfSize(10)
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        button.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        button.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        
        button.addTarget(self, action: "didTapButton:", forControlEvents: .TouchUpInside)
        
        return button
    }
    
    func didTapButton(sender: AnyObject?)
    {
        
        let button = sender as UIButton
        var proxy = textDocumentProxy as UITextDocumentProxy
        
        if let title = button.titleForState(.Normal)
        {
            switch title
            {
                
            case "⬅︎" :
                proxy.deleteBackward()
            case "Return" :
                proxy.insertText("\n")
            case "⬆︎" :
                proxy.autocapitalizationType!
            case "⎯" :
                proxy.insertText(" ")
            case "🌐" :
                self.advanceToNextInputMode()
            case "A" :
                proxy.insertText("a")
            case "B" :
                proxy.insertText("b")
            case "C" :
                proxy.insertText("c")
            case "D" :
                proxy.insertText("d")
            case "E" :
                proxy.insertText("e")
            case "F" :
                proxy.insertText("f")
            case "G" :
                proxy.insertText("g")
            case "H" :
                proxy.insertText("h")
            case "I" :
                proxy.insertText("i")
            case "J" :
                proxy.insertText("j")
            case "K" :
                proxy.insertText("k")
            case "L" :
                proxy.insertText("l")
            case "M" :
                proxy.insertText("m")
            case "N" :
                proxy.insertText("n")
            case "O" :
                proxy.insertText("o")
            case "P" :
                proxy.insertText("p")
            case "Q" :
                proxy.insertText("q")
            case "R" :
                proxy.insertText("r")
            case "S" :
                proxy.insertText("s")
            case "T" :
                proxy.insertText("t")
            case "U" :
                proxy.insertText("u")
            case "V" :
                proxy.insertText("v")
            case "W" :
                proxy.insertText("w")
            case "X" :
                proxy.insertText("x")
            case "Y" :
                proxy.insertText("y")
            case "Z" :
                proxy.insertText("z")
                
                if(case.TouchUpInside)
                {
                    
                            switch title
                            {
                                
                            case "⬅︎" :
                                proxy.deleteBackward()
                            case "Return" :
                                proxy.insertText("\n")
                            case "⬆︎" :
                                proxy.autocapitalizationType!
                            case "⎯" :
                                proxy.insertText(" ")
                            case "🌐" :
                                self.advanceToNextInputMode()
                            case "A" :
                                proxy.insertText("A")
                            case "B" :
                                proxy.insertText("B")
                            case "C" :
                                proxy.insertText("C")
                            case "D" :
                                proxy.insertText("D")
                            case "E" :
                                proxy.insertText("E")
                            case "F" :
                                proxy.insertText("F")
                            case "G" :
                                proxy.insertText("G")
                            case "H" :
                                proxy.insertText("H")
                            case "I" :
                                proxy.insertText("I")
                            case "J" :
                                proxy.insertText("J")
                            case "K" :
                                proxy.insertText("K")
                            case "L" :
                                proxy.insertText("K")
                            case "M" :
                                proxy.insertText("M")
                            case "N" :
                                proxy.insertText("N")
                            case "O" :
                                proxy.insertText("O")
                            case "P" :
                                proxy.insertText("P")
                            case "Q" :
                                proxy.insertText("Q")
                            case "R" :
                                proxy.insertText("R")
                            case "S" :
                                proxy.insertText("S")
                            case "T" :
                                proxy.insertText("T")
                            case "U" :
                                proxy.insertText("U")
                            case "V" :
                                proxy.insertText("V")
                            case "W" :
                                proxy.insertText("W")
                            case "X" :
                                proxy.insertText("X")
                            case "Y" :
                                proxy.insertText("Y")
                            case "Z" :
                                proxy.insertText("Z")
                            default :
                                proxy.insertText(title)
                            }
                }
                
                
                //Da fuk does this do?            
            default :
                proxy.insertText(title)
                //Da fuk does this do?

            }
        }
    }
    
    func applyCurrentTheme()
    {

        var theme = ClaptonTheme()
        
        theme.applyThemeToView(self.view)
        
        theme.applyThemeToKeys(allButtons)
    }
    
    func addIndividualButtonConstraints(buttons: [UIButton], mainView: UIView)
    {
        
        for (index, button) in enumerate(buttons)
        {
            
            var topConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: mainView, attribute: .Top, multiplier: 1.0, constant: 1)
            
            var bottomConstraint = NSLayoutConstraint(item: button, attribute: .Bottom, relatedBy: .Equal, toItem: mainView, attribute: .Bottom, multiplier: 1.0, constant: -1)
            
            var rightConstraint : NSLayoutConstraint!
            
            if index == buttons.count - 1
            {
                
                rightConstraint = NSLayoutConstraint(item: button, attribute: .Right, relatedBy: .Equal, toItem: mainView, attribute: .Right, multiplier: 1.0, constant: -1)
                
            }
            
            else
            {
                
                let nextButton = buttons[index+1]
                rightConstraint = NSLayoutConstraint(item: button, attribute: .Right, relatedBy: .Equal, toItem: nextButton, attribute: .Left, multiplier: 1.0, constant: -1)
            }
            
            
            var leftConstraint : NSLayoutConstraint!
            
            if index == 0 {
                
                leftConstraint = NSLayoutConstraint(item: button, attribute: .Left, relatedBy: .Equal, toItem: mainView, attribute: .Left, multiplier: 1.0, constant: 1)
                
            }
            
            else
            {
                
                let prevtButton = buttons[index-1]
                leftConstraint = NSLayoutConstraint(item: button, attribute: .Left, relatedBy: .Equal, toItem: prevtButton, attribute: .Right, multiplier: 1.0, constant: 1)
                
                let firstButton = buttons[0]
                var widthConstraint = NSLayoutConstraint(item: firstButton, attribute: .Width, relatedBy: .Equal, toItem: button, attribute: .Width, multiplier: 1.0, constant: 0)
                
                widthConstraint.priority = 800
                mainView.addConstraint(widthConstraint)
            }
            
            mainView.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
        }
    }
    
    
    func addConstraintsToInputView(inputView: UIView, rowViews: [UIView]){
        
        for (index, rowView) in enumerate(rowViews) {
            var rightSideConstraint = NSLayoutConstraint(item: rowView, attribute: .Right, relatedBy: .Equal, toItem: inputView, attribute: .Right, multiplier: 1.0, constant: -1)
            
            var leftConstraint = NSLayoutConstraint(item: rowView, attribute: .Left, relatedBy: .Equal, toItem: inputView, attribute: .Left, multiplier: 1.0, constant: 1)
            
            inputView.addConstraints([leftConstraint, rightSideConstraint])
            
            var topConstraint: NSLayoutConstraint
            
            if index == 0 {
                topConstraint = NSLayoutConstraint(item: rowView, attribute: .Top, relatedBy: .Equal, toItem: inputView, attribute: .Top, multiplier: 1.0, constant: 0)
                
            }
            
            else
            {
                
                let prevRow = rowViews[index-1]
                topConstraint = NSLayoutConstraint(item: rowView, attribute: .Top, relatedBy: .Equal, toItem: prevRow, attribute: .Bottom, multiplier: 1.0, constant: 0)
                
                let firstRow = rowViews[0]
                var heightConstraint = NSLayoutConstraint(item: firstRow, attribute: .Height, relatedBy: .Equal, toItem: rowView, attribute: .Height, multiplier: 1.0, constant: 0)
                
                heightConstraint.priority = 800
                inputView.addConstraint(heightConstraint)
            }
            inputView.addConstraint(topConstraint)
            
            var bottomConstraint: NSLayoutConstraint
            
            if index == rowViews.count - 1
            {
                bottomConstraint = NSLayoutConstraint(item: rowView, attribute: .Bottom, relatedBy: .Equal, toItem: inputView, attribute: .Bottom, multiplier: 1.0, constant: 0)
                
            }
            
            else
            {
                
                let nextRow = rowViews[index+1]
                bottomConstraint = NSLayoutConstraint(item: rowView, attribute: .Bottom, relatedBy: .Equal, toItem: nextRow, attribute: .Top, multiplier: 1.0, constant: 0)
            }
            
            inputView.addConstraint(bottomConstraint)
        }
        
    }

}