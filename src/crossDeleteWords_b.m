function [hamBagOut, spamBagOut, testOut] = crossDeleteWords_b(hamBag, spamBag, test)
    hamKeys = hamBag.keys;
    spamKeys = spamBag.keys;
    comunes = intersect(hamKeys, spamKeys);

    toDelete = {};
    for i = 1:length(comunes)
        k = comunes{i};
        fHam = hamBag(k);
        fSpam = spamBag(k);
        total = fHam + fSpam;
        r = abs(fHam - fSpam) / total;
        if r < 0.25 
            toDelete{end+1} = k;
            remove(hamBag, k);
            remove(spamBag, k);
        end
    end

    testOut = test;
    for i = 1:size(test,1)
        testOut{i,2} = setdiff(test{i,2}, toDelete);
    end

    hamBagOut = hamBag;
    spamBagOut = spamBag;
end
