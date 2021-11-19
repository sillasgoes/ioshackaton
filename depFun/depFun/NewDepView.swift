//
//  NewDepView.swift
//  depFun
//
//  Created by Evosystems on 07/09/21.
//

import SwiftUI

struct NewDepView: View {
	@EnvironmentObject var viewModel: DepViewModel
	@Binding var isPresented : Bool
	@Binding var sigla : String
	@Binding var departamento : String
	@State var isAlert = false

    var body: some View {
		NavigationView{
			ZStack{
				Color.gray.opacity(0.1).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
				VStack(alignment: .leading){
					Text("Novo Departamento").font(Font.system(size:16, weight: .bold))
						.padding()
					TextField("Sigla", text: $sigla)
						.padding()
						.background(Color.white)
						.cornerRadius(6)
						.padding()
					
					TextField("Departamento", text: $departamento)
						.padding()
						.background(Color.white)
						.cornerRadius(6)
						.padding()
					
					Spacer()
				}.padding()
				.alert(isPresented: $isAlert, content: {
					let title = Text("Sem dados")
					let message = Text("Por favor digite Sigla e Departamento")
					return Alert(title: title, message: message)
				})
				
			}
			.navigationBarTitle("Departamento", displayMode: .inline)
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
		if sigla != "" && departamento != ""{
			let parameters: [String: Any] = ["sigla": sigla, "departamento": departamento]
			viewModel.createDep(parameters: parameters)
			viewModel.fetchDep()
			
			isPresented.toggle()
		}else{
			isAlert.toggle()
		}
	}, label: {
		Text("Salvar")
	})
}

}


/*struct NewDepView_Previews: PreviewProvider {
    static var previews: some View {
        NewDepView()
    }
}

*/
