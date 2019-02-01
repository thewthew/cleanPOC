# cleanPOC
Exercice en Clean Swift 

L'exercice en Clean Swift à réaliser :
Ecran 1
Une page qui affiche le nombre de fois que l'application a été ouverte dans la langue choisie dans l'écran
Un bouton suivant qui permet de passer à l'écran 2

Ecran 2
Une liste des Timezones récupérées depuis un WS : http://api.timezonedb.com/v2.1/list-time-zone?key=HEG8FEDU4DE3&format=json
Lors du clique sur un Timezone, on affiche la page 3 en lui passant le timezone en paramètre

Ecran 3
Label simple dans le contenu provient d'un WS : http://api.timezonedb.com/v2.1/get-time-zone?key=HEG8FEDU4DE3&format=json&by=zone&zone=Europe/Paris
Date à récupérer du WS dans le timezone choisie et à afficher en locale FR
Un bouton pour rafraichir l'heure
