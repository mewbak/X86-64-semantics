import angr
proj = angr.Project('./instructions/nopl_r32/nopl_r32.o')
print proj.arch
print proj.entry
print proj.filename
irsb = proj.factory.block(proj.entry).vex
irsb.pp()