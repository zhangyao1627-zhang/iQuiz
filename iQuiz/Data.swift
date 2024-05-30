//
//  Data.swift
//  iQuiz
//
//  Created by Yao Zhang on 5/5/24.
//

import Foundation

class Question: Codable {
    var text: String
    var answer: String
    var answers: [String]

    init(text: String, answer: String, answers: [String]) {
        self.text = text
        self.answer = answer
        self.answers = answers
    }
}

class Category: Codable {
    var title: String
    var desc: String
    var questions: [Question]

    init(title: String, desc: String, questions: [Question]) {
        self.title = title
        self.desc = desc
        self.questions = questions
    }
}

