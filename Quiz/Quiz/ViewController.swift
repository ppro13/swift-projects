//
//  ViewController.swift
//  Quiz
//
//  Created by Pedro Paulo on 24/10/17.
//  Copyright © 2017 Pedro Paulo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet weak var imgQuestion: UIImageView!
    @IBOutlet weak var btnAnswer1: UIButton!
    @IBOutlet weak var btnAnswer2: UIButton!
    @IBOutlet weak var btnAnswer3: UIButton!
    
    @IBOutlet weak var viewFeedback: UIView!
    @IBOutlet weak var lbFeedback: UILabel!
    @IBOutlet weak var btnFeedback: UIButton!
    
    var questions: [Question]!
    
    var currentQuestion = 0
    var grade = 0.0
    var quizEnded = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let q0answer0 = Answer(answer: "120 anos", isCorrect: true)
        let q0answer1 = Answer(answer: "80 anos", isCorrect: false)
        let q0answer2 = Answer(answer: "140 anos", isCorrect: false)
        let question0 = Question(question: "Quantos anos vive, em média, um elefante africano?", strImageFileName: "elefante", answers: [q0answer0, q0answer1, q0answer2])
        
        let q1answer0 = Answer(answer: "5,5 m", isCorrect: true)
        let q1answer1 = Answer(answer: "3,5 m", isCorrect: false)
        let q1answer2 = Answer(answer: "4,5 m", isCorrect: false)
        let question1 = Question(question: "Quantos metros em média tem uma girafa macho adulta?", strImageFileName: "girafa", answers: [q1answer0, q1answer1, q1answer2])
        
        let q2answer0 = Answer(answer: "2300 kgs", isCorrect: true)
        let q2answer1 = Answer(answer: "3300 kgs", isCorrect: false)
        let q2answer2 = Answer(answer: "4300 kgs", isCorrect: false)
        let question2 = Question(question: "Quanto pesa, em média, um rinoceronte macho adulto?", strImageFileName: "rinoceronte", answers: [q2answer0, q2answer1, q2answer2])
        
        let q3answer0 = Answer(answer: "64 km/h", isCorrect: true)
        let q3answer1 = Answer(answer: "74 km/h", isCorrect: false)
        let q3answer2 = Answer(answer: "54 km/h", isCorrect: false)
        let question3 = Question(question: "Qual a velocidade média de uma zebra?", strImageFileName: "zebra", answers: [q3answer0, q3answer1, q3answer2])
        
        questions = [question0, question1, question2, question3]
        
        startQuiz()
        
    }
    
    func startQuiz(){
        questions.shuffle()
        for i in 0 ..< questions.count{
            questions[i].answers.shuffle()
        }
        
        quizEnded = false
        grade = 0.0
        currentQuestion = 0
        
        showQuestion(0)
    }
    
    func showQuestion(_ questionid: Int){
        
        btnAnswer1.isEnabled = true
        btnAnswer2.isEnabled = true
        btnAnswer3.isEnabled = true
        
        lbQuestion.text = questions[questionid].strQuestion
        imgQuestion.image = questions[questionid].imgQuestion
        btnAnswer1.setTitle(questions[questionid].answers[0].strAnswer, for: UIControlState())
        btnAnswer2.setTitle(questions[questionid].answers[1].strAnswer, for: UIControlState())
        btnAnswer3.setTitle(questions[questionid].answers[2].strAnswer, for: UIControlState())
    }
    
    @IBAction func chooseAnswer1(_ sender: Any) {
        selectAnswer(0)
    }
    
    @IBAction func chooseAnswer2(_ sender: Any) {
        selectAnswer(1)
    }
    
    @IBAction func chooseAnswer3(_ sender: Any) {
        selectAnswer(2)
    }
    
    func selectAnswer(_ answerid: Int){
        
        btnAnswer1.isEnabled = false
        btnAnswer2.isEnabled = false
        btnAnswer3.isEnabled = false
        
        viewFeedback.isHidden = false
        
        let answer: Answer = questions[currentQuestion].answers[answerid]
        
        if(answer.isCorrect == true){
            grade = grade + 1.0
            lbFeedback.text = answer.strAnswer + "\n\nResposta correta!"
            lbFeedback.backgroundColor = UIColor.green
        }else{
            lbFeedback.text = answer.strAnswer + "\n\nResposta errada!"
            lbFeedback.backgroundColor = UIColor.red
        }
        
        if(currentQuestion < questions.count - 1){
            btnFeedback.setTitle("Próxima", for: UIControlState.normal)
        }else{
            btnFeedback.setTitle("Ver Nota", for: UIControlState.normal)
        }
        
    }
    
    
    @IBAction func btnFeedbackAction(_ sender: Any) {
        
        viewFeedback.isHidden = true
        
        if(quizEnded){
            startQuiz()
        }else{
            nextQuestion()
        }
    }
    
    func nextQuestion(){
        currentQuestion += 1
        
        if(currentQuestion < questions.count){
            showQuestion(currentQuestion)
        }else{
            endQuiz()
        }
    }
    
    func endQuiz(){
        grade = grade / Double(questions.count) * 100.0
        quizEnded = true
        viewFeedback.isHidden = false
        lbFeedback.text = "Sua nota: \(grade)"
        lbFeedback.backgroundColor = UIColor.yellow
        btnFeedback.setTitle("Refazer?", for: UIControlState())
    }
}

