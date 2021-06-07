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
    let options = ["1. Semester", "2. Semester", "3. Semester", "4. Semester", "5. Semester", "6. Semester", "7. Semester", "8. Semester"]
    
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
                    ToDoGrid(module: toDoList)
                }.navigationTitle("To Do Module")
            }
        }.onAppear{transformData()}
    }
    
    private func transformData(){
        toDoList = collection.module.filter{$0.Note == 0 && $0.Semester < optionIndex + 1 }
        toDoList.sort(by: {$0.Semester < $1.Semester})
    }
}
