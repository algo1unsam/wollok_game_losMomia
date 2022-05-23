import wollok.game.*
import objetos.*

object faraon {

	var property position=game.at(0, 0)
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
// otra forma para que suba en todas las escaleras(supongo que colisiona solo con una escalera)		
//		if (escalera.listaEscalera().contains(game.colliders(self).get(0))){
//			position=position.up(2)
//		}

		if (  game.colliders(self).fold(false, {acum, element => escalera.listaEscalera().contains(element) or acum })    ){
			position=position.up(2)
		}
		else{		
//		caminaDerecha=0
//		caminaIzquierda=0
//		self.image()
		self.error("para subir necesito una escalera")
		}
		
	}
	

	
	method moverAbajo() {
		
		caminaDerecha=0
		caminaIzquierda=0
		self.image()
		if (  game.colliders(self).fold(false, {acum, element => escaleraAbajo.listaEscaleraAbajo().contains(element) or acum })    ){
			position=position.down(2)
		}
		else{			
//		caminaDerecha=0
//		caminaIzquierda=0
//		self.image()
		self.error("para bajar necesito una escalera")
		}

	}
	
}
	
