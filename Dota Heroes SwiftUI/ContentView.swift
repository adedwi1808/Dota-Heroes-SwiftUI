//
//  ContentView.swift
//  Dota Heroes SwiftUI
//
//  Created by Ade Dwi Prayitno on 02/10/22.
//

import SwiftUI

struct ContentView: View {
   
    private let dotaServices: DotaServices = DotaServices()
    private let prefs: UserDefaults = UserDefaults()
//    @State private var dotaHeroes = [String:[DotaModelElement]]()
    @State var heroName: String = ""
    @State var heroAttribute: String = ""
    @State var isNavigate: Bool = false
    @State private var dotaHeroes: DotaModel = []
    
    var body: some View {
        ScrollView {
            NavigationLink(destination: DotaHeroesDetail(heroName: heroName, heroattribute: heroAttribute), isActive: $isNavigate, label: {EmptyView()})
            
            LazyVStack(alignment: .leading, spacing: 20) {
                    ForEach(dotaHeroes, id: \.id) { hero in
                        Button {
                            self.heroName = hero.localizedName
                            self.heroAttribute = hero.primaryAttr
                            isNavigate = true
                        } label: {
                            Text(hero.localizedName)
                        }
                        Divider()
                }
            }
        }
        .padding()
        .onAppear {
            getDotaHeroesFromRemote()
            dotaHeroes = getDotaHeroesDataFromLocale()
        }
    }
}

extension ContentView {
    func getDotaHeroesFromRemote() {
        Task {
            do{
                let dotaHeroesData = try await dotaServices.getHeroes(endPoint: .getHeroes)
                setDotaHeroesToLocale(data: dotaHeroesData)
            }catch{
                print(error)
            }
        }
    }
    
    func setDotaHeroesToLocale(data: DotaModel) {
        prefs.setDataToLocal(data.self, with: .dotaHeroes)
    }
    
    func getDotaHeroesDataFromLocale() -> DotaModel {
        prefs.getDataFromLocal(DotaModel.self, with: .dotaHeroes) ?? DotaModel()
    }
    
//    func classifyDotaHeroesData(data: DotaModel) -> [String : [DotaModelElement]] {
//        var res = [String : [DotaModelElement]]()
//        data.forEach {
//            if res[$0.primaryAttr] == nil {res[$0.primaryAttr] = []}
//            res[$0.primaryAttr]?.append($0)
//        }
//        return res
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
