class Vagon {
	
	method carga() = 0
	method cantidadDePasajeros() = 0
	method esDePasajeros() {
      	return self.cantidadDePasajeros() > 0
      }
    method puedeTransportar(unValor) = self.carga() >= unValor
}

class Pasajero inherits Vagon{
      const property tieneBanio
      var property estaOrdenado
      const property ancho
      const property largo

      override method cantidadDePasajeros() {
            const pasajeros = if(ancho <= 3) {8*largo} else {10*largo}
            return if (not estaOrdenado) {0.max(pasajeros - 15)} else {pasajeros}}
      override method carga() {
            return if(tieneBanio) {300} else {800}}
      method pesoMaximo() {
            return self.cantidadDePasajeros() + self.carga() + 2000}
      method esPopular() = self.cantidadDePasajeros() > 50
}

class Carga inherits Vagon{
      const property cargaMaximaIdeal
      var property maderasSueltas

      override method cantidadDePasajeros() = 0
      override method carga() = 0.max(cargaMaximaIdeal - 400*maderasSueltas)
      method pesoMaximo() = 1500*cargaMaximaIdeal
      method esPopular() = self.cantidadDePasajeros() > 50
}

class Dormitorio inherits Vagon{
      const property cantidadCompartimientos
      var property camasPorCompartimiento

      override method cantidadDePasajeros() {
            return cantidadCompartimientos*camasPorCompartimiento}
      override method carga() = 1200
      method pesoMaximo() = 4000*self.cantidadDePasajeros() + 1200
      method esPopular() {
      		return self.cantidadDePasajeros() > 50
			}
}
