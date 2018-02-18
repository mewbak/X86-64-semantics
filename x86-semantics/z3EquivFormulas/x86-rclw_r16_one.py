from z3 import *
import proverUtils
# Declarations
CF = BitVec('CF', 1)
PF = BitVec('PF', 1)
AF = BitVec('AF', 1)
ZF = BitVec('ZF', 1)
SF = BitVec('SF', 1)
OF = BitVec('OF', 1)

RAX = BitVec('RAX', 64)
RCX = BitVec('RCX', 64)
ZERO1 = BitVecVal(0, 1)
ONE1 = BitVecVal(1, 1)

cf = (CF == ONE1)
pf = (PF == ONE1)
af = (AF == ONE1)
zf = (ZF == ONE1)
sf = (SF == ONE1)
of = (OF == ONE1)


print('[6;30;44m' + 'Opcode:rclw_r16_one' + '[0m')

R1 = BitVec('R1', 64)
R2 = BitVec('R2', 64)
CONST_BV_S1_V0 = BitVecVal(0, 1)
CONST_BV_S16_V0 = BitVecVal(0, 16)
CONST_BV_S1_V1 = BitVecVal(1, 1)
CONST_BV_S17_V1 = BitVecVal(0x1, 17)

PK_CF = (Extract( ( ( Concat((CONST_BV_S1_V0), Extract( R2.size() - 48 - 1, R2.size() - 64, R2  ) ) + Concat((CONST_BV_S1_V0), Extract( R2.size() - 48 - 1, R2.size() - 64, R2  ) ) ) + Concat((CONST_BV_S16_V0), CF) ).size() - 0 - 1, ( ( Concat((CONST_BV_S1_V0), Extract( R2.size() - 48 - 1, R2.size() - 64, R2  ) ) + Concat((CONST_BV_S1_V0), Extract( R2.size() - 48 - 1, R2.size() - 64, R2  ) ) ) + Concat((CONST_BV_S16_V0), CF) ).size() - 1, ( ( Concat((CONST_BV_S1_V0), Extract( R2.size() - 48 - 1, R2.size() - 64, R2  ) ) + Concat((CONST_BV_S1_V0), Extract( R2.size() - 48 - 1, R2.size() - 64, R2  ) ) ) + Concat((CONST_BV_S16_V0), CF) )  )  ) == ONE1
PS_CF = ((Extract (16, 16, (((If( (cf),((Concat((CONST_BV_S1_V0), (Extract (15, 0, ((R2)))))) + (CONST_BV_S17_V1)),(Concat((CONST_BV_S1_V0), (Extract (15, 0, ((R2)))))))) + (Concat((CONST_BV_S1_V0), (Extract (15, 0, ((R2)))))))))) == (CONST_BV_S1_V1))
proverUtils.prove( PK_CF == PS_CF )

PK_OF = ((If (( (And( ( Extract( R2.size() - 48 - 1, R2.size() - 49, R2  ) == Extract( R2.size() - 48 - 1, R2.size() - 49, R2  )  ) ,  (Not  ( ( Extract( R2.size() - 48 - 1, R2.size() - 49, R2  ) == Extract( ( ( Concat((CONST_BV_S1_V0), Extract( R2.size() - 48 - 1, R2.size() - 64, R2  ) ) + Concat((CONST_BV_S1_V0), Extract( R2.size() - 48 - 1, R2.size() - 64, R2  ) ) ) + Concat((CONST_BV_S16_V0), CF) ).size() - 1 - 1, ( ( Concat((CONST_BV_S1_V0), Extract( R2.size() - 48 - 1, R2.size() - 64, R2  ) ) + Concat((CONST_BV_S1_V0), Extract( R2.size() - 48 - 1, R2.size() - 64, R2  ) ) ) + Concat((CONST_BV_S16_V0), CF) ).size() - 2, ( ( Concat((CONST_BV_S1_V0), Extract( R2.size() - 48 - 1, R2.size() - 64, R2  ) ) + Concat((CONST_BV_S1_V0), Extract( R2.size() - 48 - 1, R2.size() - 64, R2  ) ) ) + Concat((CONST_BV_S16_V0), CF) )  )  )  ))  ))  ) , ( (CONST_BV_S1_V1) ) , ( (CONST_BV_S1_V0) ) ))  ) == ONE1
PS_OF = (And((((Extract (15, 15, ((R2)))) == (CONST_BV_S1_V1)) == ((Extract (15, 15, ((R2)))) == (CONST_BV_S1_V1))), (Not((((Extract (15, 15, ((R2)))) == (CONST_BV_S1_V1)) == ((Extract (15, 15, (((If( (cf),((Concat((CONST_BV_S1_V0), (Extract (15, 0, ((R2)))))) + (CONST_BV_S17_V1)),(Concat((CONST_BV_S1_V0), (Extract (15, 0, ((R2)))))))) + (Concat((CONST_BV_S1_V0), (Extract (15, 0, ((R2)))))))))) == (CONST_BV_S1_V1)))))))
proverUtils.prove( PK_OF == PS_OF )

PK_R2 = (Concat(Extract( R2.size() - 0 - 1, R2.size() - 48, R2  ) , Extract( ( ( Concat((CONST_BV_S1_V0), Extract( R2.size() - 48 - 1, R2.size() - 64, R2  ) ) + Concat((CONST_BV_S1_V0), Extract( R2.size() - 48 - 1, R2.size() - 64, R2  ) ) ) + Concat((CONST_BV_S16_V0), CF) ).size() - 1 - 1, ( ( Concat((CONST_BV_S1_V0), Extract( R2.size() - 48 - 1, R2.size() - 64, R2  ) ) + Concat((CONST_BV_S1_V0), Extract( R2.size() - 48 - 1, R2.size() - 64, R2  ) ) ) + Concat((CONST_BV_S16_V0), CF) ).size() - 17, ( ( Concat((CONST_BV_S1_V0), Extract( R2.size() - 48 - 1, R2.size() - 64, R2  ) ) + Concat((CONST_BV_S1_V0), Extract( R2.size() - 48 - 1, R2.size() - 64, R2  ) ) ) + Concat((CONST_BV_S16_V0), CF) )  ) ) )
PS_R2 = (Concat((Extract (63, 16, ((R2)))), (Extract (15, 0, (((If( (cf),((Concat((CONST_BV_S1_V0), (Extract (15, 0, ((R2)))))) + (CONST_BV_S17_V1)),(Concat((CONST_BV_S1_V0), (Extract (15, 0, ((R2)))))))) + (Concat((CONST_BV_S1_V0), (Extract (15, 0, ((R2))))))))))))
proverUtils.prove( PK_R2 == PS_R2 )

