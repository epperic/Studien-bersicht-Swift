//
//  ModulRow.swift
//  Studienuebersicht
//
//  Created by Eric Epp on 25.05.21.
//

import SwiftUI

struct SemesterRow : View {
    var modul: String
    var note: Double
    
    var body: some View {
        HStack{
            Text(verbatim: modul)
            Spacer()
            Text(verbatim: note.description)
        }
    }
}
