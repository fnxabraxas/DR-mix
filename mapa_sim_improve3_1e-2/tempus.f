
		program tempus

		implicit none
		character*80 input,output
		double precision pay(16,16),calcdpm,tabs,sumrhoi,sum2,numrhoi, 
     +    denrhoi,rhoi(999999),db(999999),sumrhoj,A(2,2),calcpdm,difpay 
	  	double precision birth(999999),death(999999),payii,payjj,difmax
	  	double precision  rhoi2(999999),sumrhoi2
		integer Nindiv,i,j,k,ii,jj,r

		Nindiv=1000

      print*,'Input file with payoff matrix: '
      read(*,*) input
      print*,'Output file:'
      read(*,*) output

      open(10,file=input,status='old')
      read(10,*)
      do i=1,16
			read(10,*) (pay(i,j),j=1,16)
      enddo
      close(10)

		open(90,file=output,status='unknown')
		do ii=1,16
		
			do jj=1,16

			 if(ii.ne.jj) then

				tabs=0.d0
				A(1,1)=pay(ii,ii)
				A(1,2)=pay(ii,jj)
				A(2,1)=pay(jj,ii)
				A(2,2)=pay(jj,jj)
				difmax=calcdpm(A,2)
					!print*,A,difmax
				if(difmax.le.1.d-14) then
					tabs=-1
					goto 50
				endif

				birth=0.d0
				death=0.d0
				do k=1,Nindiv-1
					payii=( pay(ii,ii)*k+pay(ii,jj)*(Nindiv-k) )/Nindiv
	    			payjj=( pay(jj,ii)*k+pay(jj,jj)*(Nindiv-k) )/Nindiv
	    			difpay=payjj-payii
						if(k.eq.1) print*,payjj,payii,difpay
						if(k.eq.(Nindiv-1)) print*,payjj,payii,difpay
					birth(k)=(1.d0-difpay/difmax)/(2.d0*k*(Nindiv-k))
					death(k)=(1.d0+difpay/difmax)/(2.d0*k*(Nindiv-k))
					!print*,k,birth(k),death(k),difpay,difmax
				enddo
					
						print*,birth(1),death(1),birth(Nindiv-1),death(Nindiv-1)
				rhoi=0.d0
				rhoi2=0.d0
				db=0.d0
				rhoi(1)=0.d0
				rhoi2(1)=0.d0
				rhoi(2)=birth(1)/(death(1)*death(2))
				rhoi2(2)=death(Nindiv-1)/(birth(Nindiv-1)*birth(Nindiv-2))
				sumrhoi=rhoi(2)
				sumrhoi2=rhoi2(2)
					print*,death(1),death(2),birth(1),birth(2)
					print*,2,rhoi(2),sumrhoi,rhoi2(2),sumrhoi2
				do i=3,Nindiv-1
					rhoi(i)=rhoi(i-1)*birth(i-1)/death(i)
					rhoi2(i)=rhoi2(i-1)*death(Nindiv-1)/birth(Nindiv-i)
					sumrhoi=sumrhoi+rhoi(i)
					sumrhoi2=sumrhoi2+rhoi2(i)
						!print*,i,rhoi(i),sumrhoi,rhoi2(i),sumrhoi2
						!if(i.eq.200) stop				

c					numrhoi=1.d0
c					denrhoi=1.d0
c					do j=1,i-1
c						numrhoi=numrhoi*birth(j)
c						denrhoi=denrhoi*death(j)
c					enddo
c					if (numrhoi.lt.1.d-14) then
c						if(denrhoi.lt.1.d-14) then
c							db(i)=1.d0
c						else
c							tabs=-9999
c							goto 50
c						endif
c					else
c						db(i)=(denrhoi/numrhoi)
c					endif
c					denrhoi=denrhoi*death(i)*1.d0/(difmax*2.d0*i*(Nindiv-i))
c
c						print*,i,numrhoi,denrhoi
c					if (denrhoi.lt.1.d-14) then
c						if(numrhoi.lt.1.d-14) then
c							rhoi(i)=1.d0
c						else
c							tabs=-9999
c							goto 50
c						endif
c					else
c						rhoi(i)=(numrhoi/denrhoi)
c					endif
c					sumrhoi=sumrhoi+rhoi(i)
				enddo	
c
c					print*, sumrhoi
c
c				sum2=0.d0
c				do r=1,Nindiv-2
c					sumrhoj=0.d0
c					do j=r+1,Nindiv-1
c						sumrhoj=sumrhoj+rhoi(j)
c					enddo
c					sum2=sum2+(db(r)*sumrhoj)
c				enddo
c
c				tabs=sumrhoi+sum2
c
 50			continue
				write(90,'(2I4,2E14.4)') ii,jj,sumrhoi,sumrhoi2

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

