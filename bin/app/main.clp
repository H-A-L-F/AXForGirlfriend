(batch "app/init.clp")

(deftemplate gf 
    (slot name)
    (slot distance)
    (slot personality)
    (slot age)	
)

(deffunction add-gf ()
    (while TRUE
	 do 
        (printout t "Insert girl's name [5..20]: " )
    	(bind ?name (readline))
        (if (and (>= (str-length ?name) 5) (<= (str-length ?name) 20)) then
			(break)
         else
            (printout t "Name must be between 5 - 20 characters" crlf)
		)
	)
    
    (while TRUE
	 do 
        (printout t "Insert girl's distance [1000..9999]: " )
		(bind ?distance_str (readline))
	    (bind ?distance (integer ?distance_str))
	    (if (and (>= ?distance 1000) (<= ?distance 9999)) then 
	    	(break)
         else
            (printout t "Distance must be between 1000 - 9999" crlf)
	    )
	)
    
    (while TRUE
	 do 
       	(printout t "Insert girl's personality [Extrovert | Introvert]: " )
    	(bind ?personality (readline))
        (if (or (eq ?personality "Extrovert") (eq ?personality "Introvert")) then
			(break)
         else
            (printout t "Girl's personality must be "Extrovert" or "Introvert"" crlf)
		)
	)
    
    (while TRUE
	 do 
        (printout t "Insert girl's age [19..40]: " )
    	(bind ?age_str (readline))
	    (bind ?age (integer ?age_str))
	    (if (and (>= ?age 19) (<= ?age 40)) then 
	    	(break)
         else
            (printout t "Age must be between 19 - 40" crlf)
	    )
	)
    
	(assert (gf (name ?name) (distance ?distance) (personality ?personality) (age ?age)))
    (return)
)

(deffunction delete ()
    (printout t "Insert fact-id to be deleted: " )
	(bind ?target_string (readline))
    (bind ?id (integer ?target_string))
    (retract ?id)
    (save-facts "girlfriends.clp")
)

(deffunction update ()
    (printout t "Insert fact-id to be updated: " )
	(bind ?target_string (readline))
    (bind ?id (integer ?target_string))
    (while TRUE
	 do 
        (printout t "Insert girl's name [5..20]: " )
    	(bind ?name (readline))
        (if (and (>= (str-length ?name) 5) (<= (str-length ?name) 20)) then
			(break)
         else
            (printout t "Name must be between 5 - 20 characters" crlf)
		)
	)
    
    (while TRUE
	 do 
        (printout t "Insert girl's distance [1000..9999]: " )
		(bind ?distance_str (readline))
	    (bind ?distance (integer ?distance_str))
	    (if (and (>= ?distance 1000) (<= ?distance 9999)) then 
	    	(break)
         else
            (printout t "Distance must be between 1000 - 9999" crlf)
	    )
	)
    
    (while TRUE
	 do 
       	(printout t "Insert girl's personality [Extrovert | Introvert]: " )
    	(bind ?personality (readline))
        (if (or (eq ?personality "Extrovert") (eq ?personality "Introvert")) then
			(break)
         else
            (printout t "Girl's personality must be "Extrovert" or "Introvert"" crlf)
		)
	)
    
    (while TRUE
	 do 
        (printout t "Insert girl's age [19..40]: " )
    	(bind ?age_str (readline))
	    (bind ?age (integer ?age_str))
	    (if (and (>= ?age 19) (<= ?age 40)) then 
	    	(break)
         else
            (printout t "Age must be between 19 - 40" crlf)
	    )
	)
    
    (printout t "id: " ?id crlf)
    (modify ?id (name ?name) (distance ?distance) (personality ?personality) (age ?age))	
    (save-facts "girlfriends.clp")
)


(deffunction menuHome ()
    (bind ?ch (readline))
	(if (eq ?ch "1") then
        	(add-gf)
        	(save-facts "girlfriends.clp")
        
        elif(eq ?ch "2") then
        	(reset)
        	(batch "app/view.clp")  
        
       	elif(eq ?ch "3") then
        	(reset)
        	(load-facts "girlfriends.clp")
        	(facts)
        	(update)
        
        elif(eq ?ch "4") then
        	(reset)
        	(load-facts "girlfriends.clp")
        	(facts)
        	(delete)
        
       	elif(eq ?ch "5") then
       	 	(reset)
        	(batch "app/filter.clp")
        
       	elif(eq ?ch "6") then
            (printout t "Thanks for playing" crlf)
        	(exit)
        
        else 
        	(printout t "Invalid input" crlf)
    )        
)

(while TRUE
do 
    (printout t "1. Add Girlfriends"crlf)
    (printout t "2. View Girlfriends" crlf)
    (printout t "3. Update Girlfriends" crlf)
    (printout t "4. Delete Girlfriends" crlf)
    (printout t "5. Simulate Girlfriends" crlf)
    (printout t "6. Exit" crlf)
    (printout t "Choose: ")
    (menuHome)
)
