import wollok.game.*
import faraon.*
import momia.*
import objetos.*
import cuentas.*
import extras.*

object menu {

	method image() = "INTRO.jpg"

	method position() = game.origin()

	method ejecutar() = game.addVisual(self)

	method ocultar() = game.removeVisual(self)

}

object juego {

	method empezar() {
		menu.ocultar()
			// ventanas
		ventana.mostrar()
			// escaleras
		escalera.mostrar()
			// escalera abajo
		escaleraAbajo.mostrar()
			// CUENTAS
		cuentas.mostrar()
			// FARAON
		momia.start()
			// mostrar puntaje
		game.addVisual(puntosDelFaraon)
			// personaje principal 
		game.addVisual(faraon) // img en 250px
		keyboard.left().onPressDo({ faraon.mover(izquierda)})
		keyboard.right().onPressDo({ faraon.mover(derecha)})
		keyboard.up().onPressDo({ faraon.mover(arriba)})
		keyboard.down().onPressDo({ faraon.mover(abajo)})
		keyboard.space().onPressDo({ faraon.cuentasFaraon()})
		cruz.aparece()
		campana.aparece()
		reloj.aparece()
	}

}

