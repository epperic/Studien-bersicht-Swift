//
//  EditModulView.swift
//  Studienuebersicht
//
//  Created by Eric Epp on 26.05.21.
//

import SwiftUI

struct EditModulView: View {
    @Environment(\.presentationMode) var presentation
    @State var modulname: String
    @State var professor: String
    @State var ects: Int
    @State var note: Double
    @State var semester: Int
    
    //Fremdcode: https://www.hackingwithswift.com/quick-start/swiftui/how-to-format-a-textfield-for-numbers
    let decimalFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
    
    init(modul:ModulViewModel) {
        _modulname = State(initialValue: modul.Modulname)
        _professor = State(initialValue: modul.Professor)
        _ects = State(initialValue: modul.ECTS)
        _note = State(initialValue: modul.Note)
        _semester = State(initialValue: modul.Semester)
    }
    
    var body: some View{
        NavigationView{
                Form {
                    Section(header: Text("Modulname")) {
                        TextField("Modulname", text: $modulname)
                    }
                    Section(header: Text("Professor")) {
                        TextField("Professor", text: $professor)
                    }
                    Section(header: Text("ECTS")) {
                        TextField("ECTS", value: $ects, formatter: NumberFormatter())
                    }
                    Section(header: Text("Note")) {
                        TextField("Note", value: $note, formatter: decimalFormatter)
                    }
                    Section(header: Text("Semester")) {
                        TextField("Semester", value: $semester, formatter: NumberFormatter())
                    }
                }
            }.navigationBarItems(trailing: saveButton)
        .navigationTitle("Modulübersicht")
    }
    
    private var saveButton: some View {
            Button(action: onSave) {
                Text("Save")
            }
        }
    private func onSave(){
        //Fubnktionsaufruf des Adapters (API Aufruf)
        self.presentation.wrappedValue.dismiss()
    }
}

/*Toggle(isOn: $isPrivate) {
Text("Private Account")
}*/
