(deftemplate Symptom
    (slot name)
    (slot cf (type FLOAT)))

(deffacts InitialFacts
    (Symptom (name headache) (cf 0.7))
    (Symptom (name fever) (cf 0.6))
    (Symptom (name cough) (cf 0.8)))

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
