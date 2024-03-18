(deftemplate Symptom
    (slot name)
    (slot cf (type FLOAT)))

(defrule Rule1
    (Symptom (name headache) (cf ?cf1&:(> ?cf1 0.5)))
    (Symptom (name fever) (cf ?cf2&:(> ?cf2 0.5)))
    =>
    (assert (Symptom (name migraine) (cf (* ?cf1 ?cf2)))))

(defrule Rule2
    (Symptom (name cough) (cf ?cf1&:(> ?cf1 0.7)))
    =>
    (assert (Symptom (name bronchitis) (cf ?cf1))))

(defrule Rule3
    (or (Symptom (name headache) (cf ?cf&:(> ?cf 0.6)))
        (Symptom (name fever) (cf ?cf&:(> ?cf 0.6))))
    (not (Symptom (name cough)))
    =>
    (assert (Symptom (name common_cold) (cf ?cf))))

(defrule Rule4
    (and (Symptom (name headache) (cf ?cf&:(> ?cf 0.6)))
         (Symptom (name fever) (cf ?cf&:(> ?cf 0.6))))
    =>
    (assert (Symptom (name flu) (cf ?cf))))

(defrule Rule5
    (Symptom (name headache) (cf ?cf&:(> ?cf 0.8)))
    =>
    (assert (Symptom (name severe_headache) (cf ?cf))))

(defrule Rule6
    (Symptom (name headache) (cf ?cf&:(< ?cf 0.5)))
    =>
    (assert (Symptom (name unknown_headache) (cf ?cf))))

(defrule ProcessInput
    =>
    (printout t "Enter symptoms and their certainty factors (e.g., headache 0.7): " crlf)
    (bind ?input (readline))
    (if (str-compare ?input "")
        then
        (bind ?pos (str-index ?input " "))
        (if (>= ?pos 0)
            then
            (bind ?symptom (sub-string 1 ?pos ?input))
            (bind ?cf-str (sub-string (+ ?pos 1) (str-length ?input) ?input))
            (if (and (str-compare ?symptom "") (str-compare ?cf-str ""))
                then
                (bind ?cf (float ?cf-str))
                (assert (Symptom (name ?symptom) (cf ?cf)))
            )
        )
    )
)


(defrule DisplayResults
    (exists (Symptom))
    =>
    (printout t "Diagnosis results:" crlf)
    (printout t "-----------------" crlf)
    (printout t "| Symptom Name  | Certainty Factor |" crlf)
    (printout t "-----------------" crlf)
    (do-for-all-facts ((?s Symptom)) TRUE
        (printout t "| " (send ?s get name) " | " (float (send ?s get cf)) " |" crlf))
)

(defrule Cleanup
    (not (exists (Symptom)))
    =>
    (printout t "No symptoms entered. Exiting." crlf)
    (exit)
)
