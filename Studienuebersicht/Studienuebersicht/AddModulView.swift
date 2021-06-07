//
//  AddModulView.swift
//  Studienuebersicht
//
//  Created by Eric Epp on 26.05.21.
//

import SwiftUI

struct AddModulView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var collection : CollectionViewModel
    @State var modulname: String = ""
    @State var professor: String = ""
    @State var ects: Int = 0
    @State var note: Double = 0
    @State var semester: Int = 1
    
    //Fremdcode: https://www.hackingwithswift.com/quick-start/swiftui/how-to-format-a-textfield-for-numbers
    let decimalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
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
        .navigationTitle("Modul hinzufügen")
    }
    
    private var saveButton: some View {
        Button(action: onSave) {
            Text("Hinzufügen")
        }
    }
    private func onSave(){
        //Fubnktionsaufruf des Adapters (API Aufruf)
        collection.splitsemestermodule[semester - 1].append(ModulViewModel(Id: "10", Modulname: modulname, Professor: professor, ECTS: ects, Note: note, Semester: semester))
        self.presentation.wrappedValue.dismiss()
    }
}
