import wollok.game.*
import objetos.*

object faraon {

	var property position=game.at(5, 0)
	var property caminaDerecha
	var property caminaIzquierda
	
	method image() {
		if(caminaDerecha==1){return "faraon_camina_derecha_1.png"}
		if(caminaDerecha==2){return "faraon_camina_derecha_2.png"}
		if(caminaDerecha==3){return "faraon_camina_derecha_3.png"}
		if(caminaDerecha==4){return "faraon_camina_derecha_4.png"}
		if(caminaDerecha==5){return "faraon_camina_derecha_5.png"}
		if(caminaIzquierda==1){return "faraon_camina_izquierda_1.png"}
		if(caminaIzquierda==2){return "faraon_camina_izquierda_2.png"}
		if(caminaIzquierda==3){return "faraon_camina_izquierda_3.png"}
		if(caminaIzquierda==4){return "faraon_camina_izquierda_4.png"}
		if(caminaIzquierda==5){return "faraon_camina_izquierda_5.png"}
		else return "faraon_quieto_adelante.png"
	}
	
	method moverIzquierda() {
		
		caminaDerecha=0
	 	self.image()
		
		if(self.position().x()<1)  {
			caminaIzquierda=0
			self.image()
			self.error("no puedo moverme más a la izquierda")
		}
		else {if(caminaIzquierda==1){
						caminaIzquierda++
						self.image()
						position=position.left(1)
					}
					
					else if(caminaIzquierda==2){
						caminaIzquierda++
						self.image()
						position=position.left(1)
					}
					
					else if(caminaIzquierda==3){
						caminaIzquierda++
						self.image()
						position=position.left(1)
					}
					
					else if(caminaIzquierda==4){
						caminaIzquierda++
						self.image()
						position=position.left(1)
					}
			
					else {
						caminaIzquierda=1
						self.image()
						position=position.left(1)
			
					}}
	}
	
	method moverDerecha() {
		
		caminaIzquierda=0
		self.image()
		
		if(self.position().x()>17)  {
			caminaDerecha=0
			self.image()
			self.error("no puedo moverme más a la derecha")
		}
		else {
					
					
					if(caminaDerecha==1){
						caminaDerecha++
						self.image()
						position=position.right(1)
					}
					
					else if(caminaDerecha==2){
						caminaDerecha++
						self.image()
						position=position.right(1)
					}
					
					else if(caminaDerecha==3){
						caminaDerecha++
						self.image()
						position=position.right(1)
					}
					
					else if(caminaDerecha==4){
						caminaDerecha++
						self.image()
						position=position.right(1)
					}
			
					else {
						caminaDerecha=1
						self.image()
						position=position.right(1)
			
					}
		
		}
	}
	
	method moverArriba() {
		caminaDerecha=0
		caminaIzquierda=0
		self.image()
		self.error("para subir necesito una escalera")
		//{position=position.up(1)}
	}
	
	method moverAbajo() {
		caminaDerecha=0
		caminaIzquierda=0
		self.image()
		self.error("para bajar necesito una escalera")
		//{position=position.down(1)}
	}
	
	}
	
//	method mover(direccion) {
//		position=direccion.siguiente(position)
//	}
//
//}
//
//object izquierda {
//	method siguiente(position) {
//		return 	position.left(1)
//	}
//}
//
//object derecha {
//	method siguiente(position) {
//		return 	position.right(1)		
//	}	
//}
//
//object abajo {
//	
//	method siguiente(position) {
//		//if(self.position() == colliders(escalera)){
//		//return position.down(1)
//		//}
//		//else{
//		//	return 0
//		
//	
//			return position.down(2) 
//			
//	}
//	
//}
//
//object arriba {
//	method siguiente(position) {
//		if(game.colliders(self)== escalera1){
//		return position.up(2)
//		}
//		return position
//	}
//		
//}