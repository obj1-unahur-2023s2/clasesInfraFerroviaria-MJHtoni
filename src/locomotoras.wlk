class Locomotoras {
	const property peso
	const property arrastre
	const property velocidadMax
	
	method esEficiente(){
		return arrastre >= 5*peso
	}
	
}
