import trenes.*
import deposito.*

class Formacion {

	const property vagonesCarga = []
	const property vagonesPasajeros = []
	const property locomotoras = []
	const vagonesTotal = [ vagonesCarga + vagonesPasajeros ].flatten()
	const unidades = [ vagonesTotal + locomotoras ].flatten()

	method cantidadDeVagones() = vagonesTotal.size() // Lo uso para testear si las colecciones se unieron formando UNA nueva

	method totalPasajerosTransportables() = vagonesPasajeros.sum({ vagon => vagon.cantidadPasajerosMax() })

	method cantidadVagonesLivianos() = vagonesTotal.count({ vagon => vagon.esLiviano() })

	method velocidadMaxima() = locomotoras.min({ locomotora => locomotora.velocidadMaxima() })

	method formacionEficiente() = locomotoras.all({ locomotora => locomotora.esEficiente() })

	method pesoTotalVagones() = vagonesTotal.sum({ vagon => vagon.pesoMaximo() })

	method arrastreTotal() = locomotoras.sum({ locomotora => locomotora.arrastreUtil() })

	method puedeMoverse() = self.arrastreTotal() >= self.pesoTotalVagones()

	method kilosDeDiferencia() = (self.pesoTotalVagones() - self.arrastreTotal()) // indica diferencia entre kilos arrastrables y kilos para arrastar. Se la va a llamar siempre el peso total de los vagones sea mayor al peso arrastrable, por ende siempre devuelve un positivo

	method kilosDeEmpujeNecesarios() = if (self.puedeMoverse()) 0 else self.kilosDeDiferencia() // cuantos kilos de empuje necesita para moverse

	method pesoTotal() = unidades.sum({ unidad => unidad.pesoMaximo() }) // peso total de la formacion (locomotoras y ambos tipos de vagones)

	method esCompleja() = unidades.size() > 20 or self.pesoTotal() > 10000

}

