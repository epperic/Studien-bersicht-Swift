//
//  ModulViewModel.swift
//  Studienuebersicht
//
//  Created by Eric Epp on 25.05.21.
//

import Foundation

class ModulViewModel {
    init(Id: String, Modulname: String, Professor: String, ECTS: Int, Note: Double, Semester: Int) {
        self.Id = Id
        self.Modulname = Modulname
        self.Professor = Professor
        self.ECTS = ECTS
        self.Note = Note
        self.Semester = Semester
    }
    
    let Id: String
    let Modulname: String
    let Professor: String
    let ECTS: Int
    let Note: Double
    let Semester: Int
}
