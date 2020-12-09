//
//  ScoreModel.swift
//  الشخصية
//
//  Created by Aldana Al Rashidi on 08/12/2020.
//

import Foundation
class ScoreModel {
    
    fileprivate var correctAnswers: Int = 0
    fileprivate var incorrectAnswers: Int = 0
    
    func reset() {
        correctAnswers = 0
        incorrectAnswers = 0
    }

    func incrementCorrectAnswers() {
        correctAnswers += 1
    }
    
    func incrementIncorrectAnswers() {
        incorrectAnswers += 1
    }
    
    func getQuestionsAsked() -> Int {
        return correctAnswers + incorrectAnswers
    }
    
    func getScore() -> String {
        let percentaile = Double(correctAnswers) / Double(getQuestionsAsked())
        
        if (percentaile > 0.75) {
            return "أحسنتييييي!\n لقد حصلتي على \(correctAnswers) من \(getQuestionsAsked())"
        } else if (percentaile > 0.5) {
            return "لقد حصلتي على \(correctAnswers) من \(getQuestionsAsked())"
        } else {
            return "يمكنك المحاولة مره أخرى \n لقد حصلتي على \(correctAnswers) من \(getQuestionsAsked())"
        }
    }
}
