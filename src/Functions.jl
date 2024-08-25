module Functions

  using Statistics

    export DescrtiptiveStatistics

    function DescriptiveStatistics(x)
        n = length(x)
        Media = sum(x)/n
        pm = (maximum(x)+minimum(x))/2
        mediana = median(x)
        Moda=mode(x)
        AT = maximum(x)-minimum(x)
        s² = var(x)
        s = std(x)
        cv= (s/Media)*100
    end

end
