1+3

#Hallo R, wie geht es dir?

  
print("Alles was ihr in diesem Fenster schreibt ist wie ein Kochrezept, welches beliebig oft erneut ausgeführt werden kann")


# Mit Hasthag könnt ihr Notizen im Code machen
 
 
 
















































# Eine kleine Demonstration von Code und dem "Beschäftigt-Symbol"  
Beispiel <- c("Tier", "ABC", "Hallo")
w <- 33  

for (i in w){
  if(i < 70000){
    print("Das Programm läuft")
    print("und läuft")
    print("und läuft")
  } else {
    print("ACHTUNG, gleich fertig")
    }
}
print("Fertig")
w
































### Das Environment-Panel (oben rechts)

# Zuweisung von Werten
Dozentin <- "Judith"
Dozent <- "Michael"
Raum <- 537
Gebäude <- "VMP9"


1+w

print(Dozent)
































###Das Plot & Help Panel

# ich generiere Zufallszahlen
Zufallszahlen <- rnorm(100, mean=50, sd=10)  # 100 Zufallszahlen mit Mittelwert 50 und Standardabweichung 10
# Mit dem Befehl plot() bekomme ich ein Streudiagramm 
# Damit R weiss, von welchen Daten ich ein Diagramm möchte,verweise ich
# "Zufallszahlen" weil ich unter diesem Namen meine Daten gespeichert habe
plot(Zufallszahlen)
hist(Zufallszahlen)
print(Zufallszahlen)
Zufallszahlen <- 3

# Was passiert wenn ich das Environment lösche?
print(Zufallszahlen)
# Hier werden die Vorteile des Scriptes (= des Kochrezepts) besonders deutlich





?print()
?hist()
?c()

























### 3) Datensatz einlesen
# Notwendiges Paket laden
install.packages("readxl")
library(readxl)

data <- read_excel("C:\\Users\\Michael\\Downloads\\beispieldaten.xlsx")

# Datensatz anschauen (rechts im Environment-Panel Doppelklick auf "data")

































#### 4) Reliabilitätstest

#notwendiges Paket installieren und aktivieren
install.packages("irr") 
library(irr)



# Die relevanten Spalten aus "data", also die Bewertungen der drei Coder 
# werden in einer neuen Datentabelle abgespeichert. (Ihr seht dann rechts 
# im Environment den neuen Datensatz mit dem namen "bewertungen")
bewertungen <- data[, c("tone_trump_c1","tone_trump_c2", "tone_trump_c3")]

# Berechnung von Krippendorff's Alpha
kripp.alpha(t(bewertungen))
