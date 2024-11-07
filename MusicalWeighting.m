function [output, ff] = MusicalWeighting(fc, sig)

ff = linspace(log2(fc/16), log2(fc*16), 100);

output = exp( (-(ff - log2(fc)).^2) / (2*sig^2) );

end