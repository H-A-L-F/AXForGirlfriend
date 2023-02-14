(load-facts "girlfriends.clp")

(deftemplate gf 
    (slot name)
    (slot distance)
    (slot personality)
    (slot age)	
)

(defquery get-gfs
	(
	        gf (name ?name) (distance ?distance) (personality ?personality) (age ?age)
	)
)

(new app.Query)    