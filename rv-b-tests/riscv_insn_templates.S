
/////////////////////////////////////////////////
//                                             //
//  Templates to generate new insns            //
//                                             //
//    All comments reference rv user spec      //
//    Chapter 24, the listing                  //
//                                             //
/////////////////////////////////////////////////


#define new_r_type_insn(_funct7, _rs2, _rs1, _funct3, _rd, _opcode) \
.word (((_funct7) << 25) | ((_rs2) << 20) | ((_rs1) << 15) | ((_funct3) << 12) | ((_rd) << 7) | ((_opcode) << 0))

  // I-type instructions imm here is all 12 bits in order imm[11:0] in the spec

#define new_i_type_insn(_imm, _rs1, _funct3, _rd, _opcode) \
.word ((_imm << 20)| (_rs1 << 15)| (_funct3 << 12)| (_rd << 7) | (_opcode << 0))

  // S-Type instructions have _imm_hi correspond to imm[11:5] and _imm_lo to imm[4:0] in spec
  // B-Type instructions have _imm_hi correspond to imm[12|10:5] and _imm_lo to imm[4:1|11] in spec

#define new_sb_type_insn(_imm_hi, _rs2, _rs1, _funct3, _imm_lo, _opcode) \
.word (((_imm_hi) << 25) | ((_rs2) << 20) | ((_rs1) << 15) | ((_funct3) << 12) | ((_imm_lo) << 7) | ((_opcode) << 0))

  // U-Type instructions have imm as imm[31:12] from the spec
  // J-Type instructions have imm as imm[20|10:1|11|19:12] from the spec

#define new_uj_type_insn(_imm, _rd, _opcode) \
.word (((_imm) << 12) | ((_rd) << 7) | ((_opcode) << 0))



