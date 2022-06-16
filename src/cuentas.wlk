import wollok.game.*
import faraon.*

class Cuadro{
	var property position
	
	method image() {
		
		return "cuenta.png"
	}
	
}


object cuadros {
	
		const cuadro1 = new Cuadro(position = game.at(2, 0))
		const cuadro2 = new Cuadro(position = game.at(11, 0))
		const cuadro3 = new Cuadro(position = game.at(16, 2))
		const cuadro4 = new Cuadro(position = game.at(11, 2))
//		const cuadro5 = new Cuadro(position = game.at(5, 4))
//		const cuadro6 = new Cuadro(position = game.at(16, 6))
	
	var property listaCuadros=[cuadro1,cuadro2,cuadro3,cuadro4]

	method mostrar(){listaCuadros.forEach({ cuadro => game.addVisual(cuadro)})}
		
}

class Resultado{
	var property total
	
	var property position
		
		method text(){
	 
		return 'T: '+total+'' 

	} 
	
}


object resultados {
		


		const resultado1 = new Resultado(position = game.at(2, 0) , total= cuenta1.total() )	
		const resultado2 = new Resultado(position = game.at(11, 0) , total= cuenta2.total() )
		const resultado3 = new Resultado(position = game.at(16, 2) , total= cuenta3.total() )
		const resultado4 = new Resultado(position = game.at(11, 2) , total= cuenta4.total() )
//		const texto5 = new Texto(position = game.at(5, 4) , total= cuenta5.total() )
//		const texto6 = new Texto(position = game.at(16, 6), total= cuenta6.total() )
		
	var property listaResultado = [resultado1, resultado2, resultado3, resultado4]

//	method listaDeResultados(){
//		cuentas.listaConResultado().map({ resultado => new Resultado(total= resultado , position= null })
//	}

	method mostrar(){ self.listaResultado().forEach({ resultado => game.addVisual(resultado)})  }
		
	
}

object cuentas {

	var property listaConResultado = []
	var property listaCuenta = []
	

	method mostrar() {
		
		const cuenta1 = new Cuenta(position = game.at(5, 0) , nro1= (1..100).anyOne() , nro2= (1..100).anyOne())
		const cuenta2 = new Cuenta(position = game.at(16, 0) , nro1= (1..100).anyOne() , nro2= (1..100).anyOne() )
		const cuenta3 = new Cuenta(position = game.at(1, 2) , nro1= (1..100).anyOne() , nro2= (1..100).anyOne() )
		const cuenta4 = new Cuenta(position = game.at(13, 4), nro1= (1..100).anyOne() , nro2= (1..100).anyOne() )
//		const cuenta5 = new Cuenta(position = game.at(1, 6) , nro1= (1..100).anyOne() , nro2= (1..100).anyOne() )
//		const cuenta6 = new Cuenta(position = game.at(8, 6) , nro1= (1..100).anyOne() , nro2= (1..100).anyOne() )
	
	listaCuenta = [cuenta1, cuenta2, cuenta3, cuenta4]
	
//	listaConResultado.add( listaCuenta.forEach({ cuenta => cuenta.total() }) )
	
	listaConResultado = listaCuenta.map({cuenta => cuenta.total()})

	listaCuenta.forEach({ cuenta => game.addVisual(cuenta)})
		
	}


}

//CUENTA
class Cuenta {

	var property nro1 = 0
	var property nro2 = 0

	var property total = nro1 + nro2

	var property position

	method text(){return ''+nro1+ ' + ' +nro2+''} 
}
