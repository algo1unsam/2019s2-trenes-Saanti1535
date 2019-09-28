import trenes.*
import formaciones.*

class Deposito {

	const property formaciones = []
	const property locomotoras = []

	method vagonesMasPesados() = formaciones.map({ formacion => formacion.vagonMasPesado() })

	method necesitaConductorExperimentado() = formaciones.any({ formacion => formacion.esCompleja() })

	method formacionesQuePuedenMoverse() = formaciones.filter({ formacion => formacion.puedeMoverse() })

	method locomotoraQueAyudaA(formacion) = locomotoras.findOrDefault({ locomotora => locomotora.arrastreUtil() >= formacion.kilosDeDiferencia() }, null)

	method existeLocomotoraQuePuedaMoverA(formacion) = self.locomotoraQueAyudaA(formacion) != null

	method agregarLocomotoraA(formacion) {
		if (not ( formacion.puedeMoverse() ) and self.existeLocomotoraQuePuedaMoverA(formacion)) {
			formacion.locomotoras().add(self.locomotoraQueAyudaA(formacion))
			self.locomotoras().remove(self.locomotoraQueAyudaA(formacion))
		}
	}

}

