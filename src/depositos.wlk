class Deposito {
	const formaciones = []
	const locomotoras = []
	
	method vagonesMasPesados() {
			formaciones.map({f => f.vagonMasPesado()}).asSet()
	}
	method necesitaConductorExperimentado() {
		return formaciones.any({f => f.esCompleja()})
	}
}
