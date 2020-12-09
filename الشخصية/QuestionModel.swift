//
//  QuestionModel.swift
//  الشخصية
//
//  Created by Aldana Al Rashidi on 08/12/2020.
//

import GameKit
struct QuestionModel {
    
    let questions = [
        Question(interrogative: "لدى الشخصية.....", answers: ["تعريف", "تعريفين", "٣ تعاريف", "٤ تعاريف"], correctAnswerIndex: 1),
        Question(interrogative: "الاعتماد على الملاحظة العلمية وفق وظائف سيكولوجية هو تعريف الشخصية لدى؟", answers: ["الإنسان", "أولبورت", "العلماء", "العالم البريطاني"], correctAnswerIndex: 2),
        Question(interrogative: "ماهي الشخصية المرغوب فيها؟", answers: ["الشخصية المثالية", "الشخصية المرحة", "الشخصية المتطرفة", "الشخصية المعتدلة"], correctAnswerIndex: 3),
        Question(interrogative: "تعتبر الشخصية محور الاهتمام بالنسبة لماذا؟", answers: ["الصحة النفسية", "الصحة العقلية", "الصحة الجسدية", "الصحة العامة"], correctAnswerIndex: 0),
        Question(interrogative: "يجب أن تتمتع الشخصية ذات السلوك السوي ب", answers: ["التصرف كما يشاء الشخص", "الابتعاد عن الناس", "التمتع بقدرة عالية على العمل", "عدم تقبل الاخرين"], correctAnswerIndex: 2)
    ]
    
    var previouslyUsedNumbers: [Int] = []
    
    mutating func getRandomQuestion() -> Question {
        
        if (previouslyUsedNumbers.count == questions.count) {
            previouslyUsedNumbers = []
        }
        var randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: questions.count)
        
        // Picks a new random number if the previous one has been used
        while (previouslyUsedNumbers.contains(randomNumber)) {
            randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: questions.count)
        }
        previouslyUsedNumbers.append(randomNumber)
        
        return questions[randomNumber]
    }
}

class Question {
    
    fileprivate let interrogative: String
    fileprivate let answers: [String]
    fileprivate let correctAnswerIndex: Int
    
    init(interrogative: String, answers: [String], correctAnswerIndex: Int) {
        self.interrogative = interrogative
        self.answers = answers
        self.correctAnswerIndex = correctAnswerIndex
    }
    
    func validateAnswer(to givenAnswer: String) -> Bool {
        return (givenAnswer == answers[correctAnswerIndex])
    }
    
    func getInterrogative() -> String {
        return interrogative
    }
    
    func getAnswer() -> String {
        return answers[correctAnswerIndex]
    }
    
    func getChoices() -> [String] {
        return answers
    }
    
    func getAnswerAt(index: Int) -> String {
        return answers[index]
    }
}
