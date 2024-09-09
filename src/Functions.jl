module Functions

  using Statistics
  using StatsBase

    export DescrtiptiveStatistics

    function DescriptiveStatistics(x)

        results = [
          length(x); 
          sum(x)/length(x); 
          mode(x); 
          median(x); 
          (maximum(x)+minimum(x))/2; 
          maximum(x)-minimum(x); 
          var(x); 
          std(x); 
          (var(x); std(x))/sqrt(length(x)); 
          ((var(x); std(x))/(mean(x)))*100
        ]

        return results
    end

end
