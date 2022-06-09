import wollok.game.*
import faraon.*



object cuenta {

	var property listaCuenta = []
	var property listaResultado = []


	method mostrar() {
		const cuenta1 = new Cuenta(position = game.at(5, 0) , nro1= (1..100).anyOne() , nro2= (1..100).anyOne())
		const cuenta2 = new Cuenta(position = game.at(16, 0) , nro1= (1..100).anyOne() , nro2= (1..100).anyOne() )
		const cuenta3 = new Cuenta(position = game.at(1, 2) , nro1= (1..100).anyOne() , nro2= (1..100).anyOne() )
		const cuenta4 = new Cuenta(position = game.at(13, 4), nro1= (1..100).anyOne() , nro2= (1..100).anyOne() )
		const cuenta5 = new Cuenta(position = game.at(1, 6) , nro1= (1..100).anyOne() , nro2= (1..100).anyOne() )
		const cuenta6 = new Cuenta(position = game.at(8, 6) , nro1= (1..100).anyOne() , nro2= (1..100).anyOne() )


		const resultado1 = new Resultado(position = game.at(2, 0) , total= cuenta1.total() )
		const resultado2 = new Resultado(position = game.at(11, 0), total= cuenta2.total()  )
		const resultado3 = new Resultado(position = game.at(16, 2) , total= cuenta3.total()  )
		const resultado4 = new Resultado(position = game.at(11, 2), total= cuenta4.total()  )
		const resultado5 = new Resultado(position = game.at(5, 4) , total= cuenta5.total()  )
		const resultado6 = new Resultado(position = game.at(16, 6) , total= cuenta6.total()  )

 

		listaCuenta.add(cuenta1)
		listaCuenta.add(cuenta2)
		listaCuenta.add(cuenta3)
		listaCuenta.add(cuenta4)
		listaCuenta.add(cuenta5)
		listaCuenta.add(cuenta6)
		
		listaResultado.add(resultado1)
		listaResultado.add(resultado2)
		listaResultado.add(resultado3)
		listaResultado.add(resultado4)
		listaResultado.add(resultado5)
		listaResultado.add(resultado6)
		
		
		const listaDeResultados = listaCuenta.map({ cuenta => cuenta.total()})
		
		listaCuenta.forEach({ cuenta => game.addVisual(cuenta)})
		listaResultado.forEach({ resultado => game.addVisual(resultado)})
		
		
	}


}

//CUENTA
class Cuenta {

	var property nro1 = 0
	var property nro2 = 0

	var property total = nro1 + nro2

	var property position

	method image() {
		return "cuenta.png"
	}


	method text(){
//		return ''+nro1+ ' ' +operacion+ ' ' +nro2+'' con operacion
		return ''+nro1+ ' + ' +nro2+'' // solo suma

	} 
}




//RESULTADO

class Resultado {

	var property nro1 = 0
	var property nro2 = 0

	var property total = nro1 + nro2

  var property position
 
	method image() {
		
		return "cuenta.png"
	}


	method text(){
	 
		return ''+total+'' 

	} 
}