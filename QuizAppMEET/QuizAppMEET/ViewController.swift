//
//  ViewController.swift
//  QuizAppMEET
//
//  Created by msb on 05/10/20.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var questionlabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var Yesbutton: UIButton!
    
    @IBOutlet weak var Nobutton: UIButton!
    
    struct check{

    let question:String
    let ans:String

    }
    var i=0
    
    let questions=[
        check(question:"Is the sum of 2+3=5?",ans:"true"),
        check(question:"You are an alien",ans:"false"),
        check(question:"iPhone 14 is available",ans:"false")]
    override func viewDidLoad() {
        super.viewDidLoad()
        questionlabel.text=questions[i].question
    }

    @objc func changeUI(){
        
        questionlabel.text=questions[i].question
        progressBar.progress=Float(i+1)/Float(questions.count)
        Yesbutton.backgroundColor=UIColor.clear
        Nobutton.backgroundColor=UIColor.clear
        }
    @IBAction func buttonClick(_ sender: UIButton) {
        let useranswer=sender.currentTitle
        let correctans=questions[i].ans
        if useranswer==correctans{
            sender.backgroundColor=UIColor.green
        }
        else{
            sender.backgroundColor=UIColor.red
        }
        if i<questions.count-1{
            i+=1
        }
        else{
            i=0
        }
        Timer.scheduledTimer(timeInterval: 0.10 , target: self, selector: #selector(changeUI), userInfo: nil, repeats: false)
    }
    
}

