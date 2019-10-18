#!/usr/bin/python3

opcodes_file = "../utils/riscv-opcodes/opcodes"

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
