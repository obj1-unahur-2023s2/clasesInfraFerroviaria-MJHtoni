class Pasajero {
      const property tieneBanio
      var property estaOrdenado = true
      var cantidadDePasajeros = 0
      var cantidadMaximaDeCarga = 0
      var pesoMaximo = 0
      const property ancho
      const property largo

      method cantidadDePasajeros() {
            const pasajeros = if(ancho <= 3) {8*largo} else {10*largo}}
            return if (not estaOrdenado) {0.max(pasajeros - 15)} else {pasajeros}
      method cantidadMaximaDeCarga() {
            return if(tieneBanio) {300} else {800}}
      method pesoMaximo() {
            return self.cantidadPasajeros() + self.cantidadMaximaDeCarga() + 2000}
      method esPopular() = self.cantidadDePasajeros() > 50
}

class Carga {
      const property cargaMaximaIdeal
      var property maderasSueltas

      method cantidadDePasajeros() = 0
      method carga() = 0.max(cargaMaximaIdeal - 400*maderasSueltas)
      method pesoMaximo() = 1500*cargaMaximaIdeal
      method esPopular() = self.cantidadDePasajeros() > 50
}

class Dormitorio {
      const property cantidadCompartimientos
      var property camasPorCompartimiento

      method cantidadDePasajeros() {
            return cantidadCompartimientos*camasPorCompartimiento}
      method carga() = 1200
      method pesoMaximo() = 4000*self.cantidadDePasajeros() + 1200
      method esPopular() = self.cantidadDePasajeros() > 50
      
    
