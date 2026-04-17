function [bagOfWords, countTotal] = generaBagOfWords_b(data)
    tmpMap = containers.Map();
    countTotal = 0;
    
    for i = 1:size(data, 1)
        msg = data{i};
        for j = 1:length(msg)
            word = msg{j};
            if isKey(tmpMap, word)
                tmpMap(word) = tmpMap(word) + 1;
            else
                tmpMap(word) = 1;
            end
            countTotal = countTotal + 1;
        end
    end

    keys = tmpMap.keys;
    bagOfWords = containers.Map();
    countTotal = 0;
    for i = 1:length(keys)
        if tmpMap(keys{i}) >= 3
            bagOfWords(keys{i}) = tmpMap(keys{i});
            countTotal = countTotal + tmpMap(keys{i});
        end
    end
end
