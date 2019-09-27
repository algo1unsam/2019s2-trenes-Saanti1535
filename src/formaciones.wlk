import trenes.*
import deposito.*

class Formacion {

	var vagonesCarga = []
	var vagonesPasajeros = []
	var locomotoras = []
	var vagonesTotal = vagonesCarga + vagonesPasajeros
	var unidades = vagonesTotal + locomotoras

	method totalPasajerosTransportables() = vagonesPasajeros.sum({ vagon => vagon.cantidadPasajerosMax() })

	/* 	method vagonesCargaLivianos() = vagonesCarga.count({ vagon => vagon.pesoMaximo() < 2500 })
	 * 	method vagonesPasajerosLivianos() = vagonesPasajeros.count({ vagon => vagon.pesoMaximo() < 2500 })
	 */
	method cantidadVagonesLivianos() = vagonesTotal.count({ vagon => vagon.pesoMaximo() < 2500 })

	method velocidadMaxima() = locomotoras.min({ locomotora => locomotora.velocidadMaxima() })

	method formacionEficiente() = locomotoras.all({ locomotora => locomotora.esEficiente() })

	method pesoTotalVagones() = vagonesTotal.sum({ vagon => vagon.pesoMaximo() })

	method arrastreTotal() = locomotoras.sum({ locomotora => locomotora.arrastreUtil() })

	method puedeMoverse() = self.arrastreTotal() >= self.pesoTotalVagones

	method kilosDeDiferencia() = self.pesoTotalVagones() - self.arrastreTotal()

	method kilosDeEmpujeNecesarios() = if (self.puedeMoverse()) 0 else self.kilosDeDiferencia()

	method pesoTotal() = unidades.sum({ unidad => unidad.pesoMaximo() })

	method esCompleja() = unidades.size() > 20 or self.pesoTotal() > 10000

}

