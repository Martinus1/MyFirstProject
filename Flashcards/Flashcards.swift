//
//  Flashcards.swift
//  Flashcards
//
//  Created by iD Student on 8/14/17.
//  Copyright © 2017 ID Tech. All rights reserved.
//



import Foundation
import GameKit

class Flashcard {
    var question : String
    
    var options : [String]
    var correctAnswer : String
    
    init(question : String, options : [String]){
        self.question = question
        self.options = options
        
        self.correctAnswer = options[0]
        
        self.options = shuffle(list: options)
    }
}
// Expand to see the rest of the shuffle lines.

class CardCollection {
    
    // Single instance of the card collection
    public static var instance : CardCollection = CardCollection()
    
    // The list of flashcards
    public private(set) var cards : [Flashcard]
    
    // Which question are we on?
    public var currentIndex : Int
    
    // Get the current card.
    public var currentCard : Flashcard {
        get { return cards[currentIndex] }
    }
    
    private init(){
        
        cards = [ Flashcard(question: "Test Question", options: ["True","False"]),
                  Flashcard(question: "What's the capitol of Washington state?", options:["Olympia", "Tacoma", "Seattle", "Spokane"]),
                  Flashcard(question: "Where is iD Tech's headquarters?", options:["Campbell, CA", "Albequerque, NM", "Beijing, CN"]),
                  Flashcard(question: "What is the capital of Slovakia?", options:["Bratislava", "Jerusalem", "Kiev"]),
                  Flashcard(question: "What is the name of the operating system of Apple Phone", options:["iOS", "macOS", "watchOS"]),
                  Flashcard(question: "What is the national food of Slovakia?", options:["Halusky", "Croquettes", "Cucuber salad", "Bread with olives"]),
                  Flashcard(question: "What is the most common last name in the world?", options:["Lee", "Smith", "Wang", "Garcia"]),
                  Flashcard(question: "Who are The Beattles?", options:["Rock Band", "Movie Stars", "Beatles?", "Insects"]),
                  Flashcard(question: "Who is James Bond?", options:["Spy", "American", "Male", "Movie Star"]),
                  Flashcard(question: "What is the main character in the Bible?", options:["Jesus", "Noah", "Larry", "Steven Segal"]),
                  Flashcard(question: "Enter the current year...", options:["2017", "2016", "2018", "2020"]),
                  Flashcard(question: "Choose Unhealthy Food...", options:["Fries", "Salad", "Water Melon", "Steak", "Rice"]),
                  Flashcard(question: "What is 7x7", options:["49", "14", "64", "86"]),
                  Flashcard(question: "Which of the followin optins is part of the Shakespeares Monologue \" to be or not to be\"", options:["The Slings and Arrow of Outrageous Fortune", "Wheter this noble in the mind to suffer", "or to take arms against the sea of justice", "To die, to sleep, or follow", "Thy shall be Choosen"]),
                  Flashcard(question: "THE LAS QUESTION>>> Which i=of the followinf is not a country in USA", options:["Nicaragua","Alaska",
                                                                                                                       "Alabama",
                                                                                                                       "Arkansas",
                                                                                                                       "American Samoa",
                                                                                                                       "Arizona",
                                                                                                                       "California",
                                                                                                                       "Colorado",
                                                                                                                       "Connecticut",
                                                                                                                       "District of Columbia",
                                                                                                                       "Delaware",
                                                                                                                       "Florida",
                                                                                                                       "Georgia",
                                                                                                                       "Guam",
                                                                                                                       "Hawaii",
                                                                                                                       "Iowa",
                                                                                                                       "Idaho",
                                                                                                                       "Illinois",
                                                                                                                       "Indiana",
                                                                                                                       "Kansas",
                                                                                                                       "Kentucky",
                                                                                                                       "Louisiana",
                                                                                                                       "Massachusetts",
                                                                                                                       "Maryland",
                                                                                                                       "Maine",
                                                                                                                       "Michigan",
                                                                                                                       "Minnesota",
                                                                                                                       "Missouri",
                                                                                                                       "Mississippi",
                                                                                                                       "Montana",
                                                                                                                       "North Carolina",
                                                                                                                       " North Dakota",
                                                                                                                       "Nebraska",
                                                                                                                       "New Hampshire",
                                                                                                                       "New Jersey",
                                                                                                                       "New Mexico",
                                                                                                                       "Nevada",
                                                                                                                       "New York",
                                                                                                                       "Ohio",
                                                                                                                       "Oklahoma",
                                                                                                                       "Oregon",
                                                                                                                       "Pennsylvania",
                                                                                                                       "Puerto Rico",
                                                                                                                       "Rhode Island",
                                                                                                                       "South Carolina",
                                                                                                                       "South Dakota",
                                                                                                                       "Tennessee",
                                                                                                                       "Texas",
                                                                                                                       "Utah",
                                                                                                                       "Virginia",
                                                                                                                       "Virgin Islands",
                                                                                                                       "Vermont",
                                                                                                                       "Washington",
                                                                                                                       "Wisconsin",
                                                                                                                       "West Virginia",
                                                                                                                       "Wyoming"]),
                  
        ]
        
        currentIndex = 0;
        
        cards = shuffle(list: cards)
        
    }
    
    public func nextQuestion() {
        currentIndex += 1
        if(currentIndex >= cards.count){
            currentIndex = 0
            cards = shuffle(list:cards)
        }
        currentCard.options = shuffle( list: currentCard.options)
    }
    
    public func checkAnswer(_ selectedAnswer : Int) -> Bool {
        return currentCard.options[selectedAnswer] == currentCard.correctAnswer
    }
    
}

func shuffle<T>( list : [T]) -> [T] {
    return GKRandomSource.sharedRandom().arrayByShufflingObjects(in: list) as! [T]
}
