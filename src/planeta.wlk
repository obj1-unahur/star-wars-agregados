class Planeta {
	var habitantes = []
	var cantidadMuseos = 0
	var longitudMurallas = 0
	
	method construirMurallas(cantidad) { longitudMurallas += cantidad }
	method fundarUnMuseo() { cantidadMuseos += 1 }
	method recibirTributos() { habitantes.forEach({hab => hab.contribuir(self)}) }
	method esCulto() { return cantidadMuseos > 2 and habitantes.all({ hab => hab.inteligencia() > 10 })}
	method potenciaAparente() { return self.maximaPotencia() * habitantes.size() }
	method maximaPotencia() { return habitantes.max({ hab => hab.potencia() }).potencia() }
	method necesitaReforzarse() { return 2 * self.potenciaAparente() >= self.potenciaReal() }
	method potenciaReal() { return habitantes.sum({ hab => hab.potencia() }) }
	method delegacionDiplomatica() { return habitantes.filter({ hab => hab.esDestacada() })}
	method valorInicialDeDefensa() { return habitantes.count({ hab => hab.potencia() >= 30 }) }
	method habitantesValiosos() { return habitantes.filter({ hab => hab.valor() >= 40 }) }
	
	method apaciguar(otroPlaneta) { 
		self.habitantesValiosos().forEach({ hab => hab.contribuir(otroPlaneta) })
	}
}
