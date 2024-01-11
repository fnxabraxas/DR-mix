
      include "sub_varias.f"

      program PayoffM

	character*80 output
	integer s(2), n
	double precision eps, p(4,2), M(4,4),v(4),Rp,Sp,Tp,Pp,PayM(16,16)

	Rp=1.d0
	Pp=0.d0

	write(*,*) 'Epsilon: '
	read(*,*) eps
	write(*,*) 'S, T (R=1,P=0 considered): '
	read(*,*) Sp, Tp
	write(*,*) 'Output file (payoff matrix): '
	read(*,*) output
		  
	open(90,file=output,status='unknown')
	write(90,'(A,4F8.2)') '#  (R,S,T,P)= ',Rp,Sp,Tp,Pp

	do i=0,15
	  do j=0,15

		s(1)=i
		s(2)=j

		call s2bin(s,eps,p)

		call createM(p,M)

		call autovest(M,v)

		PayM(i+1,j+1)=v(1)*Rp+v(2)*Sp+v(3)*Tp+v(4)*Pp


	  enddo
	enddo
	
	do i=1,16
	  write(90,'(16F22.16)') (PayM(i,j),j=1,16)
	enddo

	close(90)

      stop
      end




      subroutine s2bin(s,eps,p)
	integer s(2)
	double precision eps, p(4,2)

	integer it,jt
	double precision tmp, tmp1

	p=0.d0+eps

	do it=1,2
	  tmp1=s(it)
	  do jt=1,3

	    tmp=int(tmp1/2.d0)
	    if(tmp.ne.(tmp1/2)) p(5-jt,it)=1.d0-eps
	    tmp1=tmp

	  enddo
	  if(tmp.eq.1) p(1,it)=1.d0-eps
	enddo


      return
      end



      subroutine createM(p,M)

	double precision p(4,2), M(4,4)


	M(1,1)=p(1,1)*p(1,2)
	M(1,2)=p(1,1)*(1-p(1,2))
	M(1,3)=(1-p(1,1))*p(1,2)
	M(1,4)=(1-p(1,1))*(1-p(1,2))

	M(2,1)=p(2,1)*p(3,2)
	M(2,2)=p(2,1)*(1-p(3,2))
	M(2,3)=(1-p(2,1))*p(3,2)
	M(2,4)=(1-p(2,1))*(1-p(3,2))

	M(3,1)=p(3,1)*p(2,2)
	M(3,2)=p(3,1)*(1-p(2,2))
	M(3,3)=(1-p(3,1))*p(2,2)
	M(3,4)=(1-p(3,1))*(1-p(2,2))

	M(4,1)=p(4,1)*p(4,2)
	M(4,2)=p(4,1)*(1-p(4,2))
	M(4,3)=(1-p(4,1))*p(4,2)
	M(4,4)=(1-p(4,1))*(1-p(4,2))


      return
      end



      subroutine autovest(M,v)

	double precision M(4,4), v(4), Mt(4,4), A(3,3), b(3),
     +		 invA(3,3), vt(3)
	integer errorflag

	do it=1,4
	  do jt=1,4
		Mt(it,jt)=M(jt,it)
	  enddo
	enddo

	do it=1,4
	  Mt(it,it)=Mt(it,it)-1.d0
	enddo

	do it=1,3
	 do jt=1,3
	    A(it,jt)=Mt(it,jt)
	 enddo
	 b(it)=-Mt(it,4)
	enddo

	call FINDInv(A, invA, 3, errorflag)
	if(errorflag.ne.0) stop 'NO SE HA CALCULADO INVERSA'

	vt=matmul(invA,b)
	do it=1,3
	   v(it)=vt(it)/(vt(1)+vt(2)+vt(3)+1.d0)
	enddo
	v(4)=1.d0/(vt(1)+vt(2)+vt(3)+1.d0)


      return
      end







