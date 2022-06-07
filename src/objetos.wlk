import wollok.game.*
import faraon.*


//VENTANAS
object ventana {

	const listaVentana = []

	method crear(x, y) {
		listaVentana.add(new Ventana(position = game.at(x, y)))
	}

	method cargar() {
		self.crear(13, 6)
		self.crear(6, 2)
		self.crear(14, 0)
	}

	method mostrar() {
		self.cargar()
		listaVentana.forEach({ ventana => game.addVisual(ventana)})
	}

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
		self.crear(9, 0)
		self.crear(11, 4)
		self.crear(3, 2)
		self.crear(15, 2)
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
		self.crear(9, 2)
		self.crear(3, 4)
		self.crear(15, 4)
		self.crear(11, 6)
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
