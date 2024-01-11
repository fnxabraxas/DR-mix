#S=-0.5 #1.0
#T=1.5 #2.0
#eps=1.d-8

filtro=1.d-3

S=$1
T=$2
eps=$3


inp='payM_'$S'_'$T'_'$eps'.dat'
out='alllinks_fixation_'$S'_'$T'_'$eps'.dat'

dir='S_'$S'_T_'$T'_'eps'_'$eps

cd $dir

../fixation <<EOF
$inp
$out
EOF

outfil='alllinks_fixation_'$S'_'$T'_'$eps'_f.dat'

../filtro_fix <<EOF
$out
$filtro
$outfil
EOF

cd ..



for suf in '.dat' '_f.dat'
do

inp1='alllinks_fixation_'$S'_'$T'_'$eps$suf
out='recurrentes_1_fixation_'$S'_'$T'_'$eps$suf

dir='S_'$S'_T_'$T'_'eps'_'$eps

cd $dir

../tocapicues <<EOF
$inp1
input.dat
-1
EOF


cp input.dat ../../capicues/results/.

cd ../../capicues/bin
./main
cd ../../mapa_sim_improve3_1e-2/$dir
mv ../../capicues/results/recurrentes.dat $out
rm ../../capicues/results/input.dat


out2='cuasi_fixation_'$S'_'$T'_'$eps$suf

../tocapicues_cuasi <<EOF
$inp1
input.dat
$out
EOF


mv input.dat ../../capicues/results/.

cd ../../capicues/bin
./main
cd ../../mapa_sim_improve3_1e-2/$dir
mv ../../capicues/results/recurrentes.dat $out2
rm ../../capicues/results/input.dat


out3='recurrentes_fixation_'$S'_'$T'_'$eps$suf

../recurrentes <<EOF
$out
$out2
$out3
EOF

rm $out
rm $out2


cd ..



inp1='alllinks_fixation_'$S'_'$T'_'$eps$suf
out='Q-markov-chain_fixation_'$S'_'$T'_'$eps$suf

dir='S_'$S'_T_'$T'_'eps'_'$eps

cd $dir

../markov <<EOF
$inp1
$out
EOF


cd .. 




inp2='recurrentes_fixation_'$S'_'$T'_'$eps$suf
inp1='Q-markov-chain_fixation_'$S'_'$T'_'$eps$suf
out='ttt'

dir='S_'$S'_T_'$T'_'eps'_'$eps

cd $dir

../probabs <<EOF
$inp1
$inp2
$out
EOF

mv $out $inp2

cd ..


inp2='recurrentes_fixation_'$S'_'$T'_'$eps$suf
inp1='Q-markov-chain_fixation_'$S'_'$T'_'$eps$suf
out='recurrentes_estac_fixation_'$S'_'$T'_'$eps$suf

dir='S_'$S'_T_'$T'_'eps'_'$eps

cd $dir

../estac_recurren <<EOF
$inp1
$inp2
$out
EOF

#mv $out $inp2

cd ..

done
