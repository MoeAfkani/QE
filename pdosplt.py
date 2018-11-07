import pandas as pd
df = pd.read_csv("/home/abedi/QE/q-e-qe-6.1.0/project/IrCrGe/IrCrGe/IrCrGe.pdos.pdos_atm#1(Ir)_wfc#1(s)")
E=df[["E"]]
print E
