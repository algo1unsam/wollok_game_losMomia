import wollok.game.*
import faraon.*

class Cuadro {

	var property position

	method image() {
		return "cuenta.png"
	}

}

object cuentas {

	var property encuadrables = []
	// se usa en la construccion
	var property listaCuadros = []

	method mostrar() {
		const posiciones = [ game.at(2, 0), game.at(11, 0), game.at(16, 2), game.at(11, 2), game.at(5, 4), game.at(16, 6), game.at(5, 0), game.at(17, 0), game.at(1, 2), game.at(13, 4), game.at(1, 6), game.at(7, 6) ]
		listaCuadros = posiciones.map({ pos => new Cuadro(position = pos)})
		listaCuadros.forEach({ cuadro => game.addVisual(cuadro)})
		const listaCuenta = [ self.suma(), self.suma(), self.resta(), self.resta(), self.multiplicacion(), self.multiplicacion() ]
		const listaResultado = listaCuenta.map({ cuenta => cuenta.construirResultado(self.elegirCuadro()) })
		encuadrables = listaCuenta + listaResultado
		encuadrables.forEach({ encuadrable => game.addVisual(encuadrable)})
	}

	method suma() {
		return new Suma(cuadro = self.elegirCuadro(), nro1 = self.generarNumero1a100(), nro2 = self.generarNumero1a100())
	}

	method resta() {
		return new Resta(cuadro = self.elegirCuadro(), nro1 = self.generarNumero50a100(), nro2 = self.generarNumero1a50())
	}

	method multiplicacion() {
		return new Multiplicacion(cuadro = self.elegirCuadro(), nro1 = self.generarNumero6a14(), nro2 = self.generarNumero3a16())
	}

	method elegirCuadro() {
		const cuadroElegido = listaCuadros.anyOne()
		listaCuadros.remove(cuadroElegido)
		return cuadroElegido
	}

	method hayEncuadrable(position) {
		return encuadrables.any({ encuadrable => encuadrable.position() == position })
	}

	method encuadrable(position) {
		return encuadrables.find({ encuadrable => encuadrable.position() == position })
	}

	method generarNumero1a100() {
		return (1 .. 100).anyOne()
	}

	method generarNumero50a100() {
		return (50 .. 100).anyOne()
	}

	method generarNumero1a50() {
		return (1 .. 50).anyOne()
	}

	method generarNumero6a14() {
		return (6 .. 14).anyOne()
	}

	method generarNumero3a16() {
		return (3 .. 50).anyOne()
	}

}

class Encuadrable {

	var property cuadro

	method text()

	method total()

	method position() {
		return cuadro.position()
	}

	method match(encuadrable) {
		return self.total() == encuadrable.total()
	}

	method borrarPantalla(encuadrable) {
		game.removeVisual(encuadrable)
		game.removeVisual(encuadrable.cuadro())
		cuentas.encuadrables().remove(encuadrable)
	}

}

//CUENTA
class Cuenta inherits Encuadrable {

	var property nro1
	var property nro2

	method construirResultado(_cuadro) {
		return new Resultado(cuadro = _cuadro, total = self.total())
	}

}

class Suma inherits Cuenta {

	override method total() = nro1 + nro2

	override method text() {
		return '' + nro1 + '+' + nro2 + ''
	}

}

class Resta inherits Cuenta {

	override method total() = nro1 - nro2

	override method text() {
		return '' + nro1 + '-' + nro2 + ''
	}

}

class Multiplicacion inherits Cuenta {

	override method total() = nro1 * nro2

	override method text() {
		return '' + nro1 + 'X' + nro2 + ''
	}

}

class Resultado inherits Encuadrable {

	var property total

	override method text() {
		return '' + total + ''
	}

}

