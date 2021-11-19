//
//  FunDetailView.swift
//  depFun
//
//  Created by Evosystems on 08/09/21.
//


import SwiftUI

struct FunDetailView: View {
	@EnvironmentObject var viewModel: FunViewModel
	@Environment(\.presentationMode) var presentationMode
	@State var nome = ""
	@State var id_departamento: Int = 0
	@State var rg: Int = 0
	@State var id: Int = 0
	let item: FunModel
	//let items: [FunModel]
	var body: some View {
		
		ZStack{
			Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
			VStack(alignment: .leading){
				Text("Editar Funcionario").font(Font.system(size:16, weight: .bold))
					.padding()
				TextField("Nome", text: $nome)
					.padding()
					.background(Color.white)
					.cornerRadius(6)
					.padding()
				

				TextField("Rg", value: $rg, formatter: NumberFormatter() )
					.padding()
					.background(Color.white)
					.cornerRadius(6)
					.padding()
      
				TextField("Departamento", value: $id_departamento, formatter: NumberFormatter() )
					.padding()
					.background(Color.white)
					.cornerRadius(6)
					.padding()
				
				Spacer()
			}.padding()
			.onAppear(perform: {
				self.nome = item.nome
     			self.id_departamento = item.id_departamento
				self.rg = item.rg
			})
			
		}
		.navigationBarTitle("Funcionários", displayMode: .inline)
		.navigationBarItems(trailing: trailing)

	}
	
	
	var trailing: some View {
		Button(action: {
			
			if nome != "" {
				presentationMode.wrappedValue.dismiss()
				let parameters: [String: Any] = ["nome": nome, "id": item.id, "id_departamento": item.id_departamento, "rg": item.rg]
				viewModel.updateFun(parameters: parameters)
				viewModel.fetchFun()
			}
		}, label: {
			Text("Salvar")
		})
	}

}
