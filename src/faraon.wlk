import wollok.game.*
import objetos.*

object faraon {

	var property position=game.at(5, 0)
	
	method image() {
		return "faraon_quieto_adelante.png"
	}
	
	method mover(direccion) {
		position=direccion.siguiente(position)
	}

}

object izquierda {
	method siguiente(position) {
		return 	position.left(1)
	}
}

object derecha {
	method siguiente(position) {
		return 	position.right(1)		
	}	
}

object abajo {
	
	method siguiente(position) {
		//if(self.position() == colliders(escalera)){
		//return position.down(1)
		//}
		//else{
		//	return 0
		
	
			return position.down(2) 
			
	}
	
}

object arriba {
	method siguiente(position) {
		if(game.colliders(self)== escalera1){
		return position.up(2)
		}
		return position
	}
		
}