package ar.edu.ratones

import java.util.ArrayList
import java.util.List

class RatonInversor {
	
	List<Inversion> inversionesPendientes
	List<Inversion> inversionesRealizadas
	double dineroDisponible	
	
	new() {
		inversionesPendientes = new ArrayList<Inversion>
		dineroDisponible = 0.0
	}
	
	/**
	 * 
	 * PUNTO 3
	 */
	def double getCostoInversionesPendientes() {
		inversionesPendientes.fold(0.0, [ acum, inversion | acum + inversion.costo] )
	}
	
	
	/**
	 * PUNTO 4a
	 */
	def void realizar(Inversion inversion) {
		if (puedeRealizar(inversion)) {
			inversionesPendientes.remove(inversion)
			inversionesRealizadas.add(inversion)
		}
	}
	
	def puedeRealizar(Inversion inversion) {
		inversion.costo <= dineroDisponible
	}
	 
	/**
	 * PUNTO 4b
	 */
	def boolean realizarInversionesPendientes() {
		if (!inversionesPendientes.forall [ puedeRealizar(it) ]) {
			return false	
		} 
		inversionesPendientes.forEach [ realizar(it) ]
		true
	}
	

	/**
	 * PUNTO 5
	 */
	def boolean esMasRatonQue(RatonInversor otro) {
		this.costoInversionesRealizadas < otro.costoInversionesRealizadas
	}
	
	def double costoInversionesRealizadas() {
		inversionesRealizadas.fold(0.0, [ acum, inversion | acum + inversion.costo ])
	}
	
}	