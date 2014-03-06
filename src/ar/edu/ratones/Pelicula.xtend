package ar.edu.ratones

import java.util.List

class Pelicula implements Inversion {

	@Property double recaudacion
	@Property double costoProduccion
	@Property List<Personaje> personajes

	/**
	 * PUNTO 1
	 */
	override costo() {
		costoProduccion + costoPersonajes
	}

	def double getCostoPersonajes() {
		personajesPagos.fold(0.0, [acum, personaje|acum + personaje.sueldo])
	}

	def getPersonajesPagos() {
		personajes
	}

	/**
	 * PUNTO 2
	 */
	override personajesInvolucadros() {
		personajes
	}

}
