
	program renorm_sim

	implicit none
	character *80 inpf,outf
	integer i,j,k,n
	double precision p,ep,suma, M(999,16,999) !,2)


	print*,'All-links file: '
	read(*,*) inpf
	print*,'Output file: '
	read(*,*) outf

	M=0.d0
	open(10,file=inpf,status='old')
	read(10,*)
	n=0
	do
	  read(10,*,end=50) i,j,k,p,ep
	  if(i.gt.n) n=i
	  M(i,j,k)=p
	  !M(i,j,k,2)=ep		
	enddo
 50	continue
	close(10)

	do i=1,n
	  do j=1,16
	    
	    suma=0.d0
	    do k=1,n
		suma=suma+M(i,j,k)
	    enddo
	    if(suma.eq.0.d0) suma=1.d0
	    do k=1,n
		M(i,j,k)=M(i,j,k)/suma
	    enddo
	    if(suma.lt.1) print*,i,j,suma

	  enddo
	enddo

	open(90,file=outf,status='unknown')
	write(90,'(A1,A)') '#',' node  node_invades    node_ends  Prob '
	do i=1,n
	  do j=1,16
	    do k=1,n
		if(M(i,j,k).gt.0) write(90,'(3I8,F8.4)') i,j,k, M(i,j,k)
	    enddo
	  enddo
	enddo
	close(90)

	stop
	end


