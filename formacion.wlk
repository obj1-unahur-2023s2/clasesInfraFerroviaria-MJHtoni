class Formacion {
      const list vagones = []

      method cantidadPasajerosMaxima() = vagones.sum({v => v.cantidadPasajeros()})
      method cantidadVagonesPopulares() = vagones.count({v => v.esPopular()})
      method esFormacionCarguera() = vagones.all({v => v.carga() >= 1000})
      method cantidadDeBanios() = vagones.count({v => v.tieneBanio()})
      method pesoDelVagonDeMayorPesoMaximo() = vagones.max({v => v.pesoMaximo()}).pesoMaximo
      method pesoDelVagonDeMenorPesoMaximo() = vagones.min({v => v.pesoMaximo()}).pesoMaximo
      method dispersionDePesos() = self.pesoDelVagonDeMayorPesoMaximo() - self.pesoDelVagonDeMenorPesoMaximo()

      method estaOrganizada() {
          return not (1..vagones.size()-1).any {
            idx => not vagones.get(idx-1).esDePasajeros() and vagones.get(idx).esDePasajeros()
            }
      }
