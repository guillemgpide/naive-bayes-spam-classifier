function [ham, spam] = separaHamSpam_b(data)
    ham = {};
    spam = {};
    for i = 1:size(data, 1)
        if strcmp(data{i,1}, 'ham')
            ham{end+1,1} = data{i,2};
        else
            spam{end+1,1} = data{i,2};
        end
    end
end
