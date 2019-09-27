import trenes.*
import formaciones.*

class Deposito {

	var formaciones = []
	var locomotoras = []

	method vagonMasPesado() = formaciones.vagonesTotal().max({ vagon => vagon.pesoMaximo() }).asList()

	method necesitaConductorExperimentado() = formaciones.any({ formacion => formacion.esCompleja() })

	method formacionesQuePuedenMoverse() = formaciones.filter({ formacion => formacion.puedeMoverse() })

	method locomotoraQueAyudaA(formacion) = locomotoras.findOrDefault({ locomotora => locomotora.arrastreUtil() >= formacion.kilosDeDiferencia() }, null)

	method existeLocomotoraQuePuedaMoverA(formacion) = self.locomotoraQueAyudaA(formacion) != null

	method agregarLocomotoraA(formacion) {
		if (not ( formacion.puedeMoverse() ) and self.existeLocomotoraQuePuedaMoverA(formacion)) formacion.add(self.locomotoraQueAyudaA(formacion))
	}

}
