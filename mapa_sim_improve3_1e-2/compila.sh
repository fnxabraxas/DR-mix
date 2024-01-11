
for p in 'estac_recurren' 'estac_recurren_ext1' 'mapea_sim' 'markov' 'payM' 'probabs' 'recurrentes' 'renorm_sim' 'tocapicues' 'tocapicues_cuasi' 'fixation'
do

f=$p'.f'
exe=$p

gfortran $f -o $exe

done
