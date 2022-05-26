import wollok.game.*


//CUENTA 1
object cuenta1 {

	var property nro1 = (10..50).anyOne()
	var property nro2 = (50..100).anyOne()
//	const operacion = {1, 2, 3}.anyOne()

	var property total = nro1 + nro2

	var property position = game.at(0, 2)

	method image() {
		return "cuenta.png"
	}


	method text(){
//		return ''+nro1+ ' ' +operacion+ ' ' +nro2+'' con operacion
		return ''+nro1+ ' + ' +nro2+'' // solo suma
	} 
}

//RESULTADO1

object resultado1 {

	var property total = cuenta1.nro1 + cuenta1.nro2

	var property position = game.at(1, 6)

	method image() {
		return "cuenta.png"
	}


	method text(){
		return '' +total+ '' 
	} 
}