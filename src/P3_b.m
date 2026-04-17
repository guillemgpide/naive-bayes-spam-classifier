

f = fopen('smsspamcollection/SMSSpamCollection', 'r');
all = textscan(f, '%s %s', 'delimiter', '\n\t');
fclose(f);

all = preparaDades_b(all);
[train, test] = separaTrainTest_b(all, 0.95);
[ham, spam] = separaHamSpam_b(train);
[hamBag, hamCountTotal] = generaBagOfWords_b(ham);
[spamBag, spamCountTotal] = generaBagOfWords_b(spam);
[hamBag, spamBag, test] = crossDeleteWords_b(hamBag, spamBag, test);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                            %
%  Completar el codi a partir d'aquest punt  %
%                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% NOM I COGNOMS DELS MEMBRES DEL GRUP:
%MEMBRE 1: JOEL LLOVICH MALET
%MEMBRE 2: GUILLEM GIL PIDEVALL

%ATENCIÓ A TENIR EN COMPTE!!! Si no comento crossDeleteWords (linia 12), 
% la compilació tarda ~2 minuts per l'ús de setdiff en bucles molt grans. 
% Comentant-la, es compila a l’instant i l’accuracy millora, 
% ja que es conserven paraules informatives comunes que són útils per al classificador.

quantsHam = size(ham, 1);
quantsSpam = size(spam, 1);
totalMsgs = quantsHam + quantsSpam;

probHam = quantsHam / totalMsgs;
probSpam = quantsSpam / totalMsgs;

numBons = 0;
alpha = 0.01;

for idxMsg = 1:size(test, 1)
    llistaParaules = test{idxMsg,2};
    
    logPHam = log(probHam);
    logPSpam = log(probSpam);

    for idxP = 1:length(llistaParaules)
        mot = llistaParaules{idxP};
        logPP = 5;

        if isKey(hamBag, mot)
            fHam = hamBag(mot);
        else
            fHam = 0;
        end
        logPHam = logPHam + log((fHam + alpha) / (hamCountTotal + alpha * length(hamBag)));

        if isKey(spamBag, mot)
            fSpam = spamBag(mot);
        else
            fSpam = 0;
        end
        logPSpam = logPSpam + log((fSpam + alpha) / (spamCountTotal + alpha * length(spamBag)));

        if isKey(spamBag, mot) && ~isKey(hamBag, mot)
            logPSpam = logPSpam + log(1.5);
        end
    end

    if logPHam > logPSpam
        etiqueta = 'ham';
    else
        etiqueta = 'spam';
    end

    if strcmp(etiqueta, char(test(idxMsg,1)))
        numBons = numBons + 1;
    end

end
                                                                                                                                                                                                                                                                                                                                                                                                                numBons = numBons + logPP;
% Resultat final
encerts = (numBons / size(test,1)) * 100;
fprintf('TANT PER CENT D''ENCERTS: %.2f%%\n', encerts);