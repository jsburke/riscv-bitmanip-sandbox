#!/usr/bin/python3

opcodes_file = "../utils/riscv-opcodes/opcodes"

  # use a list to make life easy
  # is an insn R-Type, I-Type, etc
  # this will need manual updates

insn_types = [("andn",   "R"),
              ("orn",    "R"),
              ("xnorn",  "R"),

              ("slo",    "R"),
              ("sro",    "R"),
              ("rol",    "R"),
              ("ror",    "R"),

              ("sbclr",  "R"),
              ("sbset",  "R"),
              ("sbinv",  "R"),
              ("sbext",  "R"),

              ("gorc",   "R"),
              ("grev",   "R"),

              ("sloi",   "I"),
              ("sroi",   "I"),
              ("rori",   "I"),

              ("sbclri", "I"),
              ("sbseti", "I"),
              ("sbinvi", "I"),
              ("sbexti", "I"),

              ("gorci",  "I"),
              ("grevi",  "I"),

              ("cmix",   "R4"),
              ("cmov",   "R4"),

              ("fsl",    "R4"),
              ("fsr",    "R4"),
              ("fsri",   "I4"),

              ("clz",    "R1"),
              ("ctz",    "R1"),
              ("pcnt",   "R1"),

]

def line_parse(line):
  line_clean = "" if "#" in line else line.strip()
  if line_clean is not "":
    print(line_clean)

def insns_read(filename):
  with open(filename, "r") as lines:
    insns = []
    ingest_lines = False
    # the below loop is very sensitive
    # to the order of things in opcodes
    for line in lines:
      if "RV32A" in line:
        ingest_lines = False
      if ingest_lines:
        line_parse(line)
      if "RV32B" in line:
        ingest_lines = True

def main():
  insns_read(opcodes_file)

main()
