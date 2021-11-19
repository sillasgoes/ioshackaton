//
//  NewFunView.swift
//  depFun
//
//  Created by Evosystems on 08/09/21.
//

import SwiftUI


struct NewFunView: View {
	@EnvironmentObject var viewModel: FunViewModel
	@Binding var isPresented : Bool
	@Binding var nome : String
	@Binding var rg :  Int
	@Binding var id_departamento : Int
	
	@State var isAlert = false

	var body: some View {
		NavigationView{
			ZStack{
				Color.gray.opacity(0.1).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
				VStack(alignment: .leading){
					Text("Novo Funcionario").font(Font.system(size:16, weight: .bold))
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

					TextField("Departamento", value: $id_departamento, formatter: NumberFormatter())
						.padding()
						.background(Color.white)
						.cornerRadius(6)
						.padding()
					
					Spacer()
				}.padding()
				.navigationBarBackButtonHidden(true)

				.alert(isPresented: $isAlert, content: {
					let title = Text("Sem dados")
					let message = Text("Por favor digite Nome e Rg")
					return Alert(title: title, message: message)
				})
				
			}
			.navigationBarTitle("Funcionarios", displayMode: .inline)
			.navigationBarItems(leading: leading, trailing: trailing)

		}
	}


var leading: some View {
	Button(action: {
		isPresented.toggle()
	}, label: {
		Text("Cancelar")
	})
}

var trailing: some View {
	Button(action: {
		if nome != "" {
			let parameters: [String: Any] = ["nome": nome, "rg": rg , "id_departamento" : id_departamento ]
			viewModel.createFun(parameters: parameters)
			viewModel.fetchFun()
			
			isPresented.toggle()
		}else{
			isAlert.toggle()
		}
	}, label: {
		Text("Salvar")
	})
}

}
