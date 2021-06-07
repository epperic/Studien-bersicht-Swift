//
//  SemesterView.swift
//  Studienuebersicht
//
//  Created by Eric Epp on 19.05.21.
//

import SwiftUI

struct SemesterView: View {
    @EnvironmentObject var collection : CollectionViewModel
    @State private var editMode = EditMode.inactive
    @State var selection : Int?
    
    var body: some View{
        NavigationView{
            ZStack{
                List{
                    ForEach(collection.splitsemestermodule.indices, id: \.self){
                        index in
                        Section(header: Text("\(index + 1). Semester - Note: Ø\(String(format: "%.2f", collection.calcAvgNote(modulliste: collection.splitsemestermodule[index])))")){
                            ForEach(collection.splitsemestermodule[index], id: \.Id){
                                modul in
                                NavigationLink(destination: EditModulView(modul: modul)){
                                    SemesterRow(modul: modul.Modulname, note: modul.Note)
                                }
                            }.onDelete{onDelete(offsets: $0, section: index)}
                            .onMove(perform: onMove)
                        }
                    }
                }
            }.navigationTitle("Semesterübersicht")
            .navigationBarItems(leading: EditButton(), trailing: addButton)
            .environment(\.editMode, $editMode)
        }.onAppear{}
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
    
    private func onDelete(offsets: IndexSet, section: Int) {
        collection.splitsemestermodule[section].remove(atOffsets: offsets)
    }
    
    private func onMove(source: IndexSet, destination: Int) {
        collection.splitsemestermodule[0].move(fromOffsets: source, toOffset: destination)
    }
}
