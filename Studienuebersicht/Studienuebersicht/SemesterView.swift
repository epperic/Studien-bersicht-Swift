//
//  SemesterView.swift
//  Studienuebersicht
//
//  Created by Eric Epp on 19.05.21.
// Based on https://www.vadimbulavin.com/add-edit-move-and-drag-and-drop-in-swiftui-list/

import SwiftUI

struct SemesterView: View {
    @EnvironmentObject var collection : CollectionViewModel
    @State private var editMode = EditMode.inactive
    @State var selection : Int?
    @State var modulToDelete : ModulViewModel?
    
    var body: some View{
        NavigationView{
            ZStack{
                List{
                    ForEach(collection.splitsemestermodule.indices, id: \.self){
                        index in
                        Section(header: Text("\(index + 1). Semester - Note: Ø\(String(format: "%.2f", collection.calcAvgNote(modulliste: collection.splitsemestermodule[index])))")){
                            ForEach(collection.splitsemestermodule[index], id: \.Id){
                                modul in
                                NavigationLink(destination: EditModulView(modul: modul, collection: collection)){
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
        for index in offsets {
            modulToDelete = collection.splitsemestermodule[section][index]
        }
        FirebaseAPI().deleteData(documentID: modulToDelete!.Id, completion: {
            switch $0 {
            case .success(_):
                reloadData()
            case let .failure(error):
                debugPrint(error.localizedDescription)
            }
        })
    }
    
    private func onMove(source: IndexSet, destination: Int) {
        collection.splitsemestermodule[0].move(fromOffsets: source, toOffset: destination)
    }
    
    func reloadData(){
        let api = FirebaseAPI()
        api.fetchData(completion: {
            switch $0 {
            case let .success(items):
                collection.module = items
                collection.splitSemesters()
            case let .failure(error): debugPrint(error)
            }
        })
    }
}
