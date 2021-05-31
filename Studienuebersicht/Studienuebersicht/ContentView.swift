//
//  ContentView.swift
//  Studienuebersicht
//
//  Created by Eric Epp on 19.05.21.
//

import SwiftUI

struct ContentView: View {
    
    var collectionViewModel = CollectionViewModel()
    
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            SemesterView()
                .environmentObject(collectionViewModel)
                .tabItem {
                    Image(systemName: "list.number")
                    Text("Semester")
                }
            LeistungenView()
                .environmentObject(collectionViewModel)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Leistungen")
                }
            ToDoView()
                .environmentObject(collectionViewModel)
                .tabItem {
                    Image(systemName: "text.badge.plus")
                    Text("To-Do")
                }
        }.onAppear{
            MockloadData()
        }
    }
    
    func MockloadData(){
        collectionViewModel.module = [
            ModulViewModel(Id: "1", Modulname: "Mathematik I", Professor: "Ponick", ECTS: 6, Note: 1.3, Semester: 1),
            ModulViewModel(Id: "2", Modulname: "Personal Skills I", Professor: "Grewe", ECTS: 3, Note: 1.7, Semester: 1),
            ModulViewModel(Id: "3", Modulname: "Grundlagen der Informatik I", Professor: "Stuckenholz", ECTS: 8, Note: 2.5, Semester: 1),
            ModulViewModel(Id: "4", Modulname: "Mathematik II", Professor: "Ponick", ECTS: 5, Note: 4.0, Semester: 2),
            ModulViewModel(Id: "5", Modulname: "Personal Skills II", Professor: "Grewe", ECTS: 3, Note: 1.7, Semester: 2),
            ModulViewModel(Id: "6", Modulname: "Grundlagen der Informatik II", Professor: "Stuckenholz", ECTS: 8, Note: 2.0, Semester: 2),
            ModulViewModel(Id: "7", Modulname: "Embedded Systems", Professor: "Pelzl", ECTS: 8, Note: 1.7, Semester: 3),
            ModulViewModel(Id: "8", Modulname: "Personal Skills III", Professor: "Klein", ECTS: 3, Note: 1.4, Semester: 3),
            ModulViewModel(Id: "9", Modulname: "Praktische Informatik", Professor: "Stuckenholz", ECTS: 5, Note: 1.3, Semester: 3)
        ]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
