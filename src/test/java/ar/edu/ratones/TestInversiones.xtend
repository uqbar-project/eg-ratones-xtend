package ar.edu.ratones

import org.junit.Before
import org.junit.Test
import org.junit.Assert

class TestInversiones {

	Pelicula peliLocoPorMary
	Pelicula peliCarancho
	Pelicula peliNaufrago2
	Compania paramount
	ParqueDiversiones italPark
	RatonInversor darthMouse
	RatonInversor ratonazo

	@Before
	def void init() {
		peliLocoPorMary = new Pelicula(40000d, 4000d)
		peliLocoPorMary.agregarPersonaje(new Personaje("Cameron Diaz", 200))
		peliLocoPorMary.agregarPersonaje(new Personaje("Matt Dillon", 350))
		peliLocoPorMary.agregarPersonaje(new Personaje("Ben Stiller", 1200))
		peliLocoPorMary.agregarPersonaje(new Personaje("Lee Evans", 180))
		peliLocoPorMary.agregarPersonaje(new Personaje("Chris Elliot", 240))
		peliLocoPorMary.agregarPersonaje(new Personaje("Lin Shaye", 60))

		peliCarancho = new PeliculaIndependiente(10000d, 10d)
		peliCarancho.agregarPersonaje(new Personaje("Ricardo Darin", 1000))
		peliCarancho.agregarPersonaje(new Personaje("Loren Acuña", 15))
		peliCarancho.agregarPersonaje(new Personaje("Martina Gusman", 50))
		peliCarancho.agregarPersonaje(new Personaje("Jose Luis Arias", 20))
		peliCarancho.agregarPersonaje(new Personaje("Fabio Ronzano", 5))
		peliCarancho.agregarPersonaje(new Personaje("Carlos Weber", 40))

		peliNaufrago2 = new Pelicula(30000d, 10000d)
		peliNaufrago2.agregarPersonaje(new Personaje("Tom Hanks", 2500))
		peliNaufrago2.agregarPersonaje(new Personaje("Paul Sanchez", 30))

		paramount = new Compania(0.5d)
		paramount.agregarPelicula(peliLocoPorMary)
		paramount.agregarPelicula(peliCarancho)

		ParqueDiversiones.costoPorMetroCuadrado = 20d
		italPark = new ParqueDiversiones(100, 3000d)

		darthMouse = new RatonInversor(100000d)
		darthMouse.agregarInversionPendiente(paramount)
		darthMouse.agregarInversionPendiente(italPark)
		ratonazo = new RatonInversor(100d)
		ratonazo.agregarInversionPendiente(peliNaufrago2)
	}

	@Test
	def void costoNaufrago2() {
		Assert.assertEquals(12530d, peliNaufrago2.costo, 0.01)
	}

	@Test
	def void costoCarancho() {
		Assert.assertEquals(10d, peliCarancho.costoProduccion, 0.01)
		Assert.assertEquals(1110d, peliCarancho.costoPersonajes, 0.01)
		Assert.assertEquals(1120d, peliCarancho.costo, 0.01)
	}

	@Test
	def void costoItalpark() {
		Assert.assertEquals(5000d, italPark.costo, 0.01)
	}

	@Test
	def void costoParamount() {
		Assert.assertEquals(25000d, paramount.costo, 0.01)
	}

	@Test
	def void costoInversionesPendientesDarthMouse() {
		Assert.assertEquals(30000d, darthMouse.costoInversionesPendientes, 0.01)
	}

	@Test
	def void realizarInversionesPendientesDarthMouse() {
		Assert.assertTrue(darthMouse.realizarInversionesPendientes)
		Assert.assertEquals(0, darthMouse.inversionesPendientes.size)
		Assert.assertEquals(2, darthMouse.inversionesRealizadas.size)
	}

	@Test
	def void realizarInversionesPendientesRatonazo() {
		Assert.assertFalse(ratonazo.realizarInversionesPendientes)
		Assert.assertEquals(1, ratonazo.inversionesPendientes.size)
		Assert.assertEquals(0, ratonazo.inversionesRealizadas.size)
	}

	@Test
	def void realizarInversionesPendientesDarthMousePobreton() {
		darthMouse.dineroDisponible = 10000d 
		Assert.assertFalse(darthMouse.realizarInversionesPendientes)
		Assert.assertEquals(2, darthMouse.inversionesPendientes.size)
		Assert.assertEquals(0, darthMouse.inversionesRealizadas.size)
	}

}
