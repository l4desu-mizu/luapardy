game = {
	quiz = {
		category1 = {
			"Elektrotechnik",	--ipairs geht in definierter reihenfolge vor wärend pairs eine beliebige reihenfolge nimmt
						--da ipairs jedoch nur auf integern iteriert kann in der kategorie nicht name als key stehen 
						--und sollte von daher immer der erste eintrag in der categorie sein
			{
				value=100,
				typ="img",
				given="resistor.png",
				wanted="Wie sieht das Schaltbild für einen Widerstand aus?"
			},
			{
				value=200,
				typ="img",
				given="capacitor.png",
				wanted="Wie sieht das Schaltbild für einen Kondensator aus?"
			},
			{
				value=300,
				typ="img",
				given="inductor.png",
				wanted="Wie sieht das Schaltbild für eine Spule aus?"
			},
			{
				value=400,
				typ="img",
				given="transistor.png",
				wanted="Wie sieht das Schaltbild für einen Transistor aus? (NPN)"
			},
			{
				value=500,
				typ="img",
				given="mosfet.png",
				wanted="Wie sieht ein Mosfet-Transistor aus?"
			}

		},
		category2 = {
			"Anime",
			{
				value=100,
				typ="text",
				given="Er ist eine gelbe Maus",
				wanted="Was ist Pikachu?"
			},
			{
				value=200,
				typ="text",
				given="Er hat als erster beim Kacken blonde Haare bekommen",
				wanted="Wer ist Son Goku?"
			},
			{
				value=300,
				typ="text",
				given="Er liebt seinen Strohut",
				wanted="Was ist Monkey D. Luffy (Ruffy)?"
			},
			{
				value=400,
				typ="text",
				given="Garant für gute Filme",
				wanted="Was ist Studio Ghibli?"
			},
			{
				value=500,
				typ="text",
				given="Sie strahlt wie die Sonne überm Fujiyama",
				wanted="Wer ist Mila (Superstar)?"
			}
		},
		category3 = {
			"Doctor Who",
			{
				value=100,
				typ="text",
				given="Exterminate!",
				wanted="Was ist das meist verwendetste Wort der Darleks?"
			},
			{
				value=200,
				typ="text",
				given="It's bigger on the inside",
				wanted="Was ist die Tardis? (beliebtester Satz bei der ersten Begegnung)"
			},
			{
				value=300,
				typ="text",
				given="Ein Anagramm und eigene Serie als Hommage an Doctor Who",
				wanted="Was ist Torchwood?"
			},
			{
				value=400,
				typ="text",
				given="Er bellt und rostet",
				wanted="Wer ist K-9?"
			},
			{
				value=500,
				typ="text",
				given="Des Doctors zerstörter Heimatplanet",
				wanted="Was ist Gallifrey?"
			}
		},
		category4 = {
			"???",
			{
				value=100,
				typ="text",
				given="Recherchen und Archiv",
				wanted="Was sind die Aufgaben von Bob Andrews?"
			},
			{
				value=200,
				typ="text",
				given="Sie stehen für all die ungelösten Rätsel und Geheimnisse",
				wanted="Wofür stehen die drei Fragezeichen ?"
			},
			{
				value=300,
				typ="text",
				given="Sehr wohl, die Herren",
				wanted="Was sagt Morten?"
			},
			{
				value=400,
				typ="text",
				given="Er ist nicht nur dünn, sondern auch gemein",
				wanted="Wer ist Skinny Norris?"
			},
			{
				value=500,
				typ="text",
				given="Er ist Besitzer des Schrottplatzes",
				wanted="Wer ist Titus Jonas?"
			}
		}
	}
}
