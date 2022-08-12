//
//  EasyStrategy.swift
//  becomeAMillionaire
//
//  Created by Macbook Pro on 09.08.2022.
//

import Foundation

final class EasyDifficultyStrategy: DifficultyStrategy {
   
    func complexityOfQuestions() -> [Question] {
        var question: [Question] = []
        
        question.append(Question(difficulty: .easy, question: "Что растёт в огороде?", answers: ["Лук","Пистолет","Пулемёт","Человек"], wrongAnswers: ["Пистолет","Пулемёт","Человек"], ringhtAnswer: "Лук", correctNumberAnswer: 0))
        question.append(Question(difficulty: .easy, question: "Как называют микроавтобусы, совершающие поездки по определённым маршрутам?", answers: ["Рейсовка","Путевка","Курсовка","Маршрутка"], wrongAnswers: ["Рейсовка","Путевка","Путевка"], ringhtAnswer: "Маршрутка", correctNumberAnswer: 3))
        question.append(Question(difficulty: .easy, question: "Cколько цветов на светофоре?", answers: ["1","2","3","6"], wrongAnswers: ["1","2","6"], ringhtAnswer: "3", correctNumberAnswer: 2))
        question.append(Question(difficulty: .easy, question: "Сколько лет Москве?", answers: ["1345","1147","1287","1234"], wrongAnswers: ["1345","1287","1234"], ringhtAnswer: "1147", correctNumberAnswer: 1))
        question.append(Question(difficulty: .easy, question: "Самая большая планета в солнечной системе?", answers: ["Земля","Юпитер","Марс","Солнце"], wrongAnswers: ["Земля","Марс","Солнце"], ringhtAnswer: "Юпитер", correctNumberAnswer: 1))
        question.append(Question(difficulty: .easy, question: "Какой специалист занимается изучением неопознанных летающих объектов?", answers: ["Кинолог","Уфолог","Сексопатолог","Психиатр"], wrongAnswers: ["Кинолог","Психиатр","Сексопатолог"], ringhtAnswer: "Уфолог", correctNumberAnswer: 1))
        question.append(Question(difficulty: .easy, question: "Что такое десница?", answers: ["Бровь","Глаз","Шея","Рука"], wrongAnswers: ["Бровь","Глаз","Шея"], ringhtAnswer: "Рука", correctNumberAnswer: 3))
        question.append(Question(difficulty: .easy, question: "В какое море впадает река Урал?", answers: ["Азовское","Черное","Средиземное","Каспийское"], wrongAnswers: ["Азовское","Черное","Средиземное"], ringhtAnswer: "Каспийское", correctNumberAnswer: 3))
        question.append(Question(difficulty: .easy, question: "Какое животное имеет второе название — кугуар?", answers: ["Пантера","Тирг","Пума","Леопард"], wrongAnswers: ["Пантера","Тигр","Леопард"], ringhtAnswer: "Пума", correctNumberAnswer: 2))
        question.append(Question(difficulty: .easy, question: "Что растёт в огороде?", answers: ["Оцелот","Леопард","Пума","Пантера"], wrongAnswers: ["Оцелот","Леопард","Пантера"], ringhtAnswer: "Пума", correctNumberAnswer: 2))
        question.append(Question(difficulty: .easy, question: "Какое море не омывает Россию?", answers: ["Баренцево","Печорское","Средиземное","Белое"], wrongAnswers: ["Баренцево","Печорское","Белое"], ringhtAnswer: "Средиземное", correctNumberAnswer: 2))
        question.append(Question(difficulty: .easy, question: "кто построил эйфелеву башню?", answers: ["Некрасов","Будлиг","Колен","Нугье"], wrongAnswers: ["Некрасов","Будлинг","колен"], ringhtAnswer: "Нугье", correctNumberAnswer: 3))
        question.append(Question(difficulty: .easy, question: "Сколько всего оканов?", answers: ["5","3","4","6"], wrongAnswers: ["3","4","6"], ringhtAnswer: "5", correctNumberAnswer: 0))
        question.append(Question(difficulty: .easy, question: "Сколько всего континетов?", answers: ["5","6","4","8"], wrongAnswers: ["5","4","8"], ringhtAnswer: "6", correctNumberAnswer: 1))
        question.append(Question(difficulty: .easy, question: "Самая высокая гора в мире?", answers: ["Эльбрус","Чогори","Джомолунгма","Канченджанга"], wrongAnswers: ["Эльбрус","Чогори","Канченджанга"], ringhtAnswer: "Джомоленгма", correctNumberAnswer: 2))
        
        return question
    }
    
    
}
