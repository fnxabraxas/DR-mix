for i in  prision_cent prision_4upright nowak_3downc nowak_11 nowak_12  nowak_3upc  nowak_10down nowak_10up nowak_9down nowak_9up nowak_3up  nowak3_down nowak_1 nowak_2  super_weak_axel chicken_upleft chicken_up4 chicken_downright  chicken_up out_5 prision_border_right  chicken_right chicken_upright  out_2 out_3 border_har_chick chicken_4 chicken  chicken_4b centro prision_border_up   out_8  border_har_stag dead_har out_6 out_7  out_9 out_10  harmony_sup   out_1  prision_4  prision_cent   prision_border_left   prision_out  harmony_v stag harmony_4 deadlock  prision_border_right prision_cent out_4 
do

eps=1.d-2

if [ $i = nowak_10up ]; then
	T=0.75
	S=-0.25
fi

if [ $i = nowak_10down ]; then
	T=0.25
	S=-0.75
fi

if [ $i = nowak_9up ]; then
	T=-0.25
	S=0.75
fi

if [ $i = nowak_9down ]; then
	T=-0.75
	S=0.25
fi

if [ $i = nowak_3upc ]; then
	T=0.75
	S=1.75
fi

if [ $i = nowak_3downc ]; then
	T=0.25
	S=1.25
fi


if [ $i = prision_4upright ]; then
	T=1.75
	S=0.75
fi

if [ $i = nowak_3up ]; then
	T=0.75
	S=1.5
fi

if [ $i = nowak_3down ]; then
	T=0.5
	S=1.25
fi

if [ $i = nowak_1 ]; then
	T=1.25
	S=1.75
fi


if [ $i = nowak_2 ]; then
	T=1.75
	S=1.25
fi

if [ $i = nowak_11 ]; then
	T=-0.75
	S=-0.25
fi


if [ $i = nowak_12 ]; then
	T=-0.25
	S=-0.75
fi


if [ $i = prision_cent ]; then
	T=1.5
	S=-0.5
fi

if [ $i = prision_4 ]; then
	T=1.25
	S=-0.25
fi

if [ $i = prision_border_left ]; then
	T=1.0
	S=-0.5
fi

if [ $i = prision_border_up ]; then
	T=1.5
	S=0
fi

if [ $i = prision_out ]; then
	T=2.5
	S=-0.5
fi

if [ $i = chicken ]; then
	T=1.5
	S=0.5
fi

if [ $i = harmony_v ]; then
	T=0.5
	S=0.5
fi

if [ $i = stag ]; then
	T=0.5
	S=-0.5
fi

if [ $i = harmony_4 ]; then
	T=0.75
	S=0.25
fi

if [ $i = deadlock ]; then
	T=-0.5
	S=1.5
fi

if [ $i = centro ]; then
	T=1.0
	S=0
fi

if [ $i = prision_border_right ]; then
	T=2.0
	S=-0.5
fi

if [ $i = out_1 ]; then
	T=0.5
	S=1.5
fi

if [ $i = out_2 ]; then
	T=1.5
	S=1.5
fi

if [ $i = out_3 ]; then
	T=2.5
	S=1.5
fi

if [ $i = out_4 ]; then
	T=2.5
	S=0.5
fi

if [ $i = out_5 ]; then
	T=2.5
	S=-1.5
fi

if [ $i = out_6 ]; then
	T=1.5
	S=-1.5
fi

if [ $i = out_7 ]; then
	T=0.5
	S=-1.5
fi


if [ $i = out_8 ]; then
	T=-0.5
	S=-1.5
fi


if [ $i = out_9 ]; then
	T=-0.5
	S=-0.5
fi


if [ $i = out_10 ]; then
	T=-0.5
	S=0.5
fi

if [ $i = harmony_sup ]; then
	T=0.25
	S=0.75
fi


if [ $i = border_har_stag ]; then
	T=0.5
	S=0
fi


if [ $i = border_har_chick ]; then
	T=1.0
	S=0.5
fi


if [ $i = chicken_4 ]; then
	T=1.25
	S=0.25
fi


if [ $i = chicken_4b ]; then
	T=1.5
	S=0.25
fi

if [ $i = dead_har ]; then
	T=0
	S=1.0
fi


if [ $i = chicken_up ]; then
	T=1.5
	S=1.0
fi

if [ $i = chicken_right ]; then
	T=2.0
	S=0.5
fi

if [ $i = chicken_upright ]; then
	T=2.0
	S=1.0
fi

if [ $i = chicken_upleft ]; then
	T=1.0
	S=1.0
fi

if [ $i = chicken_up4 ]; then
	T=1.5
	S=0.75
fi

if [ $i = chicken_downright ]; then
	T=2.0
	S=0
fi

if [ $i = super_weak_axel ]; then
	T=2.5
	S=0
fi


dir='S_'$S'_T_'$T'_eps_'$eps

inpR='recurrentes_estac_fixation_'$S'_'$T'_'$eps'.dat'
outM='S_'$S'_T_'$T'.mat'

cp ../mapa_sim_improve3_1e-2/$dir/$inpR .


./bringdata_fix << EOF
$inpR
$outM
EOF

rm $inpR
mv $outM data/.

cd data
if [ $S = 1.0 ]; then
 if [ $T = 1.0 ]; then
	outf='S_1_T_1.mat'
	mv $outM $outf
 else
  if [ $T = 2.0 ]; then
	outf='S_1_T_2.mat'
	mv $outM $outf
  else
	outf='S_1_T_'$T'.mat'
	mv $outM $outf
  fi
 fi
fi
if [ $S = 2.0 ]; then
 if [ $T = 1.0 ]; then
	outf='S_2_T_1.mat'
	mv $outM $outf
 else
  if [ $T = 2.0 ]; then
	outf='S_2_T_2.mat'
	mv $outM $outf
  else
	outf='S_2_T_'$T'.mat'
	mv $outM $outf
  fi
 fi
fi
if [ $T = 1.0 ]; then
	outf='S_'$S'_T_1.mat'
	mv $outM $outf
fi
if [ $T = 2.0 ]; then
	outf='S_'$S'_T_2.mat'
	mv $outM $outf
fi
cd ..

done
