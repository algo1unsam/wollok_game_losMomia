import wollok.game.*
import faraon.*
import objetos.*

object momia {

	var property position = game.at(9, 8) // arranca aca

	method image() {
		return "momia_quieta_adelante.png"
	}

	method start() {
		game.schedule(3000, { => game.addVisualCharacter(self)})
		
		game.schedule(5000, { => position=position.left(1) })
		game.schedule(7000, { => position=position.left(1) })
		game.schedule(9000, { => position=position.down(1) })
		game.schedule(10000, { => position=position.down(1) })
		
		game.schedule(13000, { => game.onTick(1000, "momiaStop", { => self.perseguir() })})
		
//		self.perseguir()
		
	}
	
//			self.error("estas en el mismo piso!")
	
	method perseguir(){
		
//		si estoy en el mismo piso, me fijo si esta a mi izquierda o derecha y me muevo
		if(self.position().y() == faraon.position().y()){
			if(self.position().x() > faraon.position().x()){
				game.schedule(1000, { => position=position.left(1) })
			}
			else{
				game.schedule(1000, { => position=position.right(1) })
			}
		}
		else if (self.position().y() > faraon.position().y()) {
			
//			si la momia esta encima del faraon
			// if ( self.position().x() > escalera.position().x() ){
				
//				game.schedule(1000, { => position=position.left(1) })
//			}
//			else {
//				game.schedule(1000, { => position=position.right(1) })
//			}

			
			

			if (  game.colliders(self).fold(false, {acum, element => escaleraAbajo.listaEscaleraAbajo().contains(element) or acum })    ){
			position=position.down(2)
		}
			
		}
		
		
	}

}

