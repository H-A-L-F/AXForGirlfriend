(load-facts "girlfriends.clp")
; Type = Introvert -> Age > 30 display gf Introvert and Age > 30
; Type = Introvert -> Age <= 30 display gf Introvert and Age <= 30
; Type = Extrovert -> Distance > 5000 display gf Extrovert and Distance > 5000
; Type = Extrovert -> Distance <= 5000 display gf Extrovert and Dsitance <= 5000

(deftemplate ft_gf 
    (slot name)
    (slot distance)
    (slot personality)
    (slot age)	
)

(deftemplate gf 
    (slot name)
    (slot distance)
    (slot personality)
    (slot age)	
)

(defrule introvert_age_greater_30
    (ag_gr_30 ?personality_ ?age_)
	(gf (name ?name) (distance ?distance) (personality ?personality) (age ?age))
    (test (and (> ?age 30) (eq ?personality_ ?personality)))
	=>
	(assert (ft_gf (name ?name) (distance ?distance) (personality ?personality) (age ?age)))
)

(defrule introvert_age_lesser_equal_30
    (ag_ls_30 ?personality_ ?age_)
	(gf (name ?name) (distance ?distance) (personality ?personality) (age ?age))
	(test (and (<= ?age 30) (eq ?personality_ ?personality)))
	=>
	(assert (ft_gf (name ?name) (distance ?distance) (personality ?personality) (age ?age)))
)

(defrule extrovert_distance_greater_5000
    (ds_gr_50 ?personality_ ?distance_)
	(gf (name ?name) (distance ?distance) (personality ?personality) (age ?age))
	(test(and (> ?distance 5000) (eq ?personality_ ?personality)))
	=>
	(assert (ft_gf (name ?name) (distance ?distance) (personality ?personality) (age ?age)))
)

(defrule extrovert_distance_lesser_equal_5000
    (ds_ls_50 ?personality_ ?distance_)
	(gf (name ?name) (distance ?distance) (personality ?personality) (age ?age))
	(test(and (<= ?distance 5000) (eq ?personality_ ?personality)))
	=>
	(assert (ft_gf (name ?name) (distance ?distance) (personality ?personality) (age ?age)))
)

(defrule ageRules
    (age_rules ?personality_ ?age_)
    =>
    (if (> ?age_ 30) then
    	(assert (ag_gr_30 ?personality_ ?age_)) 
        (run)
     else
        (assert (ag_ls_30 ?personality_ ?age_)) 
        (run)
    )
)

(defrule distanceRules
     (distance_rules ?personality_ ?distance_)
     =>
    (if (> ?distance_ 5000) then
    	(assert (ds_gr_50 ?personality_ ?distance_)) 
        (run)
     else
        (assert (ds_ls_50 ?personality_ ?distance_))
        (run)
    )
)

(defrule filter
    (start_filter ?personality_ ?distance_ ?age_)
    =>
    (if (eq ?personality_ "Introvert") then 
       (assert (age_rules ?personality_ ?age_) )
        (run)
     else 
       (assert (distance_rules ?personality_ ?distance_) ) 
        (run)       
    )
)

(printout t "Insert girl's personality: " )
(bind ?personality (readline))
(printout t "Insert girl's distance: " )
(bind ?distance_str (readline))
(bind ?distance (integer ?distance_str))
(printout t "Insert girl's age: " )
(bind ?age_str (readline))
(bind ?age (integer ?age_str))

(assert (start_filter ?personality ?distance ?age)) 
(run)
(defquery get_filtered
	(
	        ft_gf (name ?name) (distance ?distance) (personality ?personality) (age ?age)
	)
)

(new app.Filter)    
(reset)