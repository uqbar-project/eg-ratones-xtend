package ar.edu.ratones

import java.util.ArrayList

class ParqueDiversiones implements Inversion {

	@Property int metrosCuadrados
	@Property double costoAtracciones

	static double CostoMetroCuadrado = 0.0

	/**
	 * *****************************************************************
	 * INICIALIZACION
	 * *****************************************************************
	 */
	new() {
		super()
	}
	
	new(int m2, double costo) {
		metrosCuadrados = m2
		costoAtracciones = costo	
	}
	
	static def void costoPorMetroCuadrado(double valor) {
		CostoMetroCuadrado = valor
	}

	/**
	 * *****************************************************************
	 * PUNTO 1
	 * *****************************************************************
	 */
	override costo() {
		costoAtracciones + (CostoMetroCuadrado * metrosCuadrados)
	}

	/**
	 * *****************************************************************
	 * PUNTO 2
	 * *****************************************************************
	 */
	override personajesInvolucrados() {
		new ArrayList<Personaje>
	}

}
