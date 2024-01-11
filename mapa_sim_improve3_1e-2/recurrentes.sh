
#S=-0.5
#T=1.5
#eps=1.d-8


S=$1
T=$2
eps=$3


inp1='alllinks_'$S'_'$T'_'$eps'.dat'
out='recurrentes_1_'$S'_'$T'_'$eps'.dat'

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


out2='cuasi_'$S'_'$T'_'$eps'.dat'

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


out3='recurrentes_'$S'_'$T'_'$eps'.dat'

../recurrentes <<EOF
$out
$out2
$out3
EOF

rm $out
rm $out2


cd ..
