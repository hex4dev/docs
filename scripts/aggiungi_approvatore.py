import re
import sys

login = sys.argv[1]

# username GitHub -> nome e cognome come scritti nei verbali
NOMI = {
  "Noggy04": "Andrea Nogara",
  "babybolsi": "Francesco Bassani",
  "Flaine7": "Matilde Pedrocchi",
  "RavUipd": "Alessandro Ravenna",
  "NotANullPointer": "Alessandro Zanier",
  "matt154154": "Matteo Angelini",
}
approvazione = NOMI.get(login, login)

for path in open("changed.txt").read().split():
    with open(path, encoding="utf-8") as f:
        righe = f.read().split("\n")

    if any(re.match(r"\s*approvazione\s*:", r) for r in righe):
        continue  # già presente

    for i, r in enumerate(righe):
        if re.match(r"\s*verbalizzante\s*:", r):
            indent = re.match(r"\s*", r).group()
            righe.insert(i + 1, f'{indent}approvazione: "{approvazione}",')
            break
    else:
        print(f"ATTENZIONE: nessun campo 'verbalizzante' in {path}")
        continue

    with open(path, "w", encoding="utf-8") as f:
        f.write("\n".join(righe))
