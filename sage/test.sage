def RSA_Attack_Timed(M, Mprime, r = 5, ep = 0.03):
    p = 37975227936943673922808872755445627854565536638199
    q = 40094690950920881030683735292761468389214899724061
    N = p*q
    C = power_mod(M, r, N)
    mu = ceil(0.5*N^(1/r - ep))
    print "mu =", mu
    offset =  M - Mprime
    R.<x> = ZZ[]
    f = (Mprime + x)^r - C
    t = cputime()
    result = coppersmith(f, N, ep)
    print(result, offset)
    print "decrypt time=", cputime(t)

 def RSA_attack(M, r = 3, ep = 0.03):
    p = 37975227936943673922808872755445627854565536638199
    q = 40094690950920881030683735292761468389214899724061
    N = p*q
    C = power_mod(M, r, N)
    mu = ceil(0.5*N^(1/r - ep))
    print "mu =", mu
    offset =  int(random()*(2*mu+1))-mu
    Mprime = abs(offset + M)
    R.<x> = ZZ[]
    f = (Mprime + x)^r - C
    t = cputime()
    result = coppersmith(f, N, ep)
    print(result, offset)
    return cputime(t)*1.0
   