//
//  Scholar.swift
//  The Test's The Thing
//
//  Created by Student on 11/2/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

struct Scholar{
    var corpus:[String] = []
    var wordFrequencies:[String:Int] = [:]
    
    private static var _scholar:Scholar!
    static var scholar:Scholar{
        if _scholar == nil{
            _scholar = Scholar()
        }
        return _scholar
    }
    
    subscript(idx:Int) -> (String,Int)?{
        return (corpus[idx], wordFrequencies[corpus[idx]]) as? (String, Int)
    }
    
    subscript(wordIdx:String) -> Int?{
        return wordFrequencies[wordIdx]
    }
    
    mutating func readCorpus(from file:String){
        if let path = Bundle.main.path(forResource: file, ofType: "txt"){
            let compendium = try! String(contentsOfFile: path)
            corpus = compendium.components(separatedBy: CharacterSet.alphanumerics.inverted)
            corpus = corpus.map{ $0.lowercased()}
            corpus = corpus.filter { $0 != ""}
            var wordList:[String] = []
            for word in corpus{
                if wordFrequencies.keys.contains(word){
                    wordFrequencies[word]! += 1
                }
                else{
                    wordFrequencies[word] = 1
                    wordList.append(word)
                }
            }
            corpus = wordList
        }
    }
    init() {
        readCorpus(from:"plays")
    }
    
}

