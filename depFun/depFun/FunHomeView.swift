//
//  FunHomeView.swift
//  depFun
//
//  Created by Evosystems on 08/09/21.
//

import SwiftUI

struct FunHomeView: View {
	@EnvironmentObject var viewModel: FunViewModel
	@State var isPresentedNovoFun = false
	@State var nome = ""
	@State var id_departamento: Int = 0
	@State var rg: Int = 0

	
	var body : some View {
		NavigationView {
			List{
				ForEach(viewModel.items, id: \.id) { item in
				NavigationLink(
					destination: FunDetailView(item: item),
					label:{
					 
						VStack(alignment: .leading){
							Text(item.nome)
							Text("\(item.id_departamento)")
							 
							
						}
					})
				}.onDelete(perform: deleteFun)
			}
			.listStyle(InsetListStyle())
			.navigationBarTitle("Funcionários")
			.navigationBarItems(trailing: plusButton)
			  
		}.frame(width: 340, height: 600, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
		.padding(.top, -50 )
		
		.sheet(isPresented: $isPresentedNovoFun, content: {
			NewFunView(isPresented: $isPresentedNovoFun, nome: $nome, rg: $rg, id_departamento: $id_departamento)
		})
		
	}
	
	private func deleteFun(indexSet: IndexSet){
		let id = indexSet.map {viewModel.items[$0].id}
		DispatchQueue.main.async {
			let parameters: [String: Any] = ["id": id[0]]
			self.viewModel.deleteFun(parameters: parameters)
			self.viewModel.fetchFun()
		}
	}


var plusButton: some View {
	Button(action: {
		isPresentedNovoFun.toggle()
	}, label: {
		Image(systemName: "plus")
	})
}

}

struct FunHomeView_Previews: PreviewProvider {
	static var previews: some View {
		FunHomeView().environmentObject(FunViewModel())
	}
}

