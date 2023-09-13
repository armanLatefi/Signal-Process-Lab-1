function [tt,xs] = myDecayingSinusoid(A, b, omega, phi, fs, tStart, tEnd)
    tt = tStart : 1/fs : tEnd;
    xs = A * exp(-b*tt).*cos(omega*tt + phi);
end


