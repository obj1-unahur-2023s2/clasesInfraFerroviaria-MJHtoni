class Formacion {
      const vagones = []
      const locomotoras = []
      
      method agregarLocomotora(unaLocomotora) {
      		return locomotoras.add(unaLocomotora)
      }
      
      method agregarVagones(unVagon) {
      		return vagones.add(unVagon)
      }
      
      method desarmarFormacion() {
      		return vagones.clear()
      }
      
      method cantidadPasajerosMaxima() = vagones.sum({v => v.cantidadDePasajeros()})
      method cantidadVagonesPopulares() = vagones.count({v => v.esPopular()})
      method esFormacionCarguera() = vagones.all({v => v.carga() >= 1000})
      method cantidadDeBanios() = vagones.count({v => v.tieneBanio()})
      method pesoDelVagonDeMayorPesoMaximo() = vagones.max({v => v.pesoMaximo()}).pesoMaximo()
      method vagonMasPesado() = vagones.max({v => v.pesoMaximo()})
      method pesoDelVagonDeMenorPesoMaximo() = vagones.min({v => v.pesoMaximo()}).pesoMaximo()
      method dispersionDePesos() = self.pesoDelVagonDeMayorPesoMaximo() - self.pesoDelVagonDeMenorPesoMaximo() 
      method vagonesSoloDePasajeros() {
      		return vagones.filter({v => v.esDePasajeros()})
      }
      method estaEquilibrada() {
      		const pasajeros = self.vagonesSoloDePasajeros()
      		const maximo = pasajeros.max{v => v.cantidadDePasajeros()}
      		const minimo = pasajeros.min{v => v.cantidadDePasajeros()}
      		return maximo.cantidadDePasajeros() - minimo.cantidadDePasajeros() <= 20
      }
      
      method estaOrganizada() {
          return not (1..vagones.size()-1).any {
            idx => not vagones.get(idx-1).esDePasajeros() and vagones.get(idx).esDePasajeros()
            }
      }
      
      method locomotoraMasLenta() = locomotoras.min({l => l.velocidadMax()})
      method velocidadMaxima() {
      		return self.locomotoraMasLenta().velocidadMax()
      }
      method esEficiente() = locomotoras.all({l => l.esEficiente()})
      
      method sumaDelArrastre() = locomotoras.sum({l => l.arrastre()}) 
      method puedeMoverse() {
      		return self.sumaDelArrastre() >= self.sumaDePesos()
      }
      method kilosDeEmpujeFaltante() = 0.max(self.sumaDePesos() - self.sumaDelArrastre())
      method pesoDeVagones() = vagones.sum({v => v.pesoMaximo()})
      method pesoDeLocomotoras() = locomotoras.sum({l => l.peso()})
      method sumaDePesos() {
      		return self.pesoDeVagones() + self.pesoDeLocomotoras()
      }
      method esCompleja() {
      		return self.unidadesDeLaFormacion() > 8 or self.sumaDePesos() > 80000
      		}
      method unidadesDeLaFormacion() = vagones.size() + locomotoras.size()
}