//
//  HomeView.swift
//  depFun
//
//  Created by Evosystems on 08/09/21.
//

import SwiftUI

struct DepHomeView: View {
	@EnvironmentObject var viewModel: DepViewModel
	@State var isPresentedNovoDep = false
	@State var sigla = ""
	@State var departamento = ""
	@State var nome = ""
	
   func filtro(id: Int) -> [DepJoin]{
		viewModel.joins.filter{ item in
			let a = item.id_departamento == id
			return a
		}
	}
	
  	var body : some View {
		
		NavigationView {
			List{

				ForEach(viewModel.items, id: \.id){ item in
				 
				 NavigationLink(
					
					destination: DetailView(item: filtro(id: item.id)),
					label:{
						VStack(alignment: .leading){
							Text(item.sigla)
							Text("")
							Text(item.departamento)
							 
							
					   }
					})
				 
				 }
				.onDelete(perform: deleteDep)
			 
				 
			
			}
			
			.listStyle(InsetListStyle())
			.navigationBarTitle("Departamentos")
			.navigationBarItems(trailing: plusButton)
			.navigationBarBackButtonHidden(true)
		 
		}
	 
		.frame(width: 340, height: 680, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .sheet(isPresented: $isPresentedNovoDep, content: {
			NewDepView(isPresented: $isPresentedNovoDep, sigla: $sigla, departamento: $departamento)
		})
		 
		
	}
	
  
	
	
	
	private func deleteDep(indexSet: IndexSet){
		let id = indexSet.map {viewModel.items[$0].id}
		DispatchQueue.main.async {
			let parameters: [String: Any] = ["id": id[0]]
			self.viewModel.deleteDep(parameters: parameters)
			self.viewModel.fetchDep()
		}
	}


var plusButton: some View {
	Button(action: {
		isPresentedNovoDep.toggle()
	}, label: {
		Image(systemName: "plus")
	})
}

}

struct DepHomeView_Previews: PreviewProvider {
    static var previews: some View {
		DepHomeView()
			.environmentObject(DepViewModel())
    }
}
