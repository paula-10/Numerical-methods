function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
    for i=1:size(InitialMatrix,1)
        k = 1;
        for j=1:size(InitialMatrix,2)
            if strcmp(InitialMatrix(i,j),'yes')
                FeatureMatrix(i,k) = 1;
                k = k + 1;
            elseif strcmp(InitialMatrix(i,j),'no')
                FeatureMatrix(i,k) = 0;
                k = k + 1;
            elseif strcmp(InitialMatrix(i,j),'semi-furnished')
                FeatureMatrix(i,k) = 1;
                FeatureMatrix(i,k+1) = 0;
                k = k + 2;
            elseif strcmp(InitialMatrix(i,j),'unfurnished')
                FeatureMatrix(i,k) = 0;
                FeatureMatrix(i,k+1) = 1;
                k = k + 2;
            elseif strcmp(InitialMatrix(i,j),'furnished')
                FeatureMatrix(i,k) = 0;
                FeatureMatrix(i,k + 1) = 0;
                k = k + 2;
            else
                FeatureMatrix(i, k) = str2double(InitialMatrix(i, j));
                k = k + 1;
           endif
       endfor
    endfor

endfunction