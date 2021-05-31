//
//  ModulHeader.swift
//  Studienuebersicht
//
//  Created by Eric Epp on 26.05.21.
//

import SwiftUI


struct SemesterHeader : View {
    var sumECTS: Int
    var avgNote: Double
    
    var body: some View {
        HStack(spacing: 10){
            Text("Modulname").bold()
            Text("Professor").bold()
            Text("ECTS: \(sumECTS)").bold()
            Text("Note: Ø \(avgNote)").bold()
        }
    }
}

struct LeistungenHeader : View {
    var sumECTS: Int
    var avgNote: Double
    
    var body: some View {
        HStack(/*spacing: 10*/){
            Text("Semester").bold()
            Text("Modulname").bold()
            Text("ECTS: \(sumECTS)").bold()
            Text("Note: Ø \(avgNote)").bold()
        }
    }
}

struct TodoHeader : View {
    var body: some View {
        HStack(spacing: 10){
            Text("Semester").bold()
            Text("Modulname").bold()
            Text("Professor").bold()
            Text("ECTS").bold()
        }
    }
}
