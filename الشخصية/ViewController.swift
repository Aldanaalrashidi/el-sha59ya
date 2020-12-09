//
//  ViewController.swift
//  الشخصية
//
//  Created by Aldana Al Rashidi on 25/11/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var feedback: UILabel!
    @IBOutlet weak var nextQuestion: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var box: UIImageView!
    @IBOutlet weak var box2: UIImageView!
    
    var questions = QuestionModel()
    let score = ScoreModel()
    
    let numberOfQuestionPerRound = 5
    var currentQuestion: Question? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayQuestion()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func isGameOver() -> Bool {
        return score.getQuestionsAsked() >= numberOfQuestionPerRound
    }
    
    func displayQuestion() {
        currentQuestion = questions.getRandomQuestion()
        
        if let questionn = currentQuestion {
            let choices = questionn.getChoices()
            
            question.text = questionn.getInterrogative()
            one.setTitle(choices[0], for: .normal)
            two.setTitle(choices[1], for: .normal)
            three.setTitle(choices[2], for: .normal)
            four.setTitle(choices[3], for: .normal)
            
            if (score.getQuestionsAsked() == numberOfQuestionPerRound - 1) {
                nextQuestion.setTitle("انتهى الاختبار", for: .normal)
            } else {
                nextQuestion.setTitle("السؤال التالي", for: .normal)
            }
        }
        one.isEnabled = true
        two.isEnabled = true
        three.isEnabled = true
        four.isEnabled = true
        one.isHidden = false
        two.isHidden = false
        three.isHidden = false
        four.isHidden = false
        feedback.isHidden = true
//        box.isHidden = true
//        box2.isHidden = true
        nextQuestion.isEnabled = false
    }
    
    @IBAction func check(_ sender: UIButton) {
        if let question = currentQuestion, let answer = sender.titleLabel?.text {
            
            if (question.validateAnswer(to: answer)) {
                score.incrementCorrectAnswers()
                feedback.textColor = UIColor(red:0.15, green:0.61, blue:0.61, alpha:1.0)
                feedback.text = "صحيح🥳"
            } else {
                score.incrementIncorrectAnswers()
                feedback.textColor = UIColor(red:0.82, green:0.40, blue:0.26, alpha:1.0)
                feedback.text = "للأسف، جرب مرة أخرى🙃"
            }
            one.isEnabled = false
            two.isEnabled = false
            three.isEnabled = false
            four.isEnabled = false
            nextQuestion.isEnabled = true
            
            feedback.isHidden = false
        }
    }
    
    @IBAction func nexQuestionTapp(_ sender: Any) {
        if (isGameOver()) {
            displayScore()
        } else {
            displayQuestion()
        }
    }
    func displayScore() {
        question.text = score.getScore()
        score.reset()
        nextQuestion.setTitle("اختبر مره اخرى", for: .normal)
        
        feedback.isHidden = true
        one.isHidden = true
        two.isHidden = true
        three.isHidden = true
        four.isHidden = true
        box.isHidden = true
        box2.isHidden = true
    }
    
    
}
