import wollok.game.*
import faraon.*
import momia.*



class Objeto {
	var property position
	method image()
	method cambiarPosicion(){position = game.at(20, 20)}
	method aparece(){game.addVisual(self)}
	method ejecutarAccion(){
		game.removeVisual(self)
		self.cambiarPosicion()
//		game.sound( self+".mp3" ).play()
	}
}

class Tumba inherits Objeto {
	override method image() {
		return "tumba.png"
	}
	override method ejecutarAccion(){
		super()
		game.removeTickEvent("momiaStop")
		momia.reiniciar()
		game.sound("tumba.mp3").play()
	}
}
class Campana inherits Objeto {
	override method image() {
		return "campana.png"
	}
	override method ejecutarAccion(){
		super()
		game.sound(  "campana.mp3").play()
		momia.cambiarVelocidad(500)
	}
}
class Reloj inherits Objeto {
	override method image() {
		return "reloj.png"
	}
	override method ejecutarAccion(){
		super()
		game.sound( "reloj.mp3").play()
		momia.cambiarVelocidad(2000)
	}
}

object objetos {

		var property listaPosicion = [game.at(4, 0) , game.at(7, 0) , game.at(13, 0) , game.at(4, 2), game.at(13, 2), game.at(7, 4), game.at(5, 6) , game.at(9, 6)]
	
		const property tumba = new Tumba(position = self.elegirPosicion() )
		const property reloj = new Reloj(position = self.elegirPosicion() )
		const property campana = new Campana(position = self.elegirPosicion() )
		
	var property listaObjetos = [tumba, reloj, campana]

	
	method mostrar() {
		listaObjetos.forEach({ unObjeto => game.addVisual(unObjeto)})
	}
	
	method elegirPosicion() {
		const posicionElegida = listaPosicion.anyOne()
		listaPosicion.remove(posicionElegida)
		return posicionElegida
	}
	

}
 


//VENTANAS
object ventana {

	const listaVentana = []

	method crear(x, y) {
		listaVentana.add(new Ventana(position = game.at(x, y)))
	}

	method cargar() {
		self.crear(13, 6)
		self.crear(6, 2)
		self.crear(15, 0)
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

//ESCALERA
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

