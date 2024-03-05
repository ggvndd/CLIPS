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
        and (budget A)(processor 2)(graphiccard 1)(ram 1)
    ) =>

    (retract 1)
    (assert (built build1))
    (printout t "We recommend Ryzen 5 5600G with it's integrated graphic cards, or Ryzen 5 5600 with RTX 3060 12 GB, both with 8 gb of 3200 MHz RAM." crlf)
)

(defrule build2
    (
        and (budget A)(processor 2)(graphiccard 1)(ram 2)
    ) =>

    (assert (built build2))
    (printout t "We recommend Ryzen 5 5600G with it's integrated graphic cards, or Ryzen 5 5600 with RTX 3060 12 GB, both with 16 gb or more of 3200 MHz RAM." crlf)
)

(defrule build3
    (
        and (budget A)(processor 1)(graphiccard 1)(ram 1)
    ) =>

    (assert (built build3))
    (printout t "We don't have any iGPU for Intel, but we recommend Intel i5 13400F with RTX 3060 12 GB, with 8 gb of 3200 MHz RAM for DDR4 or 4800 MHz for DDR5." crlf)
)

(defrule build4
    (
        and (budget A)(processor 1)(graphiccard 2)(ram 1)
    ) =>

    (assert (built build4))
    (printout t "We don't have any iGPU for Intel, but we recommend Intel i5 13400F with RX 6600 12 GB. with 8 gb of 3200 MHz RAM for DDR4 or 4800 MHz for DDR5." crlf)
)

(defrule build5
    (
        and (budget A)(processor 2)(graphiccard 2)(ram 2)
    ) =>

    (assert (built build5))
    (printout t "We recommend Ryzen 5 5600G with it's integrated graphic cards, or Ryzen 5 5600 with  RX 6600 12 GB, with 16 gb or more of 3200 MHz RAM(DDR4) or 4800 MHz(DDR5) ." crlf)
)

(defrule build6
    (
        and (budget A)(processor 1)(graphiccard 1)(ram 2)
    ) =>

    (assert (built build6))
    (printout t "We don't have any iGPU for Intel, but we recommend Intel i5 13400F with RTX 3060 12 GB, with 16 gb or more of 3200 MHz RAM(DDR4) or 4800 MHz(DDR5)." crlf)
)

(defrule build7
    (
        and (budget A)(processor 2)(graphiccard 2)(ram 1)
    ) =>

    (assert (built build7))
    (printout t "We recommend Ryzen 5 5600G with it's integrated graphic cards, or Ryzen 5 5600 with RX 6600 12 GB, both accompanied with 8 gb of 3200 MHz RAM(DDR4) or 4800 MHz(DDR5)." crlf)
)

(defrule build8
    (
        and (budget A)(processor 1)(graphiccard 2)(ram 2)
    ) =>

    (assert (built build8))
    (printout t "We don't have any iGPU for Intel, but we recommend Intel i5 13400F with RTX 3060 12 GB, with 16 gb or more of 3200 MHz RAM(DDR4) or 4800 MHz(DDR5)" crlf)
)

(defrule build9
    (
        and (budget B)(processor 1)(graphiccard 1)(ram 1)
    ) =>

    (assert (built build9))
    (printout t "We recommend Intel i5 13500 with RTX 4060ti 8 GB, with 8 GB of 4800 MHz DDR5 RAM." crlf)
)

(defrule build10
    (
        and (budget B)(processor 1)(graphiccard 1)(ram 2)
    ) =>

    (assert (built build10))
    (printout t "We recommend Intel i5 13500 with RTX 4060ti 8 GB, with 16 GB or more of 4800 MHz DDR5 RAM" crlf)
)

(defrule build11
    (
        and (budget B)(processor 1)(graphiccard 2)(ram 2)
    ) =>

    (assert (built build11))
    (printout t "We recommend Intel i5 13500 with RX 7800XT 16 GB, with 16 GB or more of 4800 MHz DDR5 RAM" crlf)
)

(defrule build12
    (
        and (budget B)(processor 1)(graphiccard 2)(ram 1)
    ) =>

    (assert (built build12))
    (printout t "We recommend Intel i5 13500 with RTX 4060ti 8 GB, with 8 GB of 4800 MHz DDR5 RAM" crlf)
)

(defrule build13
    (
        and (budget B)(processor 2)(graphiccard 1)(ram 1)
    ) =>

    (assert (built build13))
    (printout t "We recommend Ryzen 5 7500f with RTX 4060ti 8 GB, with 8 GB of 5200 MHz DDR5 RAM" crlf)
)

(defrule build14
    (
        and (budget B)(processor 2)(graphiccard 1)(ram 2)
    ) =>

    (assert (built build14))
    (printout t "We recommend Ryzen 5 7500f with RTX 4060ti 8 GB, with 16GB or more of 5200 MHz DDR5 RAM" crlf)
)

(defrule build15
    (
        and (budget B)(processor 2)(graphiccard 2)(ram 1)
    ) =>

    (assert (built build15))
    (printout t "We recommend Ryzen 5 7500f with RX 7800XT 16GB, with 8 GB of 5200 MHz DDR5 RAM" crlf)
)

(defrule build16
    (
        and (budget B)(processor 2)(graphiccard 2)(ram 2)
    ) =>

    (assert (built build16))
    (printout t "We recommend Ryzen 5 7500f with RX 7800XT 16GB, with 16GB or more of 5200 MHz DDR5 RAM" crlf)
)

(defrule build17
    (
        and (budget C)(processor 1)(graphiccard 1)(ram 1)
    ) =>

    (assert (built build17))
    (printout t "We recommend Intel i5 14600k with RTX 4080, with 8GB of 5600 MHz DDR5 RAM" crlf)
)

(defrule build18
    (
        and (budget C)(processor 1)(graphiccard 1)(ram 2)
    ) =>

    (assert (built build18))
    (printout t "We recommend Intel i5 14600k with RTX 4080, with 16GB or more of 5600 MHz DDR5 RAM" crlf)
)

(defrule build19
    (
        and (budget C)(processor 1)(graphiccard 2)(ram 2)
    ) =>

    (assert (built build19))
    (printout t "We recommend Intel i5 14600k with RX 7900 XTX, with 16GB or more of 5600 MHz DDR5 RAM" crlf)
)

(defrule build20
    (
        and (budget C)(processor 1)(graphiccard 2)(ram 1)
    ) =>

    (assert (built build20))
    (printout t "We recommend Intel i5 14600k with RX 7900 XTX, with 8GB of 5600 MHz DDR5 RAM" crlf)
)

(defrule build21
    (
        and (budget C)(processor 2)(graphiccard 2)(ram 1)
    ) =>

    (assert (built build21))
    (printout t "We recommend Ryzen 7 7800X3D with RX 7900 XTX, with 8GB of 5200 MHz DDR5 RAM" crlf)
)

(defrule build22
    (
        and (budget C)(processor 2)(graphiccard 2)(ram 2)
    ) =>

    (assert (built build22))
    (printout t "We recommend Ryzen 7 7800X3D with RX 7900 XTX, with 16GB or more of 5200 MHz DDR5 RAM" crlf)
)

(defrule build23
    (
        and (budget C)(processor 2)(graphiccard 1)(ram 2)
    ) =>

    (assert (built build23))
    (printout t "We recommend Ryzen 7 7800X3D with RTX 4080, with 16GB or more of 5200 MHz DDR5 RAM" crlf)
)

(defrule build24
    (
        and (budget C)(processor 2)(graphiccard 1)(ram 1)
    ) =>

    (assert (built build24))
    (printout t "We recommend Ryzen 7 7800X3D with RTX 4080, with 8GB of 5200 MHz DDR5 RAM" crlf)
)
