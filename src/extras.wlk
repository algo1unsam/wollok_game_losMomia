import faraon.*
import momia.*

object izquierda {

	method siguiente(position) {
		return position.left(1)
	}

	method esIzquierda() = true

	method esDerecha() = false

	method esArriba() = false

	method esAbajo() = false

	method validarMover(personaje) {
		if (personaje.position().x() < 1) {
			personaje.caminaIzquierda(0)
			personaje.error("no puedo moverme mas a la izquierda")
		}
	}

}

object derecha {

	method siguiente(position) {
		return position.right(1)
	}

	method esIzquierda() = false

	method esDerecha() = true

	method esArriba() = false

	method esAbajo() = false

	method validarMover(personaje) {
		if (personaje.position().x() > 17) {
			personaje.caminaDerecha(0)
			personaje.error("no puedo moverme mas a la derecha")
		}
	}

}

object arriba {

	method esIzquierda() = false

	method esDerecha() = false

	method esArriba() = true

	method esAbajo() = false

	method siguiente(position) {
		return position.up(1)
	}

	method validarMover(personaje) {
		personaje.caminaDerecha(0)
		personaje.caminaIzquierda(0)
		if (not personaje.hayEscaleraArriba()) {
			personaje.error("para subir necesito una escalera")
		}
	}

}

object abajo {

	method esIzquierda() = false

	method esDerecha() = false

	method esArriba() = false

	method esAbajo() = true

	method siguiente(position) {
		return position.down(1)
	}

	method validarMover(personaje) {
		personaje.caminaDerecha(0)
		personaje.caminaIzquierda(0)
		if (not personaje.hayEscaleraAbajo()) {
			personaje.error("para bajar necesito una escalera")
		}
	}

}

