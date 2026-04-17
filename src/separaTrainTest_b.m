function [train, test] = separaTrainTest_b(all, rTrain)
    all = all(randperm(size(all, 1)), :);
    N = round(rTrain * size(all, 1));
    train = all(1:N, :);
    test = all(N+1:end, :);
end
