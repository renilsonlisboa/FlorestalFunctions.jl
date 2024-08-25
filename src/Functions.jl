module Functions

  using Statistics

    export DescrtiptiveStatistics

    function DescriptiveStatistics(x, Vector{Float64})
        n = length(x)
        Media = sum(x)/n
        Moda = mode(x)
        Mediana = median(x)
        Pm = (maximum(x)+minimum(x))/2
        At = maximum(x)-minimum(x) 
        s² = var(x)
        s = std(x)
        sx  = s/sqrt(n)
        Cv= (s/(mean(x)))*100
    end

end
