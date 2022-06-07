import wollok.game.*
import faraon.*

object cuenta {

	var property listaCuenta = []

	method crear(x, y) {
		listaCuenta.add(new Cuenta(position = game.at(x, y)))
	}

	method cargar() {
		self.crear(5, 0)
		self.crear(16, 0)
		self.crear(1, 2)
		self.crear(13, 4)
		self.crear(1, 6)
		self.crear(8, 6)
	}

	method mostrar() {
		self.cargar()
		listaCuenta.forEach({ cuenta => game.addVisual(cuenta)})
	}


}

//CUENTA
class Cuenta {

	var property nro1 = (5..10).anyOne()
	var property nro2 = (50..100).anyOne()
	
//	const operacion = {1, 2, 3}.anyOne()

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


object resultado {

	const property listaResultado = []

	method crear(x, y) {
		listaResultado.add(new Resultado(position = game.at(x, y)))
	}

	method cargar() {
		self.crear(2, 0)
		self.crear(11, 0)
		self.crear(16, 2)
		self.crear(11, 2)
		self.crear(5, 4)
		self.crear(16, 6)
	}

	method mostrar() {
		self.cargar()
		listaResultado.forEach({ resultado => game.addVisual(resultado)})
	}



}


//RESULTADO

class Resultado {

	var property nro1 = (5..10).anyOne()
	var property nro2 = (50..100).anyOne()
//	const operacion = {1, 2, 3}.anyOne()

	var property total = nro1 + nro2

  var property position
 
	method image() {
		
		return "cuenta.png"
	}


	method text(){
	 	
//	 	total = cuenta.listaCuenta().map({ cuenta => cuenta.total() }).first()
	 	
	 
		return ''+total+''  // solo suma

	} 
}