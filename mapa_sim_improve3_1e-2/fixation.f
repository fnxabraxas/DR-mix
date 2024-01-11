
      program fixation

      implicit none
      character*80 inp,outp
      integer i,j,k,ii,jj,Nindiv,errorf
      double precision pay(16,16), probs(16), pfix(16,16),A(2,2),b(16),
     +		pfixinv(16,16), pfixt(16,16),db,pdb,difpay,difmax,sumdb,suml,
     + 		calcdpm,payii,payjj,num,den,aa,bb,cc,dd,kk,w
      parameter (Nindiv=1000)

      print*,'Input file with payoff matrix: '
      read(*,*) inp
      print*,'Output file:'
      read(*,*) outp

	kk=8.d0
	w=0.0000001d0


      open(10,file=inp,status='old')
      read(10,*)
      do i=1,16
	read(10,*) (pay(i,j),j=1,16)
      enddo
      close(10)

      pfix=0.d0
      do ii=1,16
      do jj=1,16
      if(ii.ne.jj) then
	aa=pay(ii,ii)
	bb=pay(ii,jj)
	cc=pay(jj,ii)
	dd=pay(jj,jj)


	pfix(ii,jj)=
     &   ((bb-aa)+(aa-cc)*(kk**2.d0)+(cc-dd)*(kk+1.d0))*w/(6.d0*kk)





      endif
	!print*, ii,jj, pfix(ii,jj)
      if (pfix(ii,jj).le.1.d-14) pfix(ii,jj)=0.d0
c				print*,'pfix: ',pfix(ii,jj), sumdb
      enddo
      enddo

      open(90,file=outp,status='unknown')
      write(90,'(A1,A)') '#',' node  node_invades    node_ends  Prob'
      do i=1,16
      do j=1,16
        if(i.ne.j) then		
       	  if(pfix(j,i).gt.0.d0) write(90,'(3I8,F20.16)') i,j,j,pfix(j,i)
          if(pfix(j,i).lt.1.d0) write(90,'(3I8,F20.16)')
     +		 i,j,i,1.d0-pfix(j,i)
        endif
      enddo
      enddo

      close(90)

      stop
      end


	double precision function calcdpm(A,np)

	implicit none
	double precision A(2,2)
	integer np
	integer k,k2, kb,k2b
	!double precision maximo, minimo
	calcdpm=0.d0
	do k=1,np
	  do k2=1,np
		do kb=k+1,np
		  !do k2b=1,np
	  		if(abs(A(k,k2)-A(kb,k2)).gt.calcdpm) 
     +				calcdpm=abs(A(k,k2)-A(kb,k2)) !+1.d-16
		  !enddo
		enddo
	  enddo
	enddo
	!calcdpm=maxval(A)-minval(A)

	return
	end


