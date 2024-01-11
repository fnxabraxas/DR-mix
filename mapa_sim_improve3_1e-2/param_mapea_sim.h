	double precision M(16,16)
	common /patmatrix/ M

	integer, parameter :: Nc = (2**16)-1
	double precision X(Nc,16)
	integer nodoboo(Nc), nodobooinv(Nc), nX(Nc), nnodos, lk(Nc)
	common /ppal/ X, nodoboo,nodobooinv, nX, nnodos, lk
