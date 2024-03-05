(defrule budgetPC
    =>
    (printout t crlf "What budget do you have? [A: Entry Level, B: Mid Range, C: Enthusiast]: ")
    (assert (budget (read)))
)

(defrule EntryLevel
    (budget A) =>
    (printout t "What Processor do you prefer to have? [1: Intel, 2: AMD]: ")
    (assert (processor (read)))
    (printout t "What VGA do you prefer? [1: AMD Radeon, 2: NVIDIA Geforce]: ")
    (assert (graphiccard (read)))
    (printout t "How much RAM do you need? [1: 8 gb (it is our bare minimum, sorry), 2: 15 gb]: ")
    (assert (ram (read)))
    (printout t crlf "=== Our Curated Build Is ===" crlf)
)

(defrule MidRange
    (budget B) =>
    (printout t "What Processor do you prefer to have? [1: Intel, 2: AMD]: ")
    (assert (processor (read)))
    (printout t "What VGA do you prefer? [1: AMD Radeon, 2: NVIDIA Geforce]: ")
    (assert (graphiccard (read)))
    (printout t "How much RAM do you need? [1: 8 gb (it is our bare minimum, sorry), 2: 16 gb or more]: ")
    (assert (ram (read)))
    (printout t crlf "=== Our Curated Build Is ===" crlf)
)

(defrule Enthusiast
    (budget C) =>
    (printout t "What Processor do you prefer to have? [1: Intel, 2: AMD]: ")
    (assert (processor (read)))
    (printout t "What VGA do you prefer? [1: AMD Radeon, 2: NVIDIA Geforce]: ")
    (assert (graphiccard (read)))
    (printout t "How much RAM do you need? [1: 8 gb (it is our bare minimum, sorry), 2: 16 gb or more]: ")
    (assert (ram (read)))
    (printout t crlf "=== Our Curated Build Is ===" crlf)
)


; Curating Build for the PC Requested By User

(defrule build1
    (
        and (budget A)(processor 1)(graphiccard 1)(ram 1)
    ) =>

    (retract 1)
    (assert (built build1))
    (printout t "We recommend Ryzen 5 5600G with it's integrated graphic cards, or Ryzen 5 5600 with RTX 3060 12 GB, both with 8 gb of 3200 MHz RAM." crlf)
)

(defrule build2
    (
        and (budget A)(processor 1)(graphiccard 1)(ram 2)
    ) =>

    (assert (built build2))
    (printout t "We recommend Ryzen 5 5600G with it's integrated graphic cards, or Ryzen 5 5600 with RTX 3060 12 GB, both with 16 gb or more of 3200 MHz RAM." crlf)
)


