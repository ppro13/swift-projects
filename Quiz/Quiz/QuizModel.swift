//
//  QuizModel.swift
//  Quiz
//
//  Created by Pedro Paulo on 24/10/17.
//  Copyright © 2017 Pedro Paulo. All rights reserved.
//

import Foundation
import UIKit

class Question{
    
    var strQuestion: String!
    var imgQuestion: UIImage!
    var answers: [Answer]!
    
    init(question: String, strImageFileName: String, answers: [Answer]){
        self.strQuestion = question
        self.imgQuestion = UIImage(named: strImageFileName)
        self.answers = answers
    }
    
}

class Answer{
    
    var strAnswer: String!
    var isCorrect: Bool!
    
    init(answer: String, isCorrect: Bool){
        self.strAnswer = answer
        self.isCorrect = isCorrect
        
    }
    
}
