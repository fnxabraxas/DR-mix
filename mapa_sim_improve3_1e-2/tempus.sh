S=$1
T=$2
eps=$3


inp='payM_'$S'_'$T'_'$eps'.dat'
out='tempus_fixation_'$S'_'$T'_'$eps'.dat'

dir='S_'$S'_T_'$T'_'eps'_'$eps

cd $dir

../tempus <<EOF
$inp
$out
EOF

cd ..
