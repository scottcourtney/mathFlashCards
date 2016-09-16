//
//  QuestionViewController.swift
//  mathFlashCards
//
//  Created by Scott Courtney on 9/14/16.
//  Copyright © 2016 Scott Courtney. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var Number1: UILabel!
    @IBOutlet weak var Sign: UILabel!
    @IBOutlet weak var Number2: UILabel!
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    @IBOutlet weak var Next: UIButton!
    
    var CorrectAnswer = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomQuestion()
        Hide()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func randomQuestion() {
        
        let num1 = Int(arc4random_uniform(20))
        let num2 = Int(arc4random_uniform(20))
        let answer = num1 + num2
        let answers = [answer, answer + 1, answer - 1, answer + 2]
        let randomAnswer1 = Int(arc4random_uniform(UInt32(answers.count)))
        let randomAnswer2 = Int(arc4random_uniform(UInt32(answers.count)))
        let randomAnswer3 = Int(arc4random_uniform(UInt32(answers.count)))
        let randomAnswer4 = Int(arc4random_uniform(UInt32(answers.count)))
        
        Number1.text = String(num1)
        Number2.text = String(num2)
        Button1.setTitle(String(describing: answers[randomAnswer1]), for: UIControlState())
        Button2.setTitle(String(describing: answers[randomAnswer2]), for: UIControlState())
        Button3.setTitle(String(describing: answers[randomAnswer3]), for: UIControlState())
        Button4.setTitle(String(describing: answers[randomAnswer4]), for: UIControlState())
        CorrectAnswer = String(answer)
    }
    
    func Hide() {
        Image.isHidden = true
        Next.isHidden = true
    }
    func Show() {
        Image.isHidden = false
        Next.isHidden = false
    }
    
    func Reload() {
        delay(1.0){
            self.Image.isHidden = true
        }
    }
    
    func delay(_ delay: Double, closure: @escaping ()->()) {
        
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
            execute: closure
        )
    }
    
    @IBAction func Button1(_ sender: AnyObject) {
        Show()
        
        if (CorrectAnswer == String(describing: Button1.currentTitle!)){
            Image.image = UIImage(named: ("correct.png"))
        }
        else {
            Image.image = UIImage(named: ("wrong.png"))
            Reload()
        }
    }
    
    @IBAction func Button2(_ sender: AnyObject) {
        Show()
        
        if (CorrectAnswer == String(describing: Button2.currentTitle!)){
            Image.image = UIImage(named: ("correct.png"))
        }
        else {
            Image.image = UIImage(named: ("wrong.png"))
            Reload()
        }
        
    }
    @IBAction func Button3(_ sender: AnyObject) {
        Show()
        
        if (CorrectAnswer == String(describing: Button3.currentTitle!)){
            Image.image = UIImage(named: ("correct.png"))
        }
        else {
            Image.image = UIImage(named: ("wrong.png"))
            Reload()
        }
    }
    @IBAction func Button4(_ sender: AnyObject) {
        Show()
        
        if (CorrectAnswer == String(describing: Button4.currentTitle!)){
            Image.image = UIImage(named: ("correct.png"))
        }
        else {
            Image.image = UIImage(named: ("wrong.png"))
            Reload()
        }
    }
    
    @IBAction func Next(_ sender: AnyObject) {
        randomQuestion()
        Hide()
    }
    
}
