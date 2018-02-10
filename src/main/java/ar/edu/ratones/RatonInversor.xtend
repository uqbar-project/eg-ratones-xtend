package ar.edu.ratones

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RatonInversor {

	List<Inversion> inversionesPendientes
	List<Inversion> inversionesRealizadas
	double dineroDisponible

	/**
	 * *****************************************************************
	 * INICIALIZACION 
	 * *****************************************************************
	 */
	new() {
		dineroDisponible = 0.0
		this.init
	}

	new(double dinero) {
		dineroDisponible = dinero
		this.init
	}

	def void init() {
		inversionesPendientes = new ArrayList<Inversion>
		inversionesRealizadas = new ArrayList<Inversion>
	}

	def agregarInversionPendiente(Inversion inversion) {
		inversionesPendientes.add(inversion)
	}

	/**
	 * *****************************************************************
	 * PUNTO 3
	 * *****************************************************************
	 */
	def double getCostoInversionesPendientes() {
		inversionesPendientes.fold(0.0, [acum, inversion|acum + inversion.costo])
	}

	/**
	 * *****************************************************************
	 * PUNTO 4a
	 * *****************************************************************
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
	 * *****************************************************************
	 * PUNTO 4b
	 * *****************************************************************
	 */
	def boolean realizarInversionesPendientes() {
		if (!inversionesPendientes.forall[puedeRealizar(it)]) {
			return false
		}
		inversionesPendientes.clone.forEach[realizar(it)]
		true
	}

	/**
	 * *****************************************************************
	 * PUNTO 5a
	 * *****************************************************************
	 */
	def boolean esMasRatonQue(RatonInversor otro) {
		this.costoInversionesRealizadas < otro.costoInversionesRealizadas
	}

	def double costoInversionesRealizadas() {
		inversionesRealizadas.fold(0.0, [acum, inversion|acum + inversion.costo])
	}

	/**
	 * *****************************************************************
	 * PUNTO 5b
	 * *****************************************************************
	 */
	def esAmbicioso() {
		costoInversionesPendientes > (dineroDisponible * 2)
	}

	def dilapidarCapital() {
		inversionesPendientes.clone.forEach [ inversion |
			realizar(inversion)
		]
	}

}
