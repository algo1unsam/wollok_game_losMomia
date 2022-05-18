import wollok.game.*
import faraon.*


//VENTANAS
object ventana {

	const listaVentana = []

	method crear(x, y) {
		listaVentana.add(new Ventana(position = game.at(x, y)))
	}

	method cargar() {
		self.crear(15, 6)
		self.crear(15, 2)
		self.crear(2, 6)
		self.crear(2, 2)
	}

	method mostrar() {
		self.cargar()
		listaVentana.forEach({ ventana => game.addVisual(ventana)})
	}

// ventanas posiciones
// y,x
// 15,6
// 15,2
// 2,6
// 2,2
//
}

class Ventana {

	var property position

	method image() = "ventana.png"
}
//VENTANAS


//ESCALERAS

object escalera {

	
	const property listaEscalera = []

	method crear(x, y) {
		listaEscalera.add(new Escalera(position = game.at(x, y)))
	}

	method cargar() {
		self.crear(5, 0)
		self.crear(5, 4)
		self.crear(13, 0)
		self.crear(13, 4)
		self.crear(17, 2)
		self.crear(9, 2)
		
//posiciones escaleras
//5,0
//5,2
//5,4
//13,0
//13,4
//17,2
//9,2

	}

	method mostrar() {
		self.cargar()
		listaEscalera.forEach({ escalera => game.addVisual(escalera)})
	}

}

class Escalera {

	var property position

	method image() = "escalera.png"
}


//ESCALERAS

//ESCALERAS ABAJO

object escaleraAbajo {

	
	const property listaEscaleraAbajo = []

	method crear(x, y) {
		listaEscaleraAbajo.add(new EscaleraAbajo(position = game.at(x, y)))
	}

	method cargar() {
		self.crear(5, 2)
		self.crear(5, 6)
		self.crear(9, 4)
		self.crear(13, 2)
		self.crear(13, 6)
		self.crear(17, 4)
	}

	method mostrar() {
		self.cargar()
		listaEscaleraAbajo.forEach({ escaleraAbajo => game.addVisual(escaleraAbajo)})
	}

}

class EscaleraAbajo {

	var property position

	method image() = "escalera_abajo.png"
}


//ESCALERAS ABAJO
