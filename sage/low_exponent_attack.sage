def coppersmith(f, N, epsilon = 0.03):
    f.change_ring(Integers(N))
    delta = f.degree()
    m = ceil(1/delta/epsilon)
    R.<x> = ZZ[]
    g = []
    for j in range(0, delta) :
        g.append([])
        for i in range(1, m+1) :
            g[j].append(x^j*N^i*f^(m-i))
    X = ceil(0.5*N^(1/delta - epsilon))
    #print(X)
    size = m*delta
    B = matrix(ZZ, size, size)
    k = 0
    for i in range(-m+1, 1):
        for j in range(0, delta):
            polylist = g[j][-i](X*x).list()
            vector = [0]*size
            vector[0:len(polylist)] = polylist
            vector.reverse()
            B.set_column(k, vector)
            k = k + 1
    coeffs = []
    coeffs = B.transpose().LLL().transpose().column(0).list()
    coeffs.reverse()
    g = 0*x
    for i in range(0, size) :
        g = g + Integer(coeffs[i]/X^i) * x^i
    roots = g.roots(multiplicities = False)
    result = []
    for i in range(0, len(roots)) :
        if gcd(N, f(roots[i])) >= N :
            result.append(roots[i])
    return result