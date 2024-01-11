	program bringdata

	implicit none
	character*80 inpR,outM
	real t,pR(999),pNR(999,9999),X(9999,16)
	integer nx,nR,nNR(999),nodNR(999,9999),i,j,k,maxnNR 


	pR=0.
	pNR=0.
	X=0.
	nx=0
	nR=0
	nNR=0
	nodNR=0
	maxnNR=0

	print*,'Recurrentes_estac input file: '
	read(*,*) inpR
	print*,'Matlab format output file: '
	read(*,*) outM

	X=0.
	nx=16
	do i=1,16
	  X(i,i)=1.
	enddo

	nodNR=0
	open(10,file=inpR,status='old')
	read(10,*)
	read(10,*)
	nR=0
	do
	  nR=nR+1
	  read(10,*,end=60) t,pR(nR),nNR(nR)
	  if(t.gt.0) goto 60
	  do i=1,nNR(nR)
	    read(10,*) nodNR(nR,i), pNR(nR,i)
	  enddo
	enddo
 60	continue
	nR=nR-1
	close(10)

	maxnNR=maxval(nNR)
	open(90,file=outM,status='unknown')
	do i=1,nR
	  write(90,'(I8,E12.4,16I8,A,$)') nNR(i),pR(i),(0,k=1,16),'  '
	enddo
	write(90,*)
	do j=1,maxnNR
	  do i=1,nR
	    if(nodNR(i,j).gt.0) then
		write(90,'(I8,E12.4,16F8.4,A,$)')
     &            nodNR(i,j), pNR(i,j), (X(nodNR(i,j),k),k=1,16),'  '
	    else
		write(90,'(I8,I12,16I8,A,$)') (0,k=1,18),'  '
	    endif
	  enddo
	  write(90,*)
	enddo
	close(90)

	stop
	end


