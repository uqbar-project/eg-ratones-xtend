package ar.edu.ratones

import java.util.ArrayList

class ParqueDiversiones implements Inversion {

	@Property int metrosCuadrados
	@Property double costoAtracciones

	static double CostoMetroCuadrado = 0.0

	/**
	 * PUNTO 1
	 */
	override costo() {
		costoAtracciones + (CostoMetroCuadrado * metrosCuadrados)
	}
	
	/**
	 * PUNTO 2
	 */
	override personajesInvolucadros() {
		new ArrayList<Personaje>
	}

}
