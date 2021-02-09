# Custom-Qbus-Witwas

Dit is een custom script dat je de mogelijkheid geeft om zwart geld wit te wassen. Op het moment bestaat er al een traphouse maar dit is eens iets anders. 
Weet dat elk item van zwart geld gelijk is aan **€1**. Wat we dus doen is, je wast per 500 en krijgt daar een percentage van terug als cash (wit geld). Het is met een volledig nieuw item dus je kan instellen dat je bv bij winkelovervallen ofzo geen cash krijgt maar het item "zwartgeld". Meer info onderaan. :)

## Hoe werkt het nu juist
Je moet aan de werknemerskaart geraken om binnen te geraken in de witwas (wasserette). Deze kan je uit een inklok machientje vinden op een bepaalde locatie. Natuurlijk is er maar 
een kleine kans dat je dit krijgt en staat er een cooldown op van **30min**, zelf configureerbaar.

## Installatie
Download de folder als zip, hierin zit het script. Zet het script in je resources en navigeer dan naar je `resources.cfg` daarin zet je het volgende:

```bash
start YourPrefix-witwas --> (Verander 'YourPrefix' naar jouw resource prefix (qb- of rs- of hp-,...)
```

## Toevoeging aan YourPrefix-inventory
In de zip folder zit een foto genaamd **zwartgeld.png** en **waskaart.png** deze moet je in `YourPrefix-inventory -> html -> images` toevoegen.


## Aanpassingen YourPrefix-witwas
In `YourPrefix-witwas` kan je als je Visual Studio Code hebt als editor `CTRL + F` doen en dan kan je 
alle plekken waar `YourCore` en `YourPrefix-` staat aanpassen naar jouw eigen **Core** *(QBCore, RSCore, HPCore)* en **resources prefix** *(qb- , rs-, hp-)*

## Aanpassingen aan je Core
Voeg volgende code toe aan je shared.lua in de core
```bash
	["zwartgeld"] = {
		["name"] = "zwartgeld",           		    
		["label"] = "Zwart geld",	 			
		["weight"] = 1, 		
		["type"] = "item", 		
		["image"] = "zwartgeld.png", 		 	
		["unique"] = false, 	
		["useable"] = true, 	
		["shouldClose"] = true,    
		["combinable"] = nil,   
		["description"] = "Zeer vies geld"
	},
	
	["waskaart"] = {
		["name"] = "waskaart",           		    
		["label"] = "Wasserette kaart",	 		
		["weight"] = 1, 		
		["type"] = "item", 		
		["image"] = "waskaart.png", 		 	
		["unique"] = false, 	
		["useable"] = true, 	
		["shouldClose"] = true,    
		["combinable"] = nil,  
		["description"] = "Werkt u bij de wasserette?"
	},

```

## Eigen locatie / item / ... toevoegen
- Locatie ingang aanpassen in de `config.lua` bij **Config.Deur** kan je de ingang van de wasserette wijzigen.
- Locatie waskaart aanpassen in  de `config.lua` bij **Config.KaartLocatie** kan je de plek van inklok apparaat wijzigen.
- De duurtijd witwassen kan je aanpassen in de `config.lua` bij **Config.WasTijd** (in miliseconden)
- De cooldown tussen elke keer dat je inklok apparaat kan openen kan je aanpassen in de `config.lua` bij **Config.Cooldown** (in seconden)
- Ander item om te gebruiken pas je aan in `config.lua` bij **Config.Kaartje**. Let op dat natuurlijk je item in de `shared.lua` zit!

## Dependencies
- Qbus Core
- Qbus Progressbars
- Qbus Animations
- Qbus Inventory
