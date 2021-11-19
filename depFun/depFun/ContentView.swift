//
//  ContentView.swift
//  depFun
//
//  Created by Evosystems on 07/09/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
	@State var showDetails: Bool = false
	var body : some View {
	 
		VStack(alignment: .center){
			HStack{
				Text("Sillas Góes")
					.bold()
					.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
				Text("/")
					.bold()
				Text("Evo Systems")
					.bold()
					.foregroundColor(.gray)
				
			}.frame(width: 220, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
			.padding(.all, 2)
			.padding(.top, -30)
			.font(.subheadline)
			
			 NavigationView{
				List{
				  NavigationLink(
					destination: DepHomeView(),
						label:{
							VStack(alignment: .leading){
								Text("Departamentos")
									.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
									
							}.padding()
						})
					
					.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
					
					NavigationLink(
						destination: FunHomeView() ,
						label:{
							VStack(alignment: .leading){
								Text("Funcionários")
									.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
							}.padding()
						})
						.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
				   }
					 
                 .navigationBarHidden(true)
				
				
			}.frame(width: 350, height: 660, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
			
		}
		  

	}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			ContentView()
				.environmentObject(DepViewModel())
				.environmentObject(FunViewModel())
		 
		}
    }
}
