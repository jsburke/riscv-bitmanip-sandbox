
#define new_r_type_insn(_funct7, _rs2, _rs1, _funct3, _rd, _opcode) \
.word (((_funct7) << 25) | ((_rs2) << 20) | ((_rs1) << 15) | ((_funct3) << 12) | ((_rd) << 7) | ((_opcode) << 0))

#define new_i_type_insn(_imm11_0, _rs1, _funct3, _rd, _opcode) \
.word
