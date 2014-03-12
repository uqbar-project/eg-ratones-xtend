package ar.edu.ratones

import java.util.ArrayList
import java.util.List

class Compania implements Inversion {
	
	List<Pelicula> peliculas
	double porcentajeRecaudacion
	
	/**
	 * *****************************************************************
	 * INICIALIZACION
	 * *****************************************************************
	 */
	new() {
		porcentajeRecaudacion = 0.0
		this.init
	}
	
	new(double unPorcentaje) {
		porcentajeRecaudacion = unPorcentaje
		this.init
	}
	
	def void init() {
		peliculas = new ArrayList<Pelicula>
	}

	def agregarPelicula(Pelicula pelicula) {
		peliculas.add(pelicula)
	}
	
	/**
	 * *****************************************************************
	 * PUNTO 1
	 * *****************************************************************
	 */
	override costo() {
		totalRecaudacion * porcentajeRecaudacion 
	}
	
	def getTotalRecaudacion() {
		peliculas.fold(0.0, [ acum, pelicula | acum + pelicula.recaudacion ])
	}
	
	/**
	 * *****************************************************************
	 * PUNTO 2
	 * *****************************************************************
	 */
	override personajesInvolucrados() {
		peliculas.fold(new ArrayList<Personaje>, 
			[ todos, pelicula | todos.addAll(pelicula.personajes) todos ])
	}
	
}
