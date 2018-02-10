package ar.edu.ratones

import org.eclipse.xtend.lib.annotations.Accessors

class Personaje {

	String nombre
	@Accessors double sueldo
	
	/**
	 * *****************************************************************
	 * INICIALIZACION
	 * *****************************************************************
	 */
	new(String unNombre, double unSueldo) {
		nombre = unNombre
		sueldo = unSueldo
	}

}