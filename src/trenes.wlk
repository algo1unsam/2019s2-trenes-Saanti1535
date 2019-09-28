import formaciones.*
import deposito.*

class VagonPasajeros {

	const property largo
	const property ancho

	method cantidadPasajerosMax() = if (2.5 >= ancho) largo * 8 else largo * 10

	method pesoMaximo() = self.cantidadPasajerosMax() * 80

	method esLiviano() = self.pesoMaximo() < 2500

}

class VagonCarga {

	const property cargaMaxima

	method pesoMaximo() = cargaMaxima + 160

	method esLiviano() = self.pesoMaximo() < 2500

}

class Locomotora {

	const maximoArrastre
	const property pesoMaximo
	const property velocidadMaxima

	method esEficiente() = self.arrastreUtil() >= 5 * pesoMaximo

	method arrastreUtil() = maximoArrastre - pesoMaximo

}

