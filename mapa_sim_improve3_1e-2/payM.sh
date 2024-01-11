
#S=-0.5
#T=1.5

S=$1
T=$2
eps=$3
#eps=1.d-8


dir='S_'$S'_T_'$T'_eps_'$eps
mkdir $dir

outf='payM_'$S'_'$T'_'$eps'.dat'

./payM <<EOF
$eps
$S
$T
$outf
EOF

mv $outf $dir/.



