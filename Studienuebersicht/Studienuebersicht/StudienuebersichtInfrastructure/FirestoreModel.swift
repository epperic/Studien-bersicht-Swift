//
//  FirestoreModel.swift
//  Studienuebersicht
//
//  Created by Eric Epp on 08.06.21.
//

import Foundation

class FirestoreModel{
    
    var dictionary: [String: Any]
    var documentID: String?
    
    init(documentID: String, modulname: String, professor: String, ects: Int, note: Double, semester: Int) {
        self.dictionary = [
            "name" : modulname,
            "professor" : professor,
            "ects" : ects,
            "note" : note,
            "semester" : semester,
        ]
        self.documentID = documentID
    }
}
