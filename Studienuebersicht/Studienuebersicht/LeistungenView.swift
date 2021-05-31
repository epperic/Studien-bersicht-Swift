//
//  LeistungenView.swift
//  Studienuebersicht
//
//  Created by Eric Epp on 19.05.21.
//

import SwiftUI

struct LeistungenView: View {
    @EnvironmentObject var collection : CollectionViewModel
    var body: some View{
        NavigationView{
            VStack{
                LeistungenHeader(sumECTS: 50, avgNote: 1.7)
                List{
                    ForEach(collection.module, id: \.Id){
                        modul in
                        LeistungRow(semester: modul.Semester, modul: modul.Modulname, ects: modul.ECTS, note: modul.Note)
                    }
                }
            }.navigationTitle("Leistungen")
        }.onAppear{transformData()}
    }
    func transformData(){
        
    }
}
