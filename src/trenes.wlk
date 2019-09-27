import formaciones.*
import deposito.*


class VagonPasajeros{
	var property largo
	var property ancho
	
	method cantidadPasajerosMax() = if(2.5 >= ancho) largo*8 else largo*10
	method pesoMaximo() = self.cantidadPasajerosMax()*80

}


class VagonCarga{
	var property cargaMaxima
	
	method pesoMaximo() = cargaMaxima + 160
}


class Locomotora{
	var maximoArrastre
	var property pesoMaximo
	var property velocidadMaxima
	
	method esEficiente() = self.arrastreUtil() >= 5*pesoMaximo
	method arrastreUtil() = maximoArrastre - pesoMaximo 
}



