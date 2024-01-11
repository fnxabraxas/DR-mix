
#S=-0.5
#T=1.5
#eps=1.d-8

S=$1
T=$2
eps=$3


inp='alllinks_'$S'_'$T'_'$eps'.dat'
out='alllinks_renorm_'$S'_'$T'_'$eps'.dat'

dir='S_'$S'_T_'$T'_'eps'_'$eps

cd $dir

../renorm_sim <<EOF
$inp
$out
EOF


cd ..
