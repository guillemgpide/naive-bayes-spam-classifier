function [dadesOut] = preparaDades_b(dadesIn)
    stopwords = ["the", "is", "and", "to", "of", "a", "i", "you", "it", "in", "for", "on", "my", "your"];
    filterOut = [{'; '}; {': '}; {','}; {'!'}; {'?'}; {'$'}; {'+'}; {'*'}; {'='}; {'&'}; {'#'}; {'>'}; {'<'}; {'\\.'}];
    
    classes = dadesIn{1};
    data = dadesIn{2};
    cells = cell(size(data));
    
    for i = 1:size(data, 1)
        cells(i,1) = classes(i);
        msg = lower(data(i));
        for j = 1:1:length(filterOut)
            msg = regexprep(msg, filterOut{j}, ' ');
        end
        msg = regexprep(msg, '-', '');
        msg = regexprep(msg, ':)', ' :) ');
        msg = regexprep(msg, '  ', ' ');
        paraules = strsplit(msg{1});
        paraules = paraules(~ismember(paraules, stopwords));

        paraules = filtreClave_b(paraules);

        cells{i,2} = paraules;
    end
    dadesOut = cells;
end
