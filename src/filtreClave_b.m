function paraulesOut = filtreClave_b(paraulesIn)
    
    paraulesOut = cell(size(paraulesIn));
    for i = 1:length(paraulesIn)
        mot = paraulesIn{i};
        mot = regexprep(mot, '(ing|ed|es|s)$', '');
        paraulesOut{i} = mot;
    end
end
