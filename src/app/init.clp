(deftemplate gf 
    (slot name)
    (slot distance)
    (slot personality)
    (slot age)	
)

(deffacts init-data
    (gf (name "Vannessa Angel") (distance 3000) (personality "Introvert") (age 20))
    (gf (name "Jessica Ryan") (distance 4000) (personality "Introvert") (age 19))
    (gf (name "Vionny Audrey") (distance 2500) (personality "Introvert") (age 21))
    (gf (name "Holyvia Marcella") (distance 2000) (personality "Extrovert") (age 25))
    (gf (name "Gratia Honestha") (distance 1000) (personality "Extrovert") (age 22))
    (gf (name "Jaysie Lestari") (distance 1500) (personality "Introvert") (age 27))
    (gf (name "Glory Daniella") (distance 5500) (personality "Extrovert") (age 19))
    (gf (name "Gabriella Skolastika") (distance 3500) (personality "Extrovert") (age 30))
    (gf (name "Alicia") (distance 4500) (personality "Extrovert") (age 32))
)

(reset)
(save-facts "girlfriends.clp")
