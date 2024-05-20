library(dplyr)
library(readxl)


# Daten einlesen

data <- read_excel("EUER PFAD\\data_example.xlsx")














# Mittelwerte berechnen
mean(data$pics)
median(data$pics)


outlet_means <- data %>% group_by(article_type) %>% summarise(mean_value = mean(pics))
outlet_means

# Viele Wege führen in R zum gleichen Ergebnis!



















## nun wollen wir die Mittelwerte vergleichen:

# Zu vergleichende Werte isolieren:
agentur <- data$pics[data$article_type == "agentur"]
normal <- data$pics[data$article_type == "normal"]

t.test(agentur, normal)
mean(agentur)









### Bonus // nicht für euch relevant
agentur_resampled <- sample(agentur, 100, replace = TRUE)
mean(agentur_resampled)
normanormanormal_resampled <- sample(normal, 100, replace = TRUE)
mean(normanormanormal_resampled)

t.test(agentur_resampled, normanormanormal_resampled)










# Diese Daten habt ihr nicht, ihr könnt die Analysen daher nicht selbst anwenden.
data2 <- read_excel("\\survey_example.xlsx")


#use
#1 nie
#2 Vergangenheit
#3 <1 Woche
#4 1-3 Tage/Woche
#5 3-5 Tage/Woche
#6 täglich
#7 mehrfach täglich


##gender
#1 männlich
#2 weiblich


### Selbsteinschätzung im Geschlechtervergleich

# Auswählen, für welche Spalten ich den mean berechnen will
cols <- grep("A\\d{2}", names(data2))
# Spalten als numeric definieren
#data2[, cols] <- lapply(data2[, cols], as.numeric)

# Mittelwert erzeugen
data2$terms_known <- rowMeans(data2[,cols],na.rm = TRUE)
data2$terms_known

mean(data2$terms_known)
mean(data2$terms_known[data2$gender== 1])
mean(data2$terms_known[data2$gender==2])

# Vergleich Geschlecht
t.test(data2$terms_known[data2$gender == 1], data2$terms_known[data2$gender == 2])



# Macht Erfahrung mit ChatGPT einen Unterschied?
# Überblick
Usemean <- data2 %>% group_by(Use) %>% summarise(mean_value = mean(terms_known))
Usemean
t.test(data2$terms_known[data2$Use<=2], data2$terms_known[data2$Use>4])
















#### Wissensfragen

# Summe richtiger Antworten erzeugen
cols <- grep("rf\\d{2}a", names(data2))
data2$questions_right <- rowSums(data2[,cols],na.rm = TRUE)

test <- c(1,2,3,4,5,6,NA)
mean(test, na.rm=T)

# Geschlechtervergleich
# Überblick
data2$questions_right[data2$gender==1]
test <- subset(data2)
test$questions_right

data2$questions_right[data2$gender==2]




t.test(data2$questions_right[data2$gender==1],data2$questions_right[data2$gender==2])


### Mittelwertvergleich
t.test(data2$terms_known[data2$gender == 1], data2$terms_known[data2$gender == 2])



Usemean2 <- data2 %>% group_by(Use) %>% summarise(mean_value = mean(questions_right))
Usemean2
t.test(data2$questions_right[data2$Use<=2], data2$questions_right[data2$Use>2])





###### Vergleich der beiden Masszahlen
cor.test(data2$terms_known, data2$questions_right)

