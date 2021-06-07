//
//  ModulGrid.swift
//  Studienuebersicht
//
//  Created by Eric Epp on 07.06.21.
//
// Based on https://www.appcoda.com/swiftui-lazyvgrid-lazyhgrid/

import SwiftUI

struct LeistungenGrid: View {
    let gridItemLayout = [GridItem(.fixed(50)), GridItem(.flexible()), GridItem(.fixed(50)), GridItem(.fixed(50))]
    var module : [ModulViewModel]
    var sumECTS: Int
    var avgNote: Double
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                Text("Sem.").bold()
                Text("Modulname").bold()
                Text("ECTS \(sumECTS)").bold()
                Text("Note Ø\(String(format: "%.2f", avgNote))").bold()
                ForEach(module, id: \.Id){
                    modul in
                    Text(verbatim: modul.Semester.description)
                    Text(verbatim: modul.Modulname)
                    Text(verbatim: modul.ECTS.description)
                    Text(verbatim: modul.Note.description)
                }
            }
        }
    }
}

struct ToDoGrid: View {
    let gridItemLayout = [GridItem(.fixed(45)), GridItem(.flexible()), GridItem(.fixed(90)), GridItem(.fixed(45))]
    var module : [ModulViewModel]
    
    var body: some View {
        LazyVGrid(columns: gridItemLayout, spacing: 20) {
            Text("Sem.").bold()
            Text("Modulname").bold()
            Text("Professor").bold()
            Text("ECTS").bold()
            ForEach(module, id: \.Id){
                modul in
                Text(verbatim: modul.Semester.description)
                Text(verbatim: modul.Modulname)
                Text(verbatim: modul.Professor)
                Text(verbatim: modul.ECTS.description)
            }
        }
    }
}
