//
//  DotaHeroesDetail.swift
//  Dota Heroes SwiftUI
//
//  Created by Ade Dwi Prayitno on 02/10/22.
//

import SwiftUI

struct DotaHeroesDetail: View {
    var heroName: String = ""
    var heroattribute: String = ""
    var body: some View {
        
        VStack{
            Text(heroName)
            Text(heroattribute)
        }
    }
}

struct DotaHeroesDetail_Previews: PreviewProvider {
    static var previews: some View {
        DotaHeroesDetail()
    }
}
