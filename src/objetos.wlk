import wollok.game.*
import faraon.*

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

}

// ventanas posiciones
// y,x
// 15,6
// 15,2
// 2,6
// 2,2
//
//object ventana1 {
//	var property position=game.at(15, 6) 
//	method image() {return "ventana2.png"}
//}
//
//object ventana3 {
//	var property position=game.at(2, 6) 
//	method image() {return "ventana2.png"}
//}
//
//object ventana2 {
//	var property position=game.at(15, 2) 
//	method image() {return "ventana.png"}
//}
//object ventana4 {
//	var property position=game.at(2, 2) 
//	method image() {return "ventana.png"}
//}
class Ventana {

	var property position

	method image() = "ventana.png"
}
//posiciones escaleras
//5,0
//5,2
//5,4
//13,0
//13,4
//17,2
//9,2
object escalera3 {

	var property position = game.at(5, 4)

	method image() {
		return "escalera.png"
	}

}

//object escalera2{
//	var property position=game.at(5,2)
//	method image() {return "escalera.png"}
//}
object escalera1 {

	var property position = game.at(5, 0)

	method image() {
		return "escalera2.png"
	}

}

object escalera5 {

	var property position = game.at(13, 4)

	method image() {
		return "escalera.png"
	}

}

object escalera6 {

	var property position = game.at(17, 2)

	method image() {
		return "escalera.png"
	}

}

object escalera7 {

	var property position = game.at(9, 2)

	method image() {
		return "escalera.png"
	}

}

object escalera4 {

	var property position = game.at(13, 0)

	method image() {
		return "escalera2.png"
	}

}

object escalera_abajo1 {

	var property position = game.at(5, 2)

	method image() {
		return "escalera_abajo.png"
	}

}

object escalera_abajo2 {

	var property position = game.at(5, 6)

	method image() {
		return "escalera_abajo.png"
	}

}

object escalera_abajo3 {

	var property position = game.at(9, 4)

	method image() {
		return "escalera_abajo.png"
	}

}

object escalera_abajo4 {

	var property position = game.at(13, 2)

	method image() {
		return "escalera_abajo.png"
	}

}

object escalera_abajo5 {

	var property position = game.at(13, 6)

	method image() {
		return "escalera_abajo.png"
	}

}

object escalera_abajo6 {

	var property position = game.at(17, 4)

	method image() {
		return "escalera_abajo.png"
	}

}

