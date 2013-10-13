return {
	"Elektrotechnik",	--ipairs geht in definierter reihenfolge vor wärend pairs eine beliebige reihenfolge nimmt
				--da ipairs jedoch nur auf integern iteriert kann in der kategorie nicht name als key stehen 
				--und sollte von daher immer der erste eintrag in der categorie sein
	{
		value=100,
		typ="img",
		puzzle="resistor.png",
		answer="Wie sieht das Schaltbild für einen Widerstand aus?"
	},
	{
		value=200,
		typ="img",
		puzzle="capacitor.png",
		answer="Wie sieht das Schaltbild für einen Kondensator aus?"
	},
	{
		value=300,
		typ="img",
		puzzle="inductor.png",
		answer="Wie sieht das Schaltbild für eine Spule aus?"
	},
	{
		value=400,
		typ="img",
		puzzle="transistor.png",
		answer="Wie sieht das Schaltbild für einen Transistor aus? (NPN)"
	},
	{
		value=500,
		typ="img",
		puzzle="mosfet.png",
		answer="Wie sieht ein Mosfet-Transistor aus?"
	}

}
