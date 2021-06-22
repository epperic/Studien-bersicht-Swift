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
                LeistungenGrid(module: collection.module.filter{modul in
                    return modul.Note != 0.0
                }, sumECTS: collection.calcECTS(), avgNote: collection.calcAvgNote(modulliste: collection.module))
            }.navigationTitle("Leistungen")
        }
    }
}
