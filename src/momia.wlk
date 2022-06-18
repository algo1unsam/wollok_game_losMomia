import wollok.game.*
import faraon.*
import objetos.*
import extras.*

object momia {

	var property position = game.at(9, 8)
	var property contador = 0

	method image() {
		if (contador == 0) {
			return "momia_tumba_abierta_1.png"
		}
		if (contador == 1) {
			return "momia_tumba_abierta_2.png"
		}
		if (contador == 2) {
			return "momia_sale1.png"
		} else return "momia_quieta_adelante.png"
	}

	method start() {
		game.schedule(3000, { => game.addVisual(self)})
		game.schedule(4000, { => contador++})
		game.schedule(5000, { => contador++})
		game.schedule(6000, { => contador++})
		game.schedule(7000, { => contador++})
		game.schedule(8000, { => position = position.left(1)})
		game.schedule(9000, { => position = position.left(1)})
		game.schedule(10000, { => position = position.down(1)})
		game.schedule(11000, { => position = position.down(1)})
		game.schedule(12000, { => game.onTick(1000, "momiaStop", { => self.perseguir()})}) 
	}

	method verificarMismaPosicion() {
		if (self.position() == faraon.position()) {
			perder.ejecutar()
		}
	}

	method distancia(una) {
		return if (self.position().x() > una.position().x()) {
			self.position().x() - una.position().x()
		} else {
			una.position().x() - self.position().x()
		}
	}

	method unaEscaleraAbajoMismoPiso() {
		return escaleraAbajo.listaEscaleraAbajo().filter({ unaEscalera => unaEscalera.position().y() == self.position().y() }).min({ una => self.distancia(una) })
	}

	method unaEscaleraArribaMismoPiso() {
		return escalera.listaEscalera().filter({ unaEscalera => unaEscalera.position().y() == self.position().y() }).min({ una => self.distancia(una) })
	}

	method bajarEscalera() {
		if (game.colliders(self).fold(false, { acum , element => escaleraAbajo.listaEscaleraAbajo().contains(element) or acum })) {
			game.removeTickEvent("momiaStop")
			position = position.down(2)
			game.onTick(1000, "momiaStop", { => self.perseguir()}) 
		}
	}

	method subirEscalera() {
		if (game.colliders(self).fold(false, { acum , element => escalera.listaEscalera().contains(element) or acum })) {
			game.removeTickEvent("momiaStop")
			position = position.up(2)
			game.onTick(1000, "momiaStop", { => self.perseguir()}) 
		}
	}

	method perseguir() {
		self.verificarMismaPosicion()
//		si estoy en el mismo piso, me fijo si esta a mi izquierda o derecha y me muevo
		if (self.position().y() == faraon.position().y()) {
			if (self.position().x() > faraon.position().x()) {
				game.schedule(1000, { => position = position.left(1)})
			} else {
				game.schedule(1000, { => position = position.right(1)})
			}
		} // momia arriba del faraon
		else if (self.position().y() > faraon.position().y()) {
			if (self.position().x() > self.unaEscaleraAbajoMismoPiso().position().x()) {
				game.schedule(1000, { => position = position.left(1)})
				self.bajarEscalera()
			} else {
				game.schedule(1000, { => position = position.right(1)})
				self.bajarEscalera()
			}
		} else { // faraon arriba de la momia
			if (self.position().x() > self.unaEscaleraArribaMismoPiso().position().x()) {
				game.schedule(1000, { => position = position.left(1)})
				self.subirEscalera()
			} else {
				game.schedule(1000, { => position = position.right(1)})
				self.subirEscalera()
			}
		}
	}

}

