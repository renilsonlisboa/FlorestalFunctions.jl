module Functions

  using Statistics
  using StatsBase
  using DataFrames
  using CSV
  using XLSX
  using QML

    export descriptiveStatistics

    function descriptiveStatistics(x)
      results = x
"""///
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
          
        ]"""

        display(results)
    end
end
