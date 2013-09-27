game = {
	quiz = {
		category1 = {
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

		},
		category2 = {
			"Anime",
			{
				value=100,
				typ="text",
				puzzle="Er ist eine gelbe Maus",
				answer="Was ist Pikachu?"
			},
			{
				value=200,
				typ="text",
				puzzle="Er hat als erster beim Kacken blonde Haare bekommen",
				answer="Wer ist Son Goku?"
			},
			{
				value=300,
				typ="text",
				puzzle="Er liebt seinen Strohut",
				answer="Was ist Monkey D. Luffy (Ruffy)?"
			},
			{
				value=400,
				typ="text",
				puzzle="Garant für gute Filme",
				answer="Was ist Studio Ghibli?"
			},
			{
				value=500,
				typ="text",
				puzzle="Sie strahlt wie die Sonne überm Fujiyama",
				answer="Wer ist Mila (Superstar)?"
			}
		},
		category3 = {
			"Doctor Who",
			{
				value=100,
				typ="text",
				puzzle="Exterminate!",
				answer="Was ist das meist verwendetste Wort der Darleks?"
			},
			{
				value=200,
				typ="text",
				puzzle="It's bigger on the inside",
				answer="Was ist die Tardis? (beliebtester Satz bei der ersten Begegnung)"
			},
			{
				value=300,
				typ="text",
				puzzle="Ein Anagramm und eigene Serie als Hommage an Doctor Who",
				answer="Was ist Torchwood?"
			},
			{
				value=400,
				typ="text",
				puzzle="Er bellt und rostet",
				answer="Wer ist K-9?"
			},
			{
				value=500,
				typ="text",
				puzzle="Des Doctors zerstörter Heimatplanet",
				answer="Was ist Gallifrey?"
			}
		},
		category4 = {
			"???",
			{
				value=100,
				typ="text",
				puzzle="Recherchen und Archiv",
				answer="Was sind die Aufgaben von Bob Andrews?"
			},
			{
				value=200,
				typ="text",
				puzzle="Sie stehen für all die ungelösten Rätsel und Geheimnisse",
				answer="Wofür stehen die drei Fragezeichen ?"
			},
			{
				value=300,
				typ="text",
				puzzle="Sehr wohl, die Herren",
				answer="Was sagt Morten?"
			},
			{
				value=400,
				typ="text",
				puzzle="Er ist nicht nur dünn, sondern auch gemein",
				answer="Wer ist Skinny Norris?"
			},
			{
				value=500,
				typ="text",
				puzzle="Er ist Besitzer des Schrottplatzes",
				answer="Wer ist Titus Jonas?"
			}
		}
	}
}
