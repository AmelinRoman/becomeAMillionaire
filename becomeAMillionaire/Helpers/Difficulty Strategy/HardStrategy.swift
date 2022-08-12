//
//  HardStrategy.swift
//  becomeAMillionaire
//
//  Created by Macbook Pro on 09.08.2022.
//

import Foundation

final class HardDifficultyStrategy: DifficultyStrategy {
    
    func complexityOfQuestions() -> [Question] {
        var question: [Question] = []
        
        question.append(Question(difficulty: .hard, question: "Кто из этих философов в 1864 году написал музыку на стихи А.С. Пушкина «Заклинание» и «Зимний вечер»?", answers: ["Юнг", "Гегель", "Ницше", "Шопенгауэр"], wrongAnswers: ["Юнг", "Гегель", "Шопенгауэр"], ringhtAnswer: "Ницше", correctNumberAnswer: 2))
        question.append(Question(difficulty: .hard, question: "Сколько раз в сутки подзаводят куранты Спасской башни Кремля?", answers: ["Один", "Два", "Три", "Четыре"], wrongAnswers: ["Один", "Три", "Четыре"], ringhtAnswer: "Два", correctNumberAnswer: 1))
        question.append(Question(difficulty: .hard, question: "Кто 1-м получил Нобелевскую премию по литературе?", answers: ["Романист", "Драматург", "Поэт", "Эссеист"], wrongAnswers: ["Романист", "Драматург", "Эссеист"], ringhtAnswer: "Поэт", correctNumberAnswer: 2))
        question.append(Question(difficulty: .hard, question: "С какой буквы начинаются слова, опубликованные в 16-м томе последнего издания Большой советской энциклопедии?", answers: ["М", "Н", "О", "П"], wrongAnswers: ["Н", "О", "П"], ringhtAnswer: "М", correctNumberAnswer: 0))
        question.append(Question(difficulty: .hard, question: "Кто из перечисленных был пажом во времена Екатерины II?", answers: ["Д.И. Фонвизин", "Г.Р. Державин", "А.Н. Радищев", "Н.М. Карамзин"], wrongAnswers: ["Д.И. Фонвизин", "Г.Р. Державин", "Н.М. Карамзин"], ringhtAnswer: "А.Н. Радищев", correctNumberAnswer: 2))
        question.append(Question(difficulty: .hard, question: "Какой химический элемент назван в честь злого подземного гнома?", answers: ["Гафний", "Кобальт", "Бериллий", "Теллур"], wrongAnswers: ["Гафний", "Бериллий", "Теллур"], ringhtAnswer: "Кобальт", correctNumberAnswer: 1))
        question.append(Question(difficulty: .hard, question: "В какой из этих столиц бывших союзных республик раньше появилось метро?", answers: ["Тбилиси", "Ереван", "Баку", "Минск"], wrongAnswers: ["Ереван", "Баку", "Минск"], ringhtAnswer: "Тблиси", correctNumberAnswer: 0))
        question.append(Question(difficulty: .hard, question: "Сколько морей омывают Балканский полуостров?", answers: ["3", "4", "5", "6"], wrongAnswers: ["3", "4", "5"], ringhtAnswer: "6", correctNumberAnswer: 3))
        question.append(Question(difficulty: .hard, question: "Реки с каким названием нет на территории России?", answers: ["Шея","Уста", "Спина", "Палец"], wrongAnswers: ["Шея", "Уста", "Палец"], ringhtAnswer: "Спина", correctNumberAnswer: 2))
        question.append(Question(difficulty: .hard, question: "Что такое лобогрейка?", answers: ["Жнейка", "Шапка", "Болезнь", "Печка"], wrongAnswers: ["Шапка", "Болезнь", "Печка"], ringhtAnswer: "Жнейка", correctNumberAnswer: 0))
        question.append(Question(difficulty: .hard, question: "Какой роман Фенимор Купер написал на спор с женой?", answers: ["Предосторожность", "Пионеры", "Последний из Могикян", "Зверобой"], wrongAnswers: ["Пионеры", "Последний из Могикян", "Зверобой"], ringhtAnswer: "Предосторожность", correctNumberAnswer: 0))
        question.append(Question(difficulty: .hard, question: "Какой вид кавалерии предназначался для боевых действий как в конном, так и в пешем строю?", answers: ["Кирасиры", "Уланы", "Драгуны", "Гусары"], wrongAnswers: ["Кирасиры", "Уланы", "Гусары"], ringhtAnswer: "Драгуны", correctNumberAnswer: 2))
        question.append(Question(difficulty: .hard, question: "Какое имя не принимал ни один папа римский?", answers: ["Валентин", "Евгений", "Георгий", "Виктор"], wrongAnswers: ["Валентин", "Евгений", "Виктор"], ringhtAnswer: "Георгий", correctNumberAnswer: 2))
        question.append(Question(difficulty: .hard, question: "В каком немецком городе родилась будущая императрица России Екатерина II?", answers: ["Висбаден", "Цербст", "Штеттин", "Дармштадт"], wrongAnswers: ["Висбаден", "Цербст", "Дармштадт"], ringhtAnswer: "Штеттин", correctNumberAnswer: 2))
        question.append(Question(difficulty: .hard, question: "Что запрещал указ, который в 1726 году подписала Екатерина I?", answers: ["Точить лясы", "Бить баклуши", "Пускать пыль в глаза", "Переливать из пустого в порожнее"], wrongAnswers: ["Точить лясы", "Бить баклуши", "Переливать из пустого в порожнее"], ringhtAnswer: "Пускать пыль в глаза", correctNumberAnswer: 2))
        question.shuffle()
        return question
    }
    
    
}
