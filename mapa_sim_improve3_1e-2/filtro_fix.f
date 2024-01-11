
		program filtro_fix
	
		implicit none
		character*80 inp,outp
		integer i,j,k
		double precision p,pm,lim

      print*,'Input file with payoff matrix: '
      read(*,*) inp
		print*,'Precision in probability'
		read(*,*) lim
      print*,'Output file:'
      read(*,*) outp

      open(10,file=inp,status='old')
      read(10,*)
      open(90,file=outp,status='unknown')
      write(90,'(A1,A)') '#',' node  node_invades    node_ends  Prob'
		do
			read(10,*,end=50) i,j,k,p
			pm=lim*nint(p/lim)
			if(pm.gt.0.d0) write(90,'(3I8,F20.16)') i,j,k,pm
		enddo
 50	continue
		close(10)
		close(90)

		stop
		end
