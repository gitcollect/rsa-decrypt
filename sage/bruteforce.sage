def BF_attack(M, r=7, ep=0.03) :
    p = 37975227936943673922808872755445627854565536638199
    q = 40094690950920881030683735292761468389214899724061
    N = p*q
    C = power_mod(M, r, N)
    mu = ceil(0.5*N^(1/r - ep))
    print "mu =", mu
    offset =  int(random()*(2*mu+1))-mu
    Mprime = abs(offset + M)
    t = cputime()
    for x in range(-2*offset, 2*offset) :
        if (Mprime + x)^r == C or gcd((Mprime + x)^r - C, N) >= N :
            print(x, offset)
            break
    print(cputime(t))