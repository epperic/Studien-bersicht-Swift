//
//  ModulRow.swift
//  Studienuebersicht
//
//  Created by Eric Epp on 25.05.21.
//

import SwiftUI


struct SemesterRow : View {
    var modul: String
    var note: Double
    
    var body: some View {
            HStack{
                Text(verbatim: modul)
                Spacer()
                Text(verbatim: note.description)
            }
    }
}

struct LeistungRow : View {
    var semester: Int
    var modul: String
    var ects: Int
    var note: Double
    
    var body: some View {
        HStack{
            Text(verbatim: semester.description)
            Text(verbatim: modul)
            Text(verbatim: ects.description)
            Text(verbatim: note.description)
        }
    }
}

struct TodoRow : View {
    var semester: Int
    var modul: String
    var professor: String
    var ects: Int
    
    var body: some View {
        HStack{
            Text(verbatim: semester.description)
            Text(verbatim: modul)
            Text(verbatim: professor)
            Text(verbatim: ects.description)
        }
    }
}
