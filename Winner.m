function [ PL ] = Winner(d, A, B, C, fc, X)
% d->metra
%fc-> GHz
% an C=23 tote SUBURBAN/URBAN, an C=20 RURAL

if((2<=fc && fc<=6) && (C==23 ||  C==20))  
    
        PL=A*log10(d) + B + C*log10(fc/5) + X; 
        
        
        
    

end
end

