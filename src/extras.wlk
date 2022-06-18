import faraon.*
import momia.*

object izquierda {

	method siguiente(position) {
		return position.left(1)
	}

	method esIzquierda() = true

}

object derecha {

	method siguiente(position) {
		return position.right(1)
	}

	method esIzquierda() = false

}

object arriba {

	method siguiente(position) {
		return position.up(1)
	}

}

object abajo {

	method siguiente(position) {
		return position.down(1)
	}

}

