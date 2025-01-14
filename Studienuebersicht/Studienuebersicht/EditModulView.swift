//
//  EditModulView.swift
//  Studienuebersicht
//
//  Created by Eric Epp on 26.05.21.
//

import SwiftUI

struct EditModulView: View {
    @Environment(\.presentationMode) var presentation
    @State var alertactive: Bool = false
    @State var alertmessage: String?
    @State var modulname: String
    @State var professor: String
    @State var ects: Int
    @State var note: Double
    @State var semester: Int
    
    var documentID: String
    var collection: CollectionViewModel
    
    //Fremdcode: https://www.hackingwithswift.com/quick-start/swiftui/how-to-format-a-textfield-for-numbers
    let decimalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    init(modul: ModulViewModel, collection: CollectionViewModel) {
        documentID = modul.Id
        self.collection = collection
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
        }.disabled(modulname.isEmpty || professor.isEmpty || note == 0.0 || ects == 0  || semester == 0)
        .alert(isPresented: $alertactive){
            Alert(title: Text("Firebase feedback"), message: Text(alertmessage!), dismissButton: .default(Text("OK")))
        }
    }
    private func onSave(){
        let apiObj = FirestoreModel(documentID: documentID, modulname: modulname, professor: professor, ects: ects, note: note, semester: semester)
        FirebaseAPI().saveData(apiObj: apiObj, completion: {
            switch $0 {
            case let .success(message):
                reloadData()
                alertmessage = message
                alertactive = true
            case let .failure(error):
                alertmessage = error.localizedDescription
                alertactive = true
            }
        })
        self.presentation.wrappedValue.dismiss()
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
