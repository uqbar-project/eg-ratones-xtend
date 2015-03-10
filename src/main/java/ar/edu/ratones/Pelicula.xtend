package ar.edu.ratones

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Pelicula implements Inversion {

	double recaudacion
	double costoProduccion
	List<Personaje> personajes

	/**
	 * *****************************************************************
	 * INICIALIZACION
	 * *****************************************************************
	 */
	new() {
		super()
		this.init
	}

	new(double unaRecaudacion, double unCostoProduccion) {
		this.init
		recaudacion = unaRecaudacion
		costoProduccion = unCostoProduccion
	}
	
	def void init() {
		personajes = new ArrayList<Personaje>
	}

	def void agregarPersonaje(Personaje personaje) {
		personajes.add(personaje)
	}
	
	/**
	 * *****************************************************************
	 * PUNTO 1
	 * *****************************************************************
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
	 * *****************************************************************
	 * PUNTO 2
	 * *****************************************************************
	 */
	override personajesInvolucrados() {
		personajes
	}

}
