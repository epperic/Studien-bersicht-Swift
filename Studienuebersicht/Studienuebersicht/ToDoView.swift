//
//  ToDoView.swift
//  Studienuebersicht
//
//  Created by Eric Epp on 19.05.21.
//

import SwiftUI

struct ToDoView: View {
    @EnvironmentObject var collection : CollectionViewModel
    @State private var toDoList : [ModulViewModel] = []
    @State private var optionIndex = 0
        var options = ["1. Semester", "2. Semester", "3. Semester", "4. Semester", "5. Semester", "6. Semester", "7. Semester", "8. Semester"]

    var body: some View{
        NavigationView{
            VStack{
                Form{
                    Section(header: Text("Semesterauswahl")) {
                        Picker(selection: $optionIndex, label: Text("Aktuelles Semester:")) {
                            ForEach(0 ..< options.count) {
                                Text(self.options[$0])
                            }
                        }.onChange(of: optionIndex, perform: { value in
                            transformData()
                        })
                    }
                }.navigationTitle("Nachzuholende Module")
                Spacer()
                List{
                    ForEach(toDoList, id: \.Modulname){
                        modul in
                        TodoRow(semester: modul.Semester, modul: modul.Modulname, professor: modul.Professor, ects: modul.ECTS)
                    }
                }
            }
        }.onAppear{transformData()}
    }
    func transformData(){
        toDoList = collection.module.filter{$0.Semester == optionIndex + 1}
    }
}
