(defrule budgetPC
    =>
    (printout t crlf "What budget do you have? [A: Entry Level, B: Mid Range, C: Enthusiast]: ")
    (assert (budget (read)))
)

(defrule EntryLevel
    (ikan M) =>
    (printout t "What Processor do you prefer to have? [1: Intel, 2: AMD]: ")
    (assert (processor (read)))
    (printout t "What VGA do you prefer? [1: AMD Radeon, 2: NVIDIA Geforce]: ")
    (assert (graphiccard (read)))
    (printout t "Bagaimana aktivitas atau gerakan ikan? [1: normal, 2: malas/bergerak lambat]: ")
    (assert (gerakan (read)))
    (printout t crlf "=== KESIMPULAN KONDISI IKAN ===" crlf)
)

(defrule ikanNila
    (ikan N) =>
    (printout t "Bagaimana kondisi tubuh ikan? [1: Bercak putih, 2: Bercak merah, 3: Kehitaman]: ")
    (assert (kulit (read)))
    (printout t "Bagaimana kondisi mata ikan? [1: normal, 2: bengkak]: ")
    (assert (mata (read)))
    (printout t "Bagaimana aktivitas atau gerakan ikan? [1: normal, 2: malas/bergerak lambat]: ")
    (assert (gerakan (read)))
    (printout t crlf "=== KESIMPULAN KONDISI IKAN ===" crlf)
)

(defrule ikanGurame
    (ikan G) =>
    (printout t "Bagaimana kondisi tubuh ikan? [1: Bercak putih, 2: Bercak merah, 3: Bentol]: ")
    (assert (kulit (read)))
    (printout t "Bagaimana kondisi mata ikan? [1: normal, 2: berkabut]: ")
    (assert (mata (read)))
    (printout t "Bagaimana aktivitas atau gerakan ikan? [1: normal, 2: malas/bergerak lambat]: ")
    (assert (gerakan (read)))
    (printout t crlf "=== KESIMPULAN KONDISI IKAN ===" crlf)
)


; DIAGNOSE SYMPTOMS

(defrule saprolegniasis
    (
        and (ikan M)(kulit 1)(mata 1|2)(gerakan 2)
    ) =>

    (retract 1)
    (assert (diagnosis saprolegniasis))
    (printout t "Ikan terindikasi terjangkit parasit Saprolegnia" crlf)
)

(defrule whiteSpot
    (
        and (mata 1) (kulit 1) (or (and (ikan M) (gerakan 1)) (and (ikan N|G) (gerakan 1|2)))
    ) =>
    (assert (diagnosis whiteSpot))
    (printout t "Ikan terindikasi terjangkit white spot" crlf)
)

(defrule aeromonas
    (
        and (kulit 2) (mata 2) (ikan M|N|G) (gerakan 2)
    ) =>
    (assert (diagnosis aeromonas))
    (printout t "Ikan terindikasi terjangkit parasit Aeromonas" crlf)
)

(defrule luka
    (
        and (kulit 2) (ikan M|N|G) (gerakan 1|2) (mata 1)
    ) =>
    (assert (diagnosis luka))
    (printout t "Ikan kemungkinan hanya terluka" crlf)
)

(defrule TiLV
    (
        and (or (and (ikan N) (gerakan 2) (kulit 3) (mata 2)) (and (ikan G) (kulit 3) (gerakan 1|2) (mata 2)))
    ) =>
    (assert (diagnosis TiLV))
    (printout t "Ikan terindikasi terjangkit TiLV" crlf)
)

(defrule undefined
    (
        and (ikan M|N|G) (not (diagnosis saprolegniasis|luka|aeromonas|TiLV|whiteSpot))
    ) =>
    (assert (diagnosis undefined))
    (printout t "Maaf sistem kami belum dapat memberikan diagnosa" crlf)
)

