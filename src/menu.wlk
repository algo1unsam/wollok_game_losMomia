import wollok.game.*
import faraon.*
import momia.*
import objetos.*
import cuentas.*

object menu {
	
	method image()="INTRO.jpg"
	method position()=game.origin()	
	method ejecutar()=game.addVisual(self)
	method ocultar()=game.removeVisual(self)
	
}

object juego {
	
	method empezar(){
		
	menu.ocultar()
			//ventanas
	ventana.mostrar()
	
	//escaleras
	escalera.mostrar()
	
	//escalera abajo
	escaleraAbajo.mostrar()
	
	// 	CUENTAS
	cuentas.mostrar()
	
	// FARAON

	momia.start()
	

 	//personaje principal 
	game.addVisual(faraon) //img en 250px

	keyboard.left().onPressDo(  { faraon.moverIzquierda() } )
	keyboard.right().onPressDo(  { faraon.moverDerecha() } )
	keyboard.up().onPressDo(  { faraon.moverArriba() } )
	keyboard.down().onPressDo(  { faraon.moverAbajo() } )

	keyboard.space().onPressDo(  { faraon.cuentasFaraon() } )
		
	}
	
}
