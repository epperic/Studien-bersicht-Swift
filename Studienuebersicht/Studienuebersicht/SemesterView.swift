//
//  SemesterView.swift
//  Studienuebersicht
//
//  Created by Eric Epp on 19.05.21.
//

import SwiftUI

struct SemesterView: View {
    @EnvironmentObject var collection : CollectionViewModel
    @State private var SemesterSections : [CollectionViewModel] = []
    @State private var editMode = EditMode.inactive
    @State var selection : Int?
    
    var body: some View{
        NavigationView{
            ZStack{
                List{
                    Section(header: Text("1. Semester")){
                        //modulliste splitten in semester und einzelne semester übergeben
                        //dann vlt mit foreach loop sections erstellen für jedes semester das es gibt
                        ForEach(collection.module, id: \.Id){
                            modul in
                            NavigationLink(destination: EditModulView(modul: modul)){
                                SemesterRow(modul: modul.Modulname, note: modul.Note)
                            }
                        }.onDelete(perform: onDelete)
                        .onMove(perform: onMove)
                    }
                    Section(header: Text("2. Semester")){
                        ForEach(collection.module, id: \.Id){
                            modul in
                            SemesterRow(modul: modul.Modulname, note: modul.Note)
                        }.onDelete(perform: onDelete)
                        .onMove(perform: onMove)
                    }
                }
            }.navigationTitle("Semesterübersicht")
            .navigationBarItems(leading: EditButton(), trailing: addButton)
            .environment(\.editMode, $editMode)
        }.onAppear{transformData()}
    }
    
    private var addButton: some View {
            switch editMode {
            case .inactive:
                return AnyView(NavigationLink(destination: AddModulView().environmentObject(collection), tag: 1, selection: $selection ){
                        Button(action: onAdd) { Image(systemName: "plus") }
                })
            default:
                return AnyView(EmptyView())
            }
        }
    
    private func onAdd(){
        self.selection = 1
    }
    
    private func onDelete(offsets: IndexSet) {
        collection.module.remove(atOffsets: offsets)
    }

    private func onMove(source: IndexSet, destination: Int) {
        collection.module.move(fromOffsets: source, toOffset: destination)
    }
    
    private func transformData(){
        /*ForEach(collection.module, id: \.Id){
            modul in
        }*/
        //Hier muss ich die collection in sections splitten
    }
}
